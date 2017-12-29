Public Class Frm_ConfirmEvent
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
    Protected Sub gv_listrequest_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim ID As String = gv_listrequest.DataKeys(e.RowIndex).Value
            Upd_Reject(ID)
            Alert_Confirm(ID, "REJECT")
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil di Reject');", True)
            gv_listrequest.DataBind()
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub

    Protected Sub gv_listrequest_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Dim ID As String = gv_listrequest.DataKeys(e.NewSelectedIndex).Value
            Upd_Konfirm(ID)
            Alert_Confirm(ID, "CONFIRM")
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Berhasil di Konfirm');", True)
            gv_listrequest.DataBind()
        Catch ex As Exception
            Response.Write("Error : " & ex.Message)
        End Try

    End Sub

    Public Sub Upd_Konfirm(ByVal s_str_id As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [TBL_T_REQUEST_TRAINING] SET VERIFIKASI='SUDAH' WHERE [PID_REQUEST_TRAINING]=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
    Public Sub Upd_Reject(ByVal s_str_id As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE [TBL_T_REQUEST_TRAINING] SET VERIFIKASI='SUDAH', TGL_CANCEL=getdate(), KET_CANCEL='REJECT'  WHERE [PID_REQUEST_TRAINING]=@ID"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Public Sub Alert_Confirm(ByVal s_str_id As String, ByVal s_str_status As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "EXECUTE SP_CONFIRM_EVENT @ID, @STATUS"
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .Parameters.Add("@STATUS", SqlDbType.VarChar, 50).Value = s_str_status
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
End Class