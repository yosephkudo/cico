<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ETicket.aspx.vb" Inherits="HRGA_OL.Frm_ETicket" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Form eTicket</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">NRP</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txt_nrp" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                 <asp:AutoCompleteExtender ID="txt_nrp_AutoCompleteExtender" runat="server" CompletionSetCount="7" DelimiterCharacters="" Enabled="True" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchNRP"  TargetControlID="txt_nrp">
                    </asp:AutoCompleteExtender>
                            </div>
                            <div class="col-sm-3">
                                 <asp:DropDownList ID="ddl_kode" runat="server" CssClass="form-control " DataSourceID="ds_kode" DataTextField="KodeBooking" DataValueField="KodeBooking" AutoPostBack ="true" ></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="ds_kode" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT NULL KodeBooking
UNION
SELECT DISTINCT KodeBooking
FROM            VW_ETicket
WHERE        (Tanggal >= CAST(GETDATE() AS date)) AND (NRP = @NRP)"><SelectParameters>
<asp:ControlParameter ControlID="txt_nrp" PropertyName="Text" Name="NRP"></asp:ControlParameter>
</SelectParameters>
</asp:SqlDataSource>
</div>
                           
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Email</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" TextMode ="Email" ></asp:TextBox>
                            </div>
                            <asp:Button ID="btn_send" runat="server" Text="Send" class="btn btn-twitter " />
                        </div>
                        
                        
                        </div> 
                    <div class="x_panel">
      <rsweb:ReportViewer ID="rpt_viewer" runat="server" Width="100%" Height="100%" ProcessingMode="Remote" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Visible ="false" >    
        </rsweb:ReportViewer>
    </div>
                    </div> 
                </div> 
            </div> 
        </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
