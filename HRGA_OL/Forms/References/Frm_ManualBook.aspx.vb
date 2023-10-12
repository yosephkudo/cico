Public Class Frm_ManualBook
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Get_Manual(Session("GPID")) <> "" Then
                'sh_pdf.FilePath = url & Get_Manual(Session("GPID"))
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Manual Book Tidak Tersedia');", True)
            End If
        Catch ex As Exception

        End Try
       

    End Sub

    Function Get_Manual(ByVal s_str_gpid As String) As String
        Dim ManualName As String = ""
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
            .CommandText = "SELECT ManualBook FROM TBL_R_MANUAL Where Profile=@GPID"
            .Parameters.Add("@GPID", SqlDbType.VarChar, 50).Value = s_str_gpid
            dr = .ExecuteReader
            If dr.Read = True Then
                ManualName = dr.Item("ManualBook").ToString
            Else
                ManualName = ""
            End If
        End With
        Return ManualName
    End Function

End Class