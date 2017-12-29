Public Class Frm_IssuedTicket
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
        lbl_kodebooking.Text = "#"
        lbl_maskapai.Text = "#"
        lbl_NTA.Text = "#"
        lbl_servicefee.Text = "#"
        gv_detailtiket.DataBind()
        gv_issued.DataBind()
        btn_submit.Visible = False
    End Sub


    Private Sub btn_cancel_Click(sender As Object, e As EventArgs) Handles btn_cancel.Click
        Cleartext()
    End Sub

    Protected Sub gv_issued_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Dim Kode As String = gv_issued.Rows(e.NewSelectedIndex).Cells(1).Text
            Get_DetailIssued(Kode, lbl_maskapai.Text, lbl_NTA.Text, lbl_servicefee.Text)
            lbl_kodebooking.Text = Kode
            gv_detailtiket.DataBind()
            If lbl_kodebooking.Text <> "#" Then
                btn_submit.Visible = True
            Else
                Cleartext()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error');", True)
            Response.Write(ex.Message)
            Cleartext()
        End Try


    End Sub

    Public Sub Get_DetailIssued(ByRef s_str_kodebooking As String, ByRef s_str_maskapai As String, ByRef s_str_NTA As String, ByRef s_str_ServiceFee As String)
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
            .CommandText = "SELECT DISTINCT KodeBooking, FlightName, Tot_NTA, ServicesFee  FROM [vw_TA_Tiket_onOrder] Where KodeBooking=@KODE"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kodebooking
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_maskapai = dr.Item("FlightName").ToString
                s_str_NTA = dr.Item("Tot_NTA").ToString
                s_str_ServiceFee = dr.Item("ServicesFee").ToString
            Else
                s_str_kodebooking = "#"
                s_str_maskapai = "#"
                s_str_NTA = "#"
                s_str_ServiceFee = "#"
            End If
        End With
        con.Close()
    End Sub
    Public Sub Upd_Tiket(ByVal s_int_id As Integer, ByVal s_str_nomor As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SP_ISSUED_TIKET @NOMOR, @ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_int_id
            .Parameters.Add("@NOMOR", SqlDbType.VarChar, 20).Value = s_str_nomor
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Upd_Booking(ByVal s_str_kode As String)

        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE TBL_T_BOOKING SET [Status]='CLOSE' WHERE KodeBooking=@KodeBooking"
            .Parameters.Add("@KodeBooking", SqlDbType.VarChar, 10).Value = s_str_kode
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        If lbl_kodebooking.Text <> "#" Then
            For Each Row As GridViewRow In gv_detailtiket.Rows
                If Row.RowType = DataControlRowType.DataRow Then
                    Dim ID As Integer = gv_detailtiket.DataKeys(Row.RowIndex).Value.ToString
                    Dim NomorTiket As String = TryCast(Row.Cells(0).FindControl("txt_nomortiket"), TextBox).Text
                    If NomorTiket <> "" Then
                        Upd_Tiket(ID, NomorTiket)
                    End If
                   
                End If
            Next
            Upd_Booking(lbl_kodebooking.Text)
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
            Cleartext()
        End If
    End Sub
End Class