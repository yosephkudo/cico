<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_RequestTransport.aspx.vb" Inherits="HRGA_OL.Frm_RequestTransport" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-5">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Izin Penggunaan Sarana</h3>
                </div>
                
                <div class="box-body">
                    <div class="form-horizontal">

                         <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NO_BBSO</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_bbso" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NO_HCGS</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_hcgs" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NRP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nrp" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="txt_nrp_AutoCompleteExtender" runat="server" CompletionSetCount="7" DelimiterCharacters="" Enabled="True" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchNRP"  TargetControlID="txt_nrp">
                    </asp:AutoCompleteExtender>
                            </div>
                        </div>
                         <asp:UpdatePanel runat ="server" ><ContentTemplate >

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Nama</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nama" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">No. HP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nohp" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Jabatan</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_jabatan" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                       <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tujuan</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_tujuan" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tanggal Dan Jam Berangkat</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_tglberangkat" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglberangkat" ID="txt_berangkat_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                           
                             <div class="col-sm-3">
                                <asp:TextBox ID="txt_jamberangkat" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamberangkat" ID="txt_jamberangkat_MaskedEditExtender" Mask="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div>

                         <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tanggal Dan Jam Kembali</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_tglkembali" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglkembali" ID="txt_kembali_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                           
                             <div class="col-sm-3">
                                <asp:TextBox ID="txt_jamkembali" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamcheckin" ID="MaskedEditExtender1" Mask="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div>

                          <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Keperluan</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_keperluan" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Jemput Di</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                                    
                                                   
                         </ContentTemplate></asp:UpdatePanel>
                        </div> 
                </div>
                    
     
         </div>
         </div>
        



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
