Imports Microsoft.Reporting.WebForms
Imports System.IO
Imports System.Data.SqlClient

Public Class Frm_ETicket
    Inherits System.Web.UI.Page
    Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath
    Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
    <System.Web.Script.Services.ScriptMethod(), _
 System.Web.Services.WebMethod()> _
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
    Private Sub btn_send_Click(sender As Object, e As EventArgs) Handles btn_send.Click
        Try
            If txt_nrp.Text <> "" And txt_email.Text <> "" And ddl_kode.SelectedValue <> "" Then
                SaveToPdf(txt_nrp.Text, ddl_kode.SelectedValue)
                Ins_SendTicket(ddl_kode.SelectedValue, txt_nrp.Text, txt_email.Text)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Send Email eTicket Berhasil');", True)
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "alertMessage", "alert('Error : " & ex.Message & " ');", True)
        End Try

    End Sub

    Public Sub Ins_SendTicket(ByVal s_str_kode As String, ByVal s_str_nrp As String, ByVal s_str_email As String)
        Dim con As SqlClient.SqlConnection = Nothing
        Dim cmd As SqlClient.SqlCommand = Nothing
        cmd = New SqlClient.SqlCommand
        Dim connectionStrings As ConnectionStringSettingsCollection = System.Web.Configuration.WebConfigurationManager.ConnectionStrings
        con = New SqlClient.SqlConnection(connectionStrings("DB_HRGAConn").ConnectionString)
        con.Open()
        With cmd
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = "INSERT INTO Tbl_Send_Email_History (PERIODE,NRP,EMAIL, ATTACH, STATUSKIRIM,GRP,SENTTIME) VALUES (@KODE,@NRP,@EMAIL,@ATTACH,0,'Manual',getdate())"
            .Parameters.Add("@KODE", SqlDbType.VarChar, 20).Value = s_str_kode
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            .Parameters.Add("@EMAIL", SqlDbType.VarChar, 150).Value = s_str_email
            .Parameters.Add("@ATTACH", SqlDbType.VarChar, 150).Value = "\\bbsocu6413\tiket$\" & s_str_nrp & "_tiket_" & s_str_kode & ".pdf"

            .ExecuteNonQuery()
        End With
        con.Close()
    End Sub

    Private Sub txt_nrp_TextChanged(sender As Object, e As EventArgs) Handles txt_nrp.TextChanged
        If txt_nrp.Text <> "" Then
            Dim NRP As String() = Split(txt_nrp.Text, "-")
            txt_nrp.Text = Trim(NRP(0))
            Get_Email(txt_nrp.Text, txt_email.Text)
        End If
    End Sub

    Public Sub Get_Email(ByVal s_str_nrp As String, ByRef s_str_email As String)
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
            .CommandText = "SELECT Top 1 imel FROM TblFlight Where NRP=@NRP ORDER BY ID DESC"
            .Parameters.Add("@NRP", SqlDbType.VarChar, 15).Value = s_str_nrp
            dr = .ExecuteReader
            If dr.Read = True Then
                s_str_email = dr.Item("imel").ToString
            Else
                s_str_email = ""


            End If
        End With
    End Sub

    Private Sub ddl_kode_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_kode.SelectedIndexChanged
        Try
            If ddl_kode.SelectedValue <> "" Then
                rpt_viewer.Visible = True
                rpt_viewer.ProcessingMode = ProcessingMode.Remote
                Dim serverReport As ServerReport = rpt_viewer.ServerReport
                serverReport.ReportServerUrl = New Uri("http://bekbsqco403/reportserver_sqlexpress")
                serverReport.ReportPath = "/Tiket/tiket_pesawat"
                rpt_viewer.ShowParameterPrompts = False
                Dim Kode As New ReportParameter("KodeBooking", ddl_kode.SelectedValue)
                Dim p_Kode() As ReportParameter = {Kode}
                rpt_viewer.ServerReport.SetParameters(p_Kode)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Sub SaveToPdf(ByVal s_str_nrp As String, ByVal s_str_kode As String)
        Dim warnings As Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim bytes As Byte()
        Dim FileLocation As String
        Dim FolderLocation As String = "\\bbsocu6413\tiket$\"
        Dim filepath As String = FolderLocation & s_str_nrp & "_tiket_" & s_str_kode & ".pdf"
        FileLocation = filepath
        bytes = rpt_viewer.ServerReport.Render("pdf", Nothing, mimeType, encoding, extension, streamids, warnings)
        Dim fs As New FileStream(filepath, FileMode.Create)
        fs.Write(bytes, 0, bytes.Length)
        fs.Close()
    End Sub
End Class