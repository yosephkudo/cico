Public Class Frm_SMSHotline
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
    Private Sub btn_submit_Click(sender As Object, e As EventArgs) Handles btn_submit.Click
        Try
            If txt_notujuan.Text <> "" And txt_isi.Text <> "" And txt_keperluan.Text <> "" Then
                Dim nomor() As String = Split(txt_notujuan.Text, vbCrLf)
                Dim arr As Array = nomor
                For Jml As Integer = 1 To arr.Length
                    Dim Tujuan As String = Trim(nomor(Jml - 1))
                    If Tujuan <> "" Then
                        Ins_SMS(Tujuan, txt_isi.Text, ddl_modem.SelectedValue, txt_keperluan.Text, Session("Nrp"))
                    End If
                Next
                txt_keperluan.Text = ""
                txt_isi.Text = ""
                txt_notujuan.Text = ""
                gv_listsms.DataBind()
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Data harus terisi lengkap');", True)
            End If
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try
       
    End Sub

    Public Sub Ins_SMS(ByVal s_str_nomor As String, ByVal s_str_isi As String, ByVal s_str_modem As String, ByVal s_str_keperluan As String, ByVal s_str_inputby As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO [DB_HCGS_HOTLINE].[dbo].[tbl_KirimSMS] (NoTujuan,Isi,Sent,Priority,Modem,Keperluan,InputBy) Values (@NOMOR,@ISI,0,0,@MODEM,@KEPERLUAN,@USER)"
            .Parameters.Add("@NOMOR", SqlDbType.VarChar, 15).Value = s_str_nomor
            .Parameters.Add("@ISI", SqlDbType.VarChar, 150).Value = s_str_isi
            .Parameters.Add("@MODEM", SqlDbType.VarChar, 2).Value = s_str_modem
            .Parameters.Add("@KEPERLUAN", SqlDbType.VarChar, 150).Value = s_str_keperluan
            .Parameters.Add("@USER", SqlDbType.VarChar, 15).Value = s_str_inputby
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
End Class