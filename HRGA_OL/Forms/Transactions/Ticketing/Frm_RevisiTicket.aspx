<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_RevisiTicket.aspx.vb" Inherits="HRGA_OL.Frm_RevisiTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-12">
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Revisi Ticket</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listrevisi" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" DataSourceID="ds_revisi" OnSelectedIndexChanging="gv_listrevisi_SelectedIndexChanging"  DataKeyNames="ID_Rev">
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
                                         <asp:SqlDataSource runat="server" ID="ds_revisi" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT tblFlight.NomorST, tblFlight.NRP, tblFlight.Nama, tblFlight.TravelAuthorizeNo AS NoTA, TBL_T_REVISI_TICKET.Revisi, TBL_T_REVISI_TICKET.Remark, TBL_T_REVISI_TICKET.KodeBooking, tblFlight.NoTelp, tblFlight.Umur, tblFlight.Fortiket, tblFlight.Site, TBL_T_REVISI_TICKET.ID_Rev, tblTravelAuthorization_Supplier_Reff.NamaSupplier FROM TBL_T_REVISI_TICKET INNER JOIN tblFlight ON TBL_T_REVISI_TICKET.IdFlight = tblFlight.ID INNER JOIN tblTravelAuthorization_Supplier_Reff ON TBL_T_REVISI_TICKET.KodeSupplier = tblTravelAuthorization_Supplier_Reff.KodeSupplier WHERE (TBL_T_REVISI_TICKET.AssignBy IS NOT NULL) AND (TBL_T_REVISI_TICKET.Status = 'AGENT') AND (TBL_T_REVISI_TICKET.KodeSupplier = @Agent)">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Agent" Name="Agent"></asp:SessionParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                        </div> 
                        </div> 
                    </div> 
            </div> 
        </div> 
        </div> 
       
    <div class ="col-sm-6">
             <div class="box box-danger">
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
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_kodebooking" runat="server" CssClass ="form-control "></asp:TextBox>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                           
                                                                        <div class="col-sm-5 ">
                                        <asp:DropDownList ID="ddl_maskapai" runat="server" CssClass="form-control " DataSourceID="ds_maskapai" DataTextField="FlightName" DataValueField="AirlineCode" AutoPostBack ="true" ></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="ds_maskapai" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT NULL AS FlightName, NULL AS AirlineCode UNION SELECT DISTINCT CASE WHEN MASKAPAI IN ('LION AIR' , 'BATIK AIR' , 'WINGS AIR') THEN 'LION AIR' WHEN MASKAPAI IN ('SRIWIJAYA AIR' , 'NAM AIR') THEN 'SRIWIJAYA AIR' ELSE Maskapai END AS FlightName, CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END AS AirlineCode FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @Tujuan) AND (MaskapaiCode <> CASE WHEN @AGENT = 2 THEN 'GA' ELSE 'XX' END)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_dari" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                            <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                    
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kelas</label>
                           
                                                                        <div class="col-sm-3 ">
                                        <asp:DropDownList ID="ddl_kelas" runat="server" CssClass="form-control " DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas" AutoPostBack ="true" ></asp:DropDownList>
                                     <asp:SqlDataSource runat="server" ID="ds_kelas" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT [Kelas] FROM [tblTravelAuthorization_Flight_Class] WHERE ([AirlineCode] = @AirlineCode)">
                                                             <SelectParameters>
                                                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="AirlineCode" Type="String"></asp:ControlParameter>
                                                             </SelectParameters>
                                                         </asp:SqlDataSource>
                                </div>
                    
                                </div>
                         <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tanggal</label>
                            <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_Tanggal_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                             <div class="col-sm-4 control-label">
                                       <asp:DropDownList ID="ddl_jam" runat="server" CssClass="form-control" DataSourceID="ds_jam" DataTextField="Berangkat_Desc" DataValueField="Berangkat"></asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="ds_jam" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT Berangkat, MaskapaiCode + '-' + Berangkat AS Berangkat_Desc FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @TUJUAN) AND (CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END = @MASKAPAI)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lbl_dari" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                        </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Service Fee</label>
                            <div class="col-sm-5 control-label">
                                        <asp:TextBox ID="txt_servicefee" runat="server" CssClass ="form-control " Text ="25000"></asp:TextBox>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Nomor Tiket</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_nomortiket" runat="server" CssClass ="form-control "></asp:TextBox>
                     </div>
                                </div>
                          <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Biaya Revisi</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_biaya" runat="server" CssClass ="form-control "></asp:TextBox>
                     </div>
                                </div>
                        <div class="form-group">
                                   <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Keterangan</label>
                            <div class="col-sm-8 control-label">
                                        <asp:Label ID="lbl_Ket_Rev" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                </div>
                       
                        </div> 
                    </div> 
                 </div> 
         </div>
         <div class ="col-sm-12">
                <div class="box box-danger">
                
                <div class="box-body">
                    <div class="form-horizontal">
                       
                         <div class="col-sm-10" >
                             <asp:Label ID="lbl_id" runat="server" Font-Bold ="true" Visible ="false"   Text="#"></asp:Label>
                         </div> 
                        <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-facebook" />
                            </div> 
                       
                       </div> 
                    </div> 
                </div> </div>     
         </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
