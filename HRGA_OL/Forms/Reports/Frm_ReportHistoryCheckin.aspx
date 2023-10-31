<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ReportHistoryCheckin.aspx.vb" Inherits="HRGA_OL.Frm_ReportHistoryCheckin" %>
<%-- <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %> --%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="form-horizontal">
		<div class="box box-success">
			<div class="box-body">
            <iframe
                src="http://bekbsqrp401:3000/public/dashboard/ff41eede-ce5a-4a55-8c8f-3d91d1220c2b"
                frameborder="0"
                width="1100"
                height="800"
                allowtransparency
            ></iframe>
			</div>
		</div>
	</div>
</asp:Content>