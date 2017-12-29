Public Class Frm_RevisiTicket
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
    Public Sub Cleartext()
        lbl_id.Text = "#"
        gv_listrevisi.DataBind()
        lbl_noTA.Text = "#"
        lbl_noST.Text = "#"
        lbl_nama.Text = "#"
        lbl_tanggal.Text = "#"
        lbl_maskapai.Text = "#"
        lbl_dari.Text = "#"
        lbl_tujuan.Text = "#"
        lbl_kode.Text = "#"
        lbl_revisi.Text = "#"
        lbl_dari_Rev.Text = "#"
        lbl_tujuan_Rev.Text = "#"
        lbl_Tanggal_Rev.Text = "#"
        txt_servicefee.Text = "25000"
        lbl_Ket_Rev.Text = "#"
        txt_kodebooking.Text = ""
        txt_nomortiket.Text = ""
        txt_biaya.Text = ""
        ddl_maskapai.DataBind()
        ddl_kelas.DataBind()
        ddl_jam.DataBind()
    End Sub
   

   
    Dim ID As Integer = Nothing
    Protected Sub gv_listrevisi_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Cleartext()
            lbl_id.Text = gv_listrevisi.DataKeys(e.NewSelectedIndex).Value
            Get_DataSebelum(lbl_id.Text, lbl_noTA.Text, lbl_noST.Text, lbl_nama.Text, lbl_tanggal.Text, lbl_maskapai.Text, lbl_dari.Text, lbl_tujuan.Text, lbl_kode.Text, lbl_revisi.Text, lbl_Ket_Rev.Text)
            Dim i_str_maskapai As String = Nothing
            Dim i_str_tujuan As String = Nothing
            Dim i_str_jam As String = Nothing
            Get_DataSesudah(lbl_id.Text, lbl_Tanggal_Rev.Text, i_str_maskapai, lbl_dari_Rev.Text, lbl_tujuan_Rev.Text, i_str_jam)
            ddl_maskapai.DataBind()
            'ddl_maskapai.SelectedItem.Text = i_str_maskapai
            ddl_jam.DataBind()
            ' ddl_jam.SelectedValue = i_str_jam
            ddl_kelas.DataBind()
            txt_servicefee.Text = "25000"
        Catch ex As Exception

        End Try


    End Sub

    Public Sub Get_DataSebelum(ByVal s_str_id As Integer, ByRef s_str_nomorTA As String, ByRef s_str_nomorST As String, ByRef s_str_nama As String, ByRef s_str_tanggal As String, ByRef s_str_maskapai As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String, ByRef s_str_kodebooking As String, ByRef s_str_revisi As String, ByRef s_str_remark As String)
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
            .CommandText = "SELECT TravelAuthorizeNo NomorTA, NomorST, Nama +' ('+ umur +')' Nama, Convert(varchar(10),Tanggal,105) +' '+ ISNULL(Berangkat,JamBerangkat) as Tanggal,Maskapai, Dari, Tujuan, TBLFLIGHT.KodeBooking, Revisi, TBL_T_REVISI_TICKET.Remark FROM TBL_T_REVISI_TICKET INNER JOIN TBLFLIGHT ON TBLFLIGHT.ID=TBL_T_REVISI_TICKET.IDFLIGHT WHERE TBL_T_REVISI_TICKET.ID_REV=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_nomorTA = dr.Item("NomorTA").ToString
                s_str_nomorST = dr.Item("NomorST").ToString
                s_str_nama = dr.Item("Nama").ToString
                s_str_tanggal = dr.Item("Tanggal").ToString
                s_str_maskapai = dr.Item("Maskapai").ToString
                s_str_dari = dr.Item("Dari").ToString
                s_str_tujuan = dr.Item("Tujuan").ToString
                s_str_kodebooking = dr.Item("KodeBooking").ToString
                s_str_revisi = dr.Item("Revisi").ToString
                s_str_remark = dr.Item("Remark").ToString
            Else
                s_str_nomorTA = "#"
                s_str_nomorST = "#"
                s_str_nama = "#"
                s_str_tanggal = "#"
                s_str_maskapai = "#"
                s_str_dari = "#"
                s_str_tujuan = "#"
                s_str_kodebooking = "#"
                s_str_revisi = "#"
                s_str_remark = "#"
            End If
        End With
        con.Close()
    End Sub

    Public Sub Get_DataSesudah(ByVal s_str_id As Integer, ByRef s_str_tanggal As String, ByRef s_str_maskapai As String, ByRef s_str_dari As String, ByRef s_str_tujuan As String, ByRef s_str_jam As String)
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
            .CommandText = "SELECT CASE WHEN MASKAPAI IN ('LION AIR' , 'BATIK AIR' , 'WINGS AIR') THEN 'LION AIR' WHEN MASKAPAI IN ('SRIWIJAYA AIR' , 'NAM AIR') THEN 'SRIWIJAYA AIR' ELSE Maskapai END Maskapai, Dari, Tujuan, Convert(varchar(10),Tanggal,105) Tanggal, Berangkat FROM TBL_T_REVISI_TICKET INNER JOIN TblFLight VW_TA_FLIGHT ON VW_TA_FLIGHT.ID=TBL_T_REVISI_TICKET.IDFLIGHT_REV WHERE TBL_T_REVISI_TICKET.ID_REV=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_tanggal = dr.Item("Tanggal").ToString
                s_str_maskapai = dr.Item("Maskapai").ToString
                s_str_dari = dr.Item("Dari").ToString
                s_str_tujuan = dr.Item("Tujuan").ToString
                s_str_jam = dr.Item("Berangkat").ToString
            Else
                s_str_tanggal = "#"
                s_str_maskapai = "#"
                s_str_dari = "#"
                s_str_tujuan = "#"
                s_str_jam = "#"
            End If
        End With
        con.Close()
    End Sub

    Public Sub Upd_Revisi(ByVal s_str_id As String, ByVal s_str_biaya As String, ByVal s_str_jam As String, ByVal s_str_maskapai As String, ByVal s_str_kode As String, ByVal s_str_kelas As String, ByVal s_str_servicefee As String, ByVal s_str_nomor As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_AGENT_REVISI_TICKET @ID, @BIAYA, @JAM, @MASKAPAI, @KODE, @KELAS, @SERVICEFEE, @NOMOR"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .Parameters.Add("@BIAYA", SqlDbType.Float).Value = s_str_biaya
            .Parameters.Add("@JAM", SqlDbType.VarChar, 5).Value = s_str_jam
            .Parameters.Add("@MASKAPAI", SqlDbType.VarChar, 10).Value = s_str_maskapai
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kode
            .Parameters.Add("@KELAS", SqlDbType.VarChar, 5).Value = s_str_kelas
            .Parameters.Add("@SERVICEFEE", SqlDbType.Float).Value = s_str_servicefee
            .Parameters.Add("@NOMOR", SqlDbType.VarChar, 25).Value = s_str_nomor
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        If lbl_id.Text <> "#" And lbl_revisi.Text <> "REFUND" Then
            Upd_Revisi(lbl_id.Text, txt_biaya.Text, ddl_jam.SelectedValue, ddl_maskapai.SelectedValue, txt_kodebooking.Text, ddl_kelas.SelectedValue, txt_servicefee.Text, txt_nomortiket.Text)
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
            Cleartext()
        ElseIf lbl_id.Text <> "#" And lbl_revisi.Text = "REFUND" Then
            Upd_Revisi(lbl_id.Text, 0, ddl_jam.SelectedValue, ddl_maskapai.SelectedValue, txt_kodebooking.Text, ddl_kelas.SelectedValue, 0, txt_nomortiket.Text)
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
            Cleartext()
        End If
    End Sub
End Class