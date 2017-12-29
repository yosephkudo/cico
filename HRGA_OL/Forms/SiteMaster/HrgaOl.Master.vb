Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Text
Public Class HrgaOl
    Inherits System.Web.UI.MasterPage

    Dim con As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_GSISConn").ConnectionString)
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("Nrp") = "0000048"
        'Session("GPID") = "ADMINISTRATOR"
        'Session("DEPT") = "IS"
        'Session("Nama") = "Muhammad Fauzan"
        'Session("Agent") = 1
        'Dim ip As String = System.Web.HttpContext.Current.Request.UserHostAddress
        Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
        Session("Host") = Session("Nrp")
        ' Session("Host") = System.Net.Dns.GetHostName()
        If Session("GPID") IsNot Nothing Then

            litNama.Text = Session("Nama")
            litUID.Text = Session("NRP") & "/" & Session("Nama")
            litGPID.Text = Session("NRP") & "/" & Session("Nama")
            litProfile.Text = Session("GPID")
            getMenu(Session("GPID").ToString)
        Else
            Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
        End If
        'If CekAkses(Session("GPID"), path) = "0" Then
        '    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Anda tidak ada akses di menu ini');", True)
        '    Response.Redirect(url & "/Forms/SiteMaster/Frm_Login.aspx")
        'End If
    End Sub
   
    Function CekAkses(ByVal s_str_gp As String, ByVal s_str_link As String) As String
        Dim Akses As String = "0"

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
            .CommandText = "SELECT [LinkMenu] FROM [Vw_Menu] WHERE (Deskripsi=@Deskripsi or Deskripsi='ALL') and LinkMenu=@Link"
            .Parameters.Add("@Deskripsi", SqlDbType.VarChar, 50).Value = s_str_gp
            .Parameters.Add("@Link", SqlDbType.VarChar, 500).Value = s_str_link
            dr = .ExecuteReader
            If dr.Read = True Or s_str_link = "/Forms/SiteMaster/Default.aspx" Or (s_str_gp = "PIC TRAINING" And s_str_link = "/Forms/Transactions/Event/Frm_PesertaEvent.aspx") Or (s_str_gp = "REQUESTOR" And s_str_link = "/Forms/Transactions/Event/Frm_PesertaEvent.aspx") Or (s_str_gp = "ADMINISTRATOR" And s_str_link = "/Forms/Transactions/Event/Frm_PesertaEvent.aspx") Or s_str_link = "/Forms/Reports/Frm_DashReport.aspx" Then
                Akses = "1"
            Else
                Akses = "0"
            End If
            con.Close()
        End With

        Return Akses
    End Function


    Public Sub getMenu(ByVal str_gpid As String)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<ul class=sidebar-menu>")
        sb.Append("<li class=header>" & str_gpid & "</li>")
        Try
            con.Open()
            Dim cmd As New SqlCommand("SELECT * FROM Vw_Menu WHERE (Deskripsi = '" + str_gpid + "' OR Deskripsi = 'ALL') AND Status = 1 ORDER BY URUT", con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            While dr.Read()
                If dr.GetString(2) = "head" Then
                    sb.Append("<li class=""treeview""><a><i class=""fa " + dr.GetString(11) + """></i><span>" + dr.GetString(3) + "</span><span class=""pull-right-container""><i class=""fa fa-angle-left pull-right""></i></span></a>")
                    sb.Append("<ul class=""treeview-menu"">")

                    Dim con2 As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_GSISConn").ConnectionString)
                    con2.Open()
                    Dim cmdChild As New SqlCommand("SELECT     * FROM   Vw_Menu WHERE (Deskripsi = '" + str_gpid + "' OR Deskripsi = 'ALL') AND Status = 1  AND ParentMenu = '" + dr.GetString(3) + "' ORDER BY URUT", con2)
                    Dim drChild As SqlDataReader = cmdChild.ExecuteReader()

                    While drChild.Read()
                        If drChild.GetString(5) = "2" Then
                            sb.Append("<li><a href=""" + url + drChild.GetString(7) + """><i class=""fa fa-circle-o""></i>" + drChild.GetString(4) + "</a></li>")
                        End If

                        If drChild.GetString(2) = "childHead" Then
                            sb.Append("<li><a><i class=""fa fa-circle-o""></i>" + drChild.GetString(4) + "</a>")
                            sb.Append("<ul class=""treeview-menu"">")

                            Dim con3 As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_GSISConn").ConnectionString)
                            con3.Open()
                            Dim cmdThird As New SqlCommand("SELECT * FROM Vw_Menu WHERE (Deskripsi = '" + str_gpid + "' OR Deskripsi = 'ALL') AND Status = 1 AND ParentMenu = '" + drChild.GetString(3) + "' AND ChildLevelParent = '" + drChild.GetString(4) + "' AND ChildLevel = 3 AND MenuClass = 'child' ORDER BY URUT", con3)
                            Dim drThird As SqlDataReader = cmdThird.ExecuteReader()

                            While drThird.Read()
                                sb.Append("<li><a href=""" + url + drThird.GetString(7) + """><i class=""fa fa-circle-o""></i>" + drThird.GetString(4) + "</a></li>")
                            End While

                            sb.Append("</ul>")
                            sb.Append("</li>")


                            con3.Close()
                            drThird.Close()
                        End If
                    End While

                    sb.Append("</ul>")

                    con2.Close()
                    drChild.Close()
                ElseIf dr.GetString(2) = "self" Then
                    sb.Append("<li class=""treeview""><a href=""" + url + dr.GetString(7) + """><i class=""fa " + dr.GetString(11) + """></i><span>" + dr.GetString(3) + "</span></a>")
                End If
                sb.Append("</li>")
            End While

            sb.Append("</ul>")
            myNav.InnerHtml = sb.ToString()

            con.Close()
            dr.Close()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('" & "Ooops!" & "','" & ex.Message & "','" & "error" & "');", True)
        End Try
    End Sub


End Class