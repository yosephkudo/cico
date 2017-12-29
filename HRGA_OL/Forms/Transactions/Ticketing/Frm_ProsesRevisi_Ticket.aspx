<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ProsesRevisi_Ticket.aspx.vb" Inherits="HRGA_OL.Frm_ProsesRevisi_Ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="form-horizontal">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Process Revisi Ticket</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                                                 <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listrevisi" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" DataSourceID="ds_revisi" OnSelectedIndexChanging="gv_listrevisi_SelectedIndexChanging" DataKeyNames="ID_Rev">
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor ST" SortExpression="NomorST">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTA" HeaderText="Nomor TA" SortExpression="NoTA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Site" HeaderText="Site" SortExpression="Site">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Fortiket" HeaderText="Status Keluarga" SortExpression="Fortiket">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="No. Telp" SortExpression="NoTelp">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NamaSupplier" HeaderText="Agent" SortExpression="NamaSupplier">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KodeBooking" HeaderText="KodeBooking" SortExpression="KodeBooking">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark"><HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle></asp:BoundField>
                                                 <asp:BoundField DataField="Revisi" HeaderText="Revisi" SortExpression="Revisi">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap ="false"  Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField SelectImageUrl="~/Designs/Images/arrow.png" ShowSelectButton="True" ButtonType="Image"></asp:CommandField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                             <HeaderStyle HorizontalAlign="Center" BackColor="Maroon" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                             <PagerStyle HorizontalAlign="Center" BackColor="Maroon" ForeColor="White"></PagerStyle>

                                             <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                             <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                             <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                             <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                             <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                         </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_revisi" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT VW_TA_FLIGHT.NomorST, VW_TA_FLIGHT.NRP, VW_TA_FLIGHT.Nama, VW_TA_FLIGHT.TravelAuthorizeNo AS NoTA, ISNULL(TBL_T_REVISI_TICKET.KodeBooking, DRV_ORDER.KodeBooking) AS KodeBooking, TBL_T_REVISI_TICKET.Revisi, TBL_T_REVISI_TICKET.Remark, VW_TA_FLIGHT.NoTelp, VW_TA_FLIGHT.Umur, VW_TA_FLIGHT.Fortiket, VW_TA_FLIGHT.Site, TBL_T_REVISI_TICKET.ID_Rev, tblTravelAuthorization_Supplier_Reff.NamaSupplier FROM tblTravelAuthorization_Supplier_Reff INNER JOIN (SELECT idFlight, KodeSupplier, KodeBooking FROM vw_TA_Tiket_onOrder WHERE (statusBiding = 1) UNION SELECT idFlight, KodeSupplier, KodeBooking FROM vw_TA_Tiket_onOrder_NonTA) AS DRV_ORDER ON tblTravelAuthorization_Supplier_Reff.KodeSupplier = DRV_ORDER.KodeSupplier RIGHT OUTER JOIN TBL_T_REVISI_TICKET INNER JOIN VW_TA_FLIGHT ON TBL_T_REVISI_TICKET.IdFlight = VW_TA_FLIGHT.ID ON DRV_ORDER.idFlight = TBL_T_REVISI_TICKET.IdFlight WHERE (TBL_T_REVISI_TICKET.AssignBy IS NULL) AND (TBL_T_REVISI_TICKET.Status = 'GS BBSO')"></asp:SqlDataSource>
                                     </div> 
                                    </div>
                     
                         
                        </div>
                        </div> 
                    </div> 
                </div> 
         <div class ="col-sm-6">
             <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Sebelum Revisi</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Nomor TA</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_noTA" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Nomor ST</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_noST" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Nama</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_nama" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tanggal</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_tanggal" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                           
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_maskapai" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Dari</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_dari" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tujuan</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_tujuan" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_kode" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        
                        </div> 
                    </div> 
                 </div> 
         </div>
                  <div class ="col-sm-6">
             <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Sesudah Revisi</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                       <div class="form-group">
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_revisi" runat="server" Font-Bold ="true" Font-Size ="Large"   Text="#" ForeColor="DarkSlateBlue" ></asp:Label>
                     </div>
                        </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tanggal</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_Tanggal_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                        </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_maskapai_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Dari</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_dari_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tujuan</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_tujuan_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Keterangan</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_Ket_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Agent</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_agent" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                        </div> 
                    </div> 
                 </div> 
         </div>
         <div class ="col-sm-12">
                <div class="box box-info">
                
                <div class="box-body">
                    <div class="form-horizontal">
                       
                         <div class="col-sm-10" >
                             <asp:Label ID="lbl_IdRev" runat="server" Font-Bold ="true" Visible ="false"   Text="0"></asp:Label>
                         </div> 
                        <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Process" class="btn btn-facebook" />
                            </div> 
                       
                       </div> 
                    </div> 
                </div> </div>     
         </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
