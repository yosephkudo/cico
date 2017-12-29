<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ValidateReservasi.aspx.vb" Inherits="HRGA_OL.Frm_ValidateReservasi"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="refresh" content="60">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="form-horizontal">
              <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Validate Reservasi</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                          <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listfinger" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_reservasi" AllowPaging="True" EmptyDataText="Tidak ada data reservasi" PagerStyle-CssClass="gridView" DataKeyNames="ID" OnSelectedIndexChanging ="gv_listfinger_SelectedIndexChanging" >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA" HeaderText="NAMA" SortExpression="NAMA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="DISTRIK" HeaderText="DISTRIK" SortExpression="DISTRIK">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="STATUS_CHECK" HeaderText="STATUS" SortExpression="STATUS_CHECK">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KETERANGAN" HeaderText="LOKASI" SortExpression="KETERANGAN">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_GEDUNG" HeaderText="GEDUNG" SortExpression="NAMA_GEDUNG">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_KAMAR" HeaderText="KAMAR" SortExpression="NAMA_KAMAR">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TGL_CHECKIN" HeaderText="CHECKIN" SortExpression="TGL_CHECKIN">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TGL_CHECKOUT" HeaderText="CHECKOUT" SortExpression="TGL_CHECKOUT">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Designs/Images/centang.png"></asp:CommandField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="SeaGreen" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="SeaGreen" ForeColor="White"></PagerStyle>

                            <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                                         </div> 
                                    </div>
                     
                              <asp:SqlDataSource runat="server" ID="ds_reservasi" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT TBL_T_RESERVASI_FINGER.ID, TBL_T_RESERVASI_FINGER.NRP, TBL_T_TRANSIT_PEGAWAI.NAMA, TBL_T_TRANSIT_PEGAWAI.DISTRIK, TBL_T_RESERVASI_FINGER.STATUS_CHECK, View_Mess.KETERANGAN, View_Mess.NAMA_GEDUNG, View_Mess.NAMA_KAMAR, CASE WHEN TBL_T_RESERVASI_FINGER.STATUS_CHECK='CHECKIN'  THEN TBL_T_RESERVASI_FINGER.TANGGAL ELSE TBL_T_TRANSIT_PEGAWAI.TGL_CHECKIN END TGL_CHECKIN, CASE WHEN TBL_T_RESERVASI_FINGER.STATUS_CHECK='CHECKOUT'  THEN TBL_T_RESERVASI_FINGER.TANGGAL ELSE TBL_T_TRANSIT_PEGAWAI.TGL_CHECKOUT END TGL_CHECKOUT FROM TBL_T_RESERVASI_FINGER INNER JOIN TBL_T_TRANSIT_PEGAWAI ON TBL_T_RESERVASI_FINGER.PID_TRANSIT_PEGAWAI = TBL_T_TRANSIT_PEGAWAI.PID_TRANSIT_PEGAWAI LEFT OUTER JOIN View_Mess ON TBL_T_TRANSIT_PEGAWAI.PID_DETAIL_MESS_BED = View_Mess.PID_DETAIL_MESS_BED WHERE (TBL_T_RESERVASI_FINGER.VALIDATE IS NULL)">
                            </asp:SqlDataSource>
                        </div>
                        </div> 
                    </div> 
                  </div> 
            </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
