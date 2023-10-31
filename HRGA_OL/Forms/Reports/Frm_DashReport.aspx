<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_DashReport.aspx.vb" Inherits="HRGA_OL.Frm_DashReport" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="form-horizontal">
		<div class="box box-success">
			<div class="col-sm-12">
				<div class="form-group">
					<div class="col-sm-4 control-label">
						<asp:Label ID="lbl_report" runat="server" Font-Bold="true" Visible="false" Text="#"></asp:Label>
					</div>
				</div>
			</div>
		</div>
		<div class="x_panel">
			<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<rsweb:ReportViewer ID="rpt_viewer" runat="server" Width="100%" Height="100%" ProcessingMode="Remote" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Visible="false">
			</rsweb:ReportViewer>
		</div>
	</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

</asp:Content>