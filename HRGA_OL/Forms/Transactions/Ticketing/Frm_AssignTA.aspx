<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_AssignTA.aspx.vb" Inherits="HRGA_OL.Frm_AssignTA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
            <div class="box box-success ">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Assign TA</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small; text-align: left">Distrik</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_distrik" runat="server" CssClass="form-control " DataSourceID="ds_distrik" DataTextField="Site" DataValueField="Site" AutoPostBack ="true" ></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="ds_distrik" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT '' AS Site UNION SELECT DISTINCT Site FROM VW_TA_FLIGHT WHERE STATUS_TA='BELUM DI ASSIGN'  AND SITE IS NOT NULL">
                                    </asp:SqlDataSource>
                                    </div>
                                    <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small; text-align: left">No. TA</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_TA" runat="server" CssClass="form-control " DataSourceID="ds_TA" DataTextField="TravelAuthorizeNo" DataValueField="TravelAuthorizeNo" AutoPostBack ="true" ></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="ds_TA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT '' AS TravelAuthorizeNo UNION SELECT DISTINCT TravelAuthorizeNo FROM VW_TA_FLIGHT WHERE STATUS_TA='BELUM DI ASSIGN' AND [SITE]=@AREA order by TravelAuthorizeNo">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddl_distrik" PropertyName="SelectedValue" Name="AREA"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                       
                        
                         <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Keberangkatan Emergency</label>
                                </div>
                         <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small; text-align: left">Agent</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_agent_emergency" runat="server" CssClass="form-control " DataSourceID="ds_Agent_emergency" DataTextField="NamaSupplier" DataValueField="KodeSupplier" ></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="ds_Agent_emergency" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT KodeSupplier, NamaSupplier FROM tblTravelAuthorization_Supplier_Reff WHERE (status = 1)">
                                    </asp:SqlDataSource>
                                    </div>
                                </div>
                         <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_emergency" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_emergency"  EmptyDataText="No Data" PagerStyle-CssClass="gridView" DataKeyNames ="ID" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor ST" SortExpression="NomorST">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Status_Keluarga" HeaderText="Status Keluarga" SortExpression="Status_Keluarga">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tanggal" HeaderText="Tanggal" SortExpression="Tanggal">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="Dari" HeaderText="Dari" SortExpression="Dari">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tujuan" HeaderText="Tujuan" SortExpression="Tujuan">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Maskapai" HeaderText="Maskapai" SortExpression="Maskapai">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="GAnonGA" HeaderText="GA" SortExpression="GAnonGA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="Telpon" SortExpression="NoTelp">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Keterangan" HeaderText="Keterangan" SortExpression="Keterangan">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area">
                              <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
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
                                         </div> 
                                    </div>
                     
                             <asp:SqlDataSource runat="server" ID="ds_emergency" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT VW_TA_FLIGHT.ID, VW_TA_FLIGHT.NomorST, VW_TA_FLIGHT.NRP, VW_TA_FLIGHT.Nama + ' (' + VW_TA_FLIGHT.Umur + ')' AS Nama, ISNULL(VW_TA_FLIGHT.Fortiket, 'KARYAWAN') AS Status_Keluarga, CONVERT (varchar(10), VW_TA_FLIGHT.Tanggal, 105) + ' ' + VW_TA_FLIGHT.Berangkat AS Tanggal, VW_TA_FLIGHT.Dari, VW_TA_FLIGHT.Tujuan, VW_TA_FLIGHT.Maskapai, VW_TA_FLIGHT.Keterangan, VW_TA_FLIGHT.NoTelp, VW_TA_FLIGHT.Area, VW_TA_FLIGHT.GAnonGA FROM VW_TA_FLIGHT INNER JOIN (SELECT DISTINCT NomorST FROM VW_TA_FLIGHT AS VW_TA_FLIGHT_1 WHERE (TravelAuthorizeNo = @TA) AND (DATEDIFF(day, GETDATE(), Tanggal) <= 3) ) AS DRV ON DRV.NomorST = VW_TA_FLIGHT.NomorST WHERE (VW_TA_FLIGHT.STATUS_TA = 'BELUM DI ASSIGN')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Keberangkatan Normal</label>
                                </div>
                         <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small; text-align: left">Agent</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddl_agent" runat="server" CssClass="form-control " DataSourceID="ds_Agent" DataTextField="NamaSupplier" DataValueField="KodeSupplier" ></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="ds_Agent" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="
                                            SELECT 0 KodeSupplier, 'All' NamaSupplier UNION SELECT KodeSupplier, NamaSupplier FROM tblTravelAuthorization_Supplier_Reff WHERE (status = 1)"> </asp:SqlDataSource>
                                    </div>
                                </div>
                         <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listTA" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_listTA" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor ST" SortExpression="NomorST">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Status_Keluarga" HeaderText="Status Keluarga" SortExpression="Status_Keluarga">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tanggal" HeaderText="Tanggal" SortExpression="Tanggal">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="Dari" HeaderText="Dari" SortExpression="Dari">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tujuan" HeaderText="Tujuan" SortExpression="Tujuan">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Maskapai" HeaderText="Maskapai" SortExpression="Maskapai">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="GAnonGA" HeaderText="GA" SortExpression="GAnonGA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="Telpon" SortExpression="NoTelp">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Keterangan" HeaderText="Keterangan" SortExpression="Keterangan">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area">
                              <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                            <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                                         </div> 
                                    </div>
                     
                             <asp:SqlDataSource runat="server" ID="ds_listTA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT VW_TA_FLIGHT.NomorST, NRP, Nama + ' (' + Umur + ')' AS Nama, ISNULL(Fortiket, 'KARYAWAN') AS Status_Keluarga, CONVERT(varchar(10), Tanggal, 105) + ' ' + Berangkat AS Tanggal, Dari, Tujuan, Maskapai, Keterangan, NoTelp, Area, GAnonGA FROM VW_TA_FLIGHT INNER JOIN (SELECT DISTINCT NomorST FROM VW_TA_FLIGHT WHERE (TravelAuthorizeNo = @TA) AND datediff(day, Getdate(), Tanggal) > 3) AS DRV ON DRV.NomorST = VW_TA_FLIGHT.NomorST LEFT OUTER JOIN ((SELECT DISTINCT NomorST FROM VW_TA_FLIGHT WHERE (TravelAuthorizeNo = @TA) AND datediff(day, Getdate(), Tanggal) <= 3 AND CAST(Tanggal AS DATE) >= CAST(getdate() AS DATE))) AS EM ON EM.NomorST = VW_TA_FLIGHT.NomorST WHERE EM.NOMORST IS NULL AND VW_TA_FLIGHT.STATUS_TA = 'BELUM DI ASSIGN'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                       <div class="form-group">
                                    <div class="col-sm-12" ></div> 
                        
                                </div>
                         <div class="form-group">
                                    <div class="col-sm-10" ></div> 
                        <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Assign" class="btn btn-twitter " />
                            </div>
                                </div>
                        </div> 
                    </div> 
                </div> 
        </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
