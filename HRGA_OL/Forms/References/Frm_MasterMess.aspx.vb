Public Class Frm_MasterMess
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
            If txt_kamar.Text <> "" And txt_kapasitas.Text <> "" And ddl_gedung.SelectedValue <> "" Then
                Ins_Kamar(ddl_gedung.SelectedValue, txt_kamar.Text, CInt(txt_kapasitas.Text), Session("Nrp"))
                gv_kamar.DataBind()
                txt_kamar.Text = ""
                txt_kapasitas.Text = ""
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil Tersimpan');", True)
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error : " & ex.Message & "');", True)
        End Try
      
    End Sub

    Public Sub Ins_Kamar(ByVal s_str_gedung As String, ByVal s_str_kamar As String, ByVal s_str_kapasitas As String, ByVal s_str_nrp As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "SP_INS_KAMAR @GEDUNG, @KAMAR, @KAPASITAS, @USER"
            .Parameters.Add("@GEDUNG", SqlDbType.Int).Value = s_str_gedung
            .Parameters.Add("@KAMAR", SqlDbType.VarChar, 10).Value = s_str_kamar
            .Parameters.Add("@KAPASITAS", SqlDbType.Int).Value = s_str_kapasitas
            .Parameters.Add("@USER", SqlDbType.VarChar, 15).Value = s_str_nrp
            .ExecuteNonQuery()
        End With
        con.Close()

    End Sub
End Class