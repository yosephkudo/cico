<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_Checkout_v1.aspx.vb" Inherits="HRGA_OL.Frm_Checkout" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-5">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Reservasi Mess</h3>
                </div>
                 <asp:UpdatePanel runat ="server"  ><ContentTemplate >
                <div class="box-body">
                    <div class="form-horizontal">
                       
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NRP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nrp" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="txt_nrp_AutoCompleteExtender" runat="server" CompletionSetCount="7" DelimiterCharacters="" Enabled="True" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchNRP"  TargetControlID="txt_nrp">
                    </asp:AutoCompleteExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Nama</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nama" runat="server" CssClass="form-control" Enabled ="false" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">No. HP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nohp" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Status Keluarga</label>
                            <div class="col-sm-8">
                              <asp:TextBox ID="txt_keluarga" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Keperluan</label>
                            <div class="col-sm-8">
                              <asp:TextBox ID="txt_keperluan" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Lokasi</label>
                             <div class="col-sm-8">
                                <asp:TextBox ID="txt_lokasi" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                             </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Gedung</label>
                             <div class="col-sm-8">
                                <asp:TextBox ID="txt_gedung" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                             </div>
                        </div>
                           <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Kamar</label>
                             <div class="col-sm-8">
                               <asp:TextBox ID="txt_kamar" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                             </div>
                        </div>
                         <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tujuan</label>
                             <div class="col-sm-8">
                                <asp:TextBox ID="txt_tujuan" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Check IN</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_tglcheckin" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglcheckin" ID="txt_checkin_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txt_jamcheckin" runat="server" CssClass="form-control" Enabled ="false"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamcheckin" ID="txt_jamcheckin_MaskedEditExtender" Mask="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Check OUT</label>
                             <div class="col-sm-5">
                                <asp:TextBox ID="txt_tglcheckout" runat="server" CssClass="form-control"></asp:TextBox>
                                 <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglcheckout" ID="txt_tglcheckout_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                             </div>
                             <div class="col-sm-3">
                                <asp:TextBox ID="txt_jamcheckout" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamcheckout" ID="MaskedEditExtender1" Mask="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div>
                        </div> 
                </div>
                     </ContentTemplate></asp:UpdatePanel>
         <div class="box-footer">
             <div class="col-sm-8"> </div> 
             <asp:Button ID="btn_checkout" runat="server" Text="Check OUT" class="btn btn-google " />
             </div> 
         </div>
         </div>
        
                <div class="col-sm-7">        
     <div class="box box-danger">
         <div class="box-header with-border">
                    <h3 class="box-title" style="font-style:italic">List Penghuni Kamar</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Lokasi</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="ddl_carilokasi" runat="server" CssClass="form-control" AutoPostBack="true" DataSourceID="ds_lokasi" DataTextField="KETERANGAN" DataValueField="KETERANGAN"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="ds_lokasi" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS KETERANGAN UNION SELECT DISTINCT KETERANGAN FROM TBL_R_GROUP_MESS WHERE (AKTIF = 1)"></asp:SqlDataSource>
                                </div>
                                <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                             <div class="col-sm-5">
                                <asp:TextBox ID="txt_cari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                            </div>
                                 
                        </div>
                        </div> 
                        <div class="col-sm-12">
                             <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto"> 
                                         <asp:GridView ID="gv_listpenghuni" runat="server" AutoGenerateColumns="False" EmptyDataText="Tidak ada data" CssClass="table table-bordered table-hover" AllowPaging="True" DataSourceID="ds_listpenghuni" DataKeyNames="NRP" OnSelectedIndexChanging ="gv_listpenghuni_SelectedIndexChanging"  >
                                             <AlternatingRowStyle BackColor="WhiteSmoke" />
                                             <Columns>
                                                 <asp:CommandField SelectImageUrl="~/Designs/Images/arrow.png" ShowSelectButton="True" ButtonType="Image"></asp:CommandField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA" HeaderText="NAMA" SortExpression="NAMA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_BLOK" HeaderText="BLOK" SortExpression="NAMA_BLOK">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_GEDUNG" HeaderText="GEDUNG" SortExpression="NAMA_GEDUNG">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_KAMAR" HeaderText="KAMAR" SortExpression="NAMA_KAMAR">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="IN" HeaderText="CHECK IN" SortExpression="IN">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                               
                                             </Columns>

                                <Columns>
                                </Columns>

                                <HeaderStyle BackColor="#41709e" ForeColor="White" />
                            </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_listpenghuni" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT VW_KARYAWAN_CHECKIN.ID_TRANSIT, VW_KARYAWAN_CHECKIN.NRP, VW_KARYAWAN_CHECKIN.NAMA, View_Mess.KETERANGAN AS NAMA_BLOK, View_Mess.NAMA_GEDUNG, View_Mess.NAMA_KAMAR, CONVERT(VARCHAR(10),VW_KARYAWAN_CHECKIN.[IN],105) [IN] FROM VW_KARYAWAN_CHECKIN LEFT OUTER JOIN View_Mess ON View_Mess.PID_DETAIL_MESS_BED = VW_KARYAWAN_CHECKIN.ID_BED WHERE (View_Mess.KETERANGAN = @BLOK) AND (VW_KARYAWAN_CHECKIN.NRP LIKE '%' + @CARI + '%') OR (View_Mess.KETERANGAN = @BLOK) AND (VW_KARYAWAN_CHECKIN.NAMA LIKE '%' + @CARI + '%') OR (View_Mess.KETERANGAN = @BLOK) AND (View_Mess.NAMA_KAMAR LIKE '%' + @CARI + '%') OR (View_Mess.KETERANGAN = @BLOK) AND (@CARI = '*')" DeleteCommand="DELETE TBL_T_TRANSIT_PEGAWAI WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="ddl_carilokasi" PropertyName="SelectedValue" Name="BLOK"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txt_cari" PropertyName="Text" Name="CARI"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                                         </div> </div>
                        </div>
                        </div> 
                </div>
         </div>
         </div> 
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
