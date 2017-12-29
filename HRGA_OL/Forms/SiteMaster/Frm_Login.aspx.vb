Imports System.DirectoryServices
Imports System.Data.SqlClient

Public Class Frm_Login
    Inherits System.Web.UI.Page

    Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
    Dim con As SqlClient.SqlConnection = New SqlClient.SqlConnection(connectionStrings("DB_GSISConn").ConnectionString)
    Dim Url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath

    Private Sub loginLDAP(ByVal s_str_nrp As String, ByVal s_str_pass As String)
        Try
            Dim entry As DirectoryEntry = New DirectoryEntry("LDAP://" + "pamapersada.net", s_str_nrp, s_str_pass, AuthenticationTypes.Secure)
            Dim searcher As DirectorySearcher = New DirectorySearcher(entry)
            searcher.SearchScope = SearchScope.OneLevel
            Dim result As SearchResult = searcher.FindOne
            If result Is Nothing Then
                lblKet.Text = "Username/Password salah. Silahkan coba kembali"
            Else
                Dim dept As String = ""
                Session("Nrpp") = txtUsernames.Text
                Session("Nrp") = txtUsernames.Text.Substring(1, txtUsernames.Text.Length - 1)
                Session("message") = ""
                lblKet.Text = "Sukses login. Pilih Akses"
                getProfile(Session("Nrp").ToString(), dept)
                Session("dept") = dept
                Session.Timeout = 30
            End If

        Catch ex As Exception
            lblKet.Text = "Username/Password salah. Silahkan coba kembali"
        End Try
    End Sub
    Public Sub getProfile(ByVal nrp As String, ByRef dept As String)
        Dim cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand
        Dim dt As SqlClient.SqlDataAdapter = New SqlClient.SqlDataAdapter("SELECT NRP, Nama, Departemen, GPID, [Deskripsi] FROM [Vw_UserID] Where NRP = '" & nrp & "'", con)
        Dim dtab As DataTable = New DataTable
        dt.Fill(dtab)
        If dtab.Rows.Count > 0 Then
            ddlAkses.Enabled = True
            ddlAkses.Items.Clear()
            ddlAkses.Items.Add("Select Profile")
        Else
            lblKet.Text = "Maaf! Anda tidak memiliki akses"
        End If
        For Each dr As DataRow In dtab.Rows
            ddlAkses.Items.Add(dr("Deskripsi").ToString)
            dept = dr("Departemen").ToString
            Session("Nama") = dr("Nama").ToString
        Next

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                If Request("act") = "logout" Then
                    Session.Clear()
                End If
            Catch ex As Exception
                Session.Clear()
            End Try
        End If
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        loginLDAP(txtUsernames.Text, txtPasswords.Text)
    End Sub

    Private Sub ddlAkses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlAkses.SelectedIndexChanged
        Session("GPID") = ddlAkses.Text
        If Session("GPID") = "AGENT TICKETING VAYA" Then
            Session("AGENT") = 1
        ElseIf Session("GPID") = "AGENT TICKETING LINTAS" Then
            Session("AGENT") = 2
        Else
            GetAgent()
        End If
        Response.Redirect(Url + "/Forms/SiteMaster/Default.aspx")
    End Sub

    Public Sub GetAgent()
        Dim con2 As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        Dim dr As SqlDataReader
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con2 = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con2.Open()
        With cmd
            .Connection = con2
            .CommandType = CommandType.Text
            .CommandText = "SELECT tblTravelAuthorization_Supplier_Reff.[KodeSupplier], tblTravelAuthorization_Supplier_Reff.[NamaSupplier] FROM [tblTravelAuthorization_Supplier_Reff] INNER JOIN Tblkaryawan ON tblTravelAuthorization_Supplier_Reff.NamaSupplier=Tblkaryawan.Company where tblTravelAuthorization_Supplier_Reff.[status]=1 and  Tblkaryawan.NRP = @NRP and Tblkaryawan.statuspenerimaan in ('LS','MK','PARTNER')"

            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = Session("Nrp")
            dr = .ExecuteReader
        End With
        If dr.Read = True Then
            Session("AGENT") = dr.Item("KodeSupplier").ToString
        Else
            Session("AGENT") = 0
        End If
    End Sub
End Class