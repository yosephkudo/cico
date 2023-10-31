<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_Report.aspx.vb" Inherits="HRGA_OL.Frm_Report" %>
<%-- <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %> --%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="form-horizontal">
		<div class="box box-success">
			<div class="box-body">
            <iframe
                src="http://bekbsqrp401:3000/public/dashboard/b37582b8-cee7-4d48-8149-1110da37e16e"
                frameborder="0"
                width="1100"
                height="800"
                allowtransparency
            ></iframe>
				<%-- <div class="col-lg-6 col-sm-6 col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="product-id">
							Choose Report
						</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<asp:DropDownList ID="ddlkategory" runat="server" CssClass="form-control" DataSourceID="DS_KATEGORI" DataTextField="Kategori" DataValueField="Kategori" AutoPostBack="true"></asp:DropDownList>
						</div>
						<div class="col-md-5 col-sm-5 col-xs-12">

							<asp:DropDownList ID="ddlReportList" runat="server" CssClass="form-control" DataSourceID="DS_REPORTS" DataTextField="ReportName" DataValueField="ReportPath" AutoPostBack="true"></asp:DropDownList>
							<asp:SqlDataSource runat="server" ID="DS_REPORTS" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT '' AS ReportPath, '' AS ReportName UNION SELECT ReportPath, ReportName FROM VW_REPORTS WHERE (Status = 1) AND (Kategori = @KATEGORI) AND (GP_DESCRIPTION = @GPID)">
								<SelectParameters>
									<asp:ControlParameter ControlID="ddlkategory" PropertyName="SelectedValue" Name="KATEGORI"></asp:ControlParameter>
									<asp:SessionParameter SessionField="GPID" Name="GPID"></asp:SessionParameter>
								</SelectParameters>
							</asp:SqlDataSource>
							<asp:SqlDataSource runat="server" ID="DS_KATEGORI" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT '' AS Kategori union SELECT DISTINCT Kategori FROM VW_REPORTS WHERE STATUS=1 AND (GP_DESCRIPTION = @GPID)">
								<SelectParameters>
									<asp:SessionParameter SessionField="GPID" Name="GPID"></asp:SessionParameter>
								</SelectParameters>
							</asp:SqlDataSource>
						</div>
					</div>
				</div> --%>
			</div>
		</div>
	</div>
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<div class="x_panel">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<rsweb:ReportViewer ID="rpt_viewer" runat="server" Width="100%" Height="100%" ProcessingMode="Remote" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Visible="false">
		</rsweb:ReportViewer>
	</div>
</asp:Content> --%>