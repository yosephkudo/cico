Imports Microsoft.Reporting.WebForms
Public Class Frm_Report
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    ' Public Sub GetReport(ByVal s_str_reportserver As String, ByVal s_str_reportPath As String)
    '     rpt_viewer.ProcessingMode = ProcessingMode.Remote
    '     Dim serverReport As ServerReport = rpt_viewer.ServerReport
    '     serverReport.ReportServerUrl = New Uri(s_str_reportserver)
    '     serverReport.ReportPath = s_str_reportPath
    ' End Sub

    ' Private Sub ddlReportList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlReportList.SelectedIndexChanged
    '     GetReport("http://bekbsqco401/reportserver_sqlexpress", ddlReportList.SelectedValue)
    '     rpt_viewer.Visible = True
    ' End Sub
End Class