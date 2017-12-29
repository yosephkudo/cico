Public Class Frm_ProsesRevisi_Ticket
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            CekAkses(Session("GPID"))
        Catch ex As Exception
            Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
        End Try
    End Sub
    Public Sub CekAkses(ByVal s_str_gp As String)

        'path = path.Replace("/Ticketing", "")
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT [LinkMenu] FROM [Vw_Menu] WHERE Deskripsi=@Deskripsi and LinkAkses=@Link"
            .Parameters.Add("@Deskripsi", SqlDbType.VarChar, 50).Value = s_str_gp
            .Parameters.Add("@Link", SqlDbType.VarChar, 500).Value = path
            dr = .ExecuteReader
            If dr.Read = False Then
                ' ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('" & path & "');", True)
                Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
            End If
            con.Close()
        End With

    End Sub
    Public IDRev As Integer
    Protected Sub gv_listrevisi_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            ClearText()
            Dim ID As String = gv_listrevisi.DataKeys(e.NewSelectedIndex).Value
            lbl_IdRev.Text = ID
            If ID <> "" Then
                Get_PrevRevisi(ID, lbl_noTA.Text, lbl_noST.Text, lbl_nama.Text, lbl_tanggal.Text, lbl_maskapai.Text, lbl_dari.Text, lbl_tujuan.Text, lbl_kode.Text, lbl_Ket_Rev.Text, lbl_agent.Text, lbl_revisi.Text)
                If lbl_revisi.Text = "REFUND" Then
                    lbl_Tanggal_Rev.Text = lbl_tanggal.Text
                    lbl_maskapai_Rev.Text = lbl_maskapai.Text
                    lbl_dari_Rev.Text = lbl_dari.Text
                    lbl_tujuan_Rev.Text = lbl_tujuan.Text
                Else
                    Get_NextRev(ID, lbl_Tanggal_Rev.Text, lbl_maskapai_Rev.Text, lbl_dari_Rev.Text, lbl_tujuan_Rev.Text)
                End If

            End If
        Catch ex As Exception
            ClearText()
        End Try
       
    End Sub


    Public Sub Get_PrevRevisi(ByVal s_str_id As Integer, ByRef s_str_noTA As String, ByRef s_str_noST As String, ByRef s_str_nama As String, ByRef s_str_Tanggal As String, ByRef s_str_maskapai As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String, ByRef s_str_kode As String, ByRef s_str_keterangan As String, ByRef s_str_agent As String, ByRef s_str_revisi As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT DISTINCT VW_TA_FLIGHT.NomorST, VW_TA_FLIGHT.Nama, VW_TA_FLIGHT.TravelAuthorizeNo AS NomorTA, ISNULL(TBL_T_REVISI_TICKET.KodeBooking, " & _
               "  DRV_ORDER.KodeBooking) AS KodeBooking, TBL_T_REVISI_TICKET.Revisi, TBL_T_REVISI_TICKET.Remark Keterangan," & _
               " ISNULL(DRV_ORDER.Dari,VW_TA_FLIGHT.Dari) Dari, ISNULL(DRV_ORDER.Tujuan,VW_TA_FLIGHT.Tujuan) Tujuan," & _
               " ISNULL(DRV_ORDER.FlightName,VW_TA_FLIGHT.Maskapai) Maskapai, ISNULL(DRV_ORDER.Tanggal,convert(varchar(10),VW_TA_FLIGHT.Tanggal,105) +' '+ Berangkat) Tanggal," & _
                " ISNULL(tblTravelAuthorization_Supplier_Reff.NamaSupplier,DRV_TA.NamaSupplier) as Agent FROM tblTravelAuthorization_Supplier_Reff INNER JOIN " & _
               " (SELECT idFlight, KodeSupplier, KodeBooking, FlightName, Departure Dari, Arrive Tujuan," & _
               " convert(varchar(10),TglBerangkat,105) +' '+ JamBerangkat as Tanggal FROM vw_TA_Tiket_onOrder WHERE (statusBiding = 1) UNION " & _
               " SELECT idFlight, KodeSupplier, KodeBooking, FlightName, Departure Dari, Arrive Tujuan, convert(varchar(10),TglBerangkat,105) +' '+ JamBerangkat as Tanggal " & _
               " FROM vw_TA_Tiket_onOrder_NonTA) AS DRV_ORDER ON tblTravelAuthorization_Supplier_Reff.KodeSupplier = DRV_ORDER.KodeSupplier RIGHT OUTER JOIN" & _
              "  TBL_T_REVISI_TICKET INNER JOIN VW_TA_FLIGHT ON TBL_T_REVISI_TICKET.IdFlight = VW_TA_FLIGHT.ID ON DRV_ORDER.idFlight = TBL_T_REVISI_TICKET.IdFlight " & _
              "  LEFT OUTER JOIN" & _
              "  ( select TA,NamaSupplier from (" & _
              "  select   Count(TravelAuthorizeNo) Jml, TravelAuthorizeNo  TA from tblTravelAuthorization_Supplier_Trans" & _
               " group by TravelAuthorizeNo) as drv_assign " & _
               " inner join tblTravelAuthorization_Supplier_Trans as Trans on Trans.TravelAuthorizeNo=drv_assign.TA" & _
               " inner join tblTravelAuthorization_Supplier_Reff as Agent on Agent.KodeSupplier=Trans.KodeSupplier" & _
               " where Jml=1) AS DRV_TA ON DRV_TA.TA=VW_TA_FLIGHT.TravelAuthorizeNo" & _
              "  WHERE (TBL_T_REVISI_TICKET.AssignBy IS NULL) AND (TBL_T_REVISI_TICKET.Status = 'GS BBSO') AND TBL_T_REVISI_TICKET.ID_REV=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_noTA = dr.Item("NomorTA").ToString
                s_str_noST = dr.Item("NomorST").ToString
                s_str_nama = dr.Item("Nama").ToString
                s_str_Tanggal = dr.Item("Tanggal").ToString
                s_str_maskapai = dr.Item("Maskapai").ToString
                s_str_dari = dr.Item("Dari").ToString
                s_str_tujuan = dr.Item("Tujuan").ToString
                s_str_kode = dr.Item("Kodebooking").ToString
                s_str_keterangan = dr.Item("Keterangan").ToString
                s_str_agent = dr.Item("Agent").ToString
                s_str_revisi = dr.Item("Revisi").ToString
            Else
                s_str_noTA = "#"
                s_str_noST = "#"
                s_str_nama = "#"
                s_str_Tanggal = "#"
                s_str_maskapai = "#"
                s_str_dari = "#"
                s_str_tujuan = "#"
                s_str_kode = "#"
                s_str_keterangan = "#"
                s_str_agent = "#"
                s_str_revisi = "#"
            End If
            con.Close()
        End With
    End Sub

    Public Sub Get_NextRev(ByVal s_str_id As Integer, ByRef s_str_tanggal As String, ByRef s_str_maskapai As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim dr As SqlClient.SqlDataReader = Nothing
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SELECT Convert(varchar(10),VW_TA_FLIGHT.Tanggal,105) +' '+ VW_TA_FLIGHT.Berangkat Tanggal,VW_TA_FLIGHT.Dari, VW_TA_FLIGHT.Tujuan, VW_TA_FLIGHT.Maskapai FROM TBL_T_REVISI_TICKET INNER JOIN TBLFLIGHT as VW_TA_FLIGHT ON VW_TA_FLIGHT.ID=TBL_T_REVISI_TICKET.IdFlight_Rev WHERE ID_REV=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_tanggal = dr.Item("Tanggal").ToString
                s_str_maskapai = dr.Item("Maskapai").ToString
                s_str_dari = dr.Item("Dari").ToString
                s_str_tujuan = dr.Item("Tujuan").ToString
            Else
                s_str_tanggal = "#"
                s_str_maskapai = "#"
                s_str_dari = "#"
                s_str_tujuan = "#"
            End If
            con.Close()
        End With
    End Sub
    Public Sub Upd_Process(ByVal s_str_nrp As String, ByVal s_str_id As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_PROCESS_REVISI_TICKET @BY, @ID"
            .Parameters.Add("@BY", SqlDbType.VarChar, 20).Value = s_str_nrp
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub ClearText()
        lbl_noTA.Text = "#"
        lbl_noST.Text = "#"
        lbl_nama.Text = "#"
        lbl_tanggal.Text = "#"
        lbl_maskapai.Text = "#"
        lbl_dari.Text = "#"
        lbl_tujuan.Text = "#"
        lbl_kode.Text = "#"
        lbl_revisi.Text = "#"
        lbl_Tanggal_Rev.Text = "#"
        lbl_maskapai_Rev.Text = "#"
        lbl_dari_Rev.Text = "#"
        lbl_tujuan_Rev.Text = "#"
        lbl_Ket_Rev.Text = "#"
        lbl_agent.Text = "#"
    End Sub

    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            If lbl_revisi.Text <> "#" And lbl_noST.Text <> "#" And lbl_nama.Text <> "#" Then
                Upd_Process(Session("nrp"), lbl_IdRev.Text)
                gv_listrevisi.DataBind()
                ClearText()
            End If
        Catch ex As Exception

        End Try
        
    End Sub
End Class