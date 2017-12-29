Public Class Frm_Housekeeping
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
    Protected Sub gv_listkamar_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)
        Try
            Dim ID As String = gv_listkamar.DataKeys(e.NewSelectedIndex).Value
            Upd_Cleaning(ID)
            gv_listkamar.DataBind()
        Catch ex As Exception

        End Try
      
    End Sub

    Public Sub Upd_Cleaning(ByVal s_str_id As Integer)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "UPDATE TBL_T_TRANSIT_PEGAWAI SET START_CLEAN= CASE WHEN START_CLEAN IS NULL THEN GETDATE() ELSE START_CLEAN END, END_CLEAN= CASE WHEN START_CLEAN IS NOT NULL THEN GETDATE() ELSE NULL END, STATUS_KAMAR= CASE WHEN START_CLEAN IS NOT NULL THEN 'READY' ELSE STATUS_KAMAR END WHERE PID_TRANSIT_PEGAWAI=@ID "
            .Parameters.Add("@ID", SqlDbType.Int).Value = s_str_id
            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub
End Class