<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ConfirmEvent.aspx.vb" Inherits="HRGA_OL.Frm_ConfirmEvent" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="form-horizontal">
              <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Event Confirm</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                          <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listrequest" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_peserta" AllowPaging="True" EmptyDataText="Tidak ada data peserta" PagerStyle-CssClass="gridView" DataKeyNames="PID_REQUEST_TRAINING" OnRowDeleting="gv_listrequest_RowDeleting" OnSelectedIndexChanging ="gv_listrequest_SelectedIndexChanging" >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                             <Columns>
                                                 <asp:BoundField DataField="NAMA_TRAINING" HeaderText="TRAINING" SortExpression="NAMA_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KATEGORI_TRAINING" HeaderText="KATEGORI" SortExpression="KATEGORI_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TANGGAL_MULAI" HeaderText="TGL MULAI" SortExpression="TANGGAL_MULAI" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TANGGAL_SELESAI" HeaderText="TGL SELESAI" SortExpression="TANGGAL_SELESAI" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="LOKASI_TRAINING" HeaderText="RUANGAN" SortExpression="LOKASI_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" SortExpression="COMPANY">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="ESTIMASI_PESERTA" HeaderText="EST. PESERTA" SortExpression="ESTIMASI_PESERTA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="PENGAJU" HeaderText="DIAJUKAN OLEH" SortExpression="PENGAJU">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Designs/Images/cross.png"></asp:CommandField>
                                                 <asp:TemplateField>
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:TemplateField>
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
                     
                              <asp:SqlDataSource runat="server" ID="ds_peserta" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT *, ISNULL(NAMA,NRP_PENGAJU) PENGAJU  FROM [VW_CLS_REQUESTBELUMKONFIRMASI]">
                            </asp:SqlDataSource>
                        </div>
                        </div> 
                    </div> 
                  </div> 
            </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
