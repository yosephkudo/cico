Imports System.Data.SqlClient


Public Class Frm_RequestTransport
    Inherits System.Web.UI.Page

    <System.Web.Script.Services.ScriptMethod(),
    System.Web.Services.WebMethod()>
    Public Shared Function SearchNRP(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("DB_GSISConn").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "SELECT TOP 10 NRP +'-'+ Nama  as NRP FROM vw_Allkaryawan " _
                        & " where NRP LIKE '%' + '" + prefixText + "' + '%' or Nama Like '%' + '" + prefixText + "' + '%' order by Nama"
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("NRP").ToString)
        End While
        conn.Close()
        Return customers
    End Function

    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
        Dim path As String = HttpContext.Current.Request.Url.AbsolutePath


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            CekAkses(Session("GPID"))
        Catch ex As Exception
            'Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
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
                ' Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
            End If
            con.Close()
        End With

    End Sub

End Class