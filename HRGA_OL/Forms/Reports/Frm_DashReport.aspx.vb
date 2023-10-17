Imports Microsoft.Reporting.WebForms
Public Class Frm_DashReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Path") <> "" Then
            lbl_report.Text = Session("Path")
            GetReport(lbl_report.Text)
            Session("Path") = ""
            rpt_viewer.Visible = True
        End If
    End Sub

    Public Sub GetReport(ByVal s_str_reportPath As String)
        rpt_viewer.ProcessingMode = ProcessingMode.Remote
        Dim serverReport As ServerReport = rpt_viewer.ServerReport
        serverReport.ReportServerUrl = New Uri("http://bekbsqco403/reportserver_sqlexpress")
        serverReport.ReportPath = s_str_reportPath
    End Sub
End Class