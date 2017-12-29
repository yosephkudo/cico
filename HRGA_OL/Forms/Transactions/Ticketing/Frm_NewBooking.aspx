<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_NewBooking.aspx.vb" Inherits="HRGA_OL.Frm_NewBooking" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">New Booking</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-12 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                                    <div class="col-sm-12">
                                        <asp:TextBox ID="txt_kodebooking" runat="server" CssClass="form-control" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                               
                            </div>
                        </div>
                        <div class="col-sm-12">
                         <div class="col-sm-6">
                             <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-12 control-label" style="font-size: small; text-align: left">Service Fee</label>
                                   
                                    <div class="col-sm-12">
                                        <asp:Label ID="lbl_servicefee" runat="server" Text="0"></asp:Label>
                                    </div>
                                    
                                </div>
                         </div> 
                            <div class="col-sm-6">
                                <div class="form-group ">
                                     <label for="inputEmail3" class="col-sm-12 control-label" style="font-size: small; text-align: left">Maskapai</label>
                                <div class="col-sm-12 ">
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
                                    
                                </div> 
                            
                              
                            </div>
                            <div class="col-sm-12">
                                 <div class="col-sm-6">
                                <div class="form-group">

                                    <label for="inputEmail3" class="col-sm-12 control-label" style="font-size: small; text-align: left">Tanggal Limit</label>
                                   
                                    <div class="col-sm-12">
                                        <asp:TextBox ID="txt_tgllimit" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tgllimit" ID="txt_tgllimit_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                                    </div>
                                
                                </div> 
                                     </div>
                                 <div class="col-sm-6">
                                <div class="form-group">
                                     <label for="inputEmail3" class="col-sm-12 control-label" style="font-size: small; text-align: left">Jam Limit</label>
                                     <div class="col-sm-5"> 
                                <asp:TextBox ID="txt_jamlimit" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamlimit" ID="txt_jamlimit_MaskedEditExtender" Mask="99:99" ClearMaskOnLostFocus="False"></asp:MaskedEditExtender>
                                 </div>
                                    </div> 
                                     </div> 
                                 
                            </div> 
                            
                        
                        <div class="col-sm-6"></div> 
                            <div class="col-sm-6" >
                                <asp:Button ID="btn_one" runat="server" Text="One Way" class="btn btn-instagram" />
                                 <asp:Button ID="btn_pp" runat="server" Text="Round Trip" class="btn btn-google" />
                                </div> 
                       <div class ="col-sm-12">
                          
                       </div> 
                       
                        </div> 
                    </div> 
            </div> 
             <div class="box box-info">
                 <div class ="box-body ">
                     <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Rute</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_dari" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Ke</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_tujuan" runat="server" Font-Bold ="true"   Text="#"></asp:Label>
                     </div>
                     </div>
                     <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Tanggal</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_tanggal" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Jam</label>
                     <div class="col-sm-3">
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
                     <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_booking" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting ="gv_booking_RowDeleting"  >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor" SortExpression="NomorST">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">

                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Width="150" />
                                                     <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="Phone" SortExpression="NoTelp">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="Class">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate>
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas"></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_booking" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT VW_TA_FLIGHT.ID, VW_TA_FLIGHT.Nama + ' (' + VW_TA_FLIGHT.Umur + ')' AS Nama, VW_TA_FLIGHT.NoTelp, SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) AS NomorST FROM VW_TA_FLIGHT INNER JOIN TBL_TEMP_BOOKING ON VW_TA_FLIGHT.ID = TBL_TEMP_BOOKING.ID AND SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (VW_TA_FLIGHT.Dari = @DARI) AND (VW_TA_FLIGHT.Tujuan = @Tujuan) AND (CONVERT (varchar(10), VW_TA_FLIGHT.Tanggal, 105) = @Tanggal)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Host" Name="HOST"></asp:SessionParameter>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                                 <asp:ControlParameter ControlID="lbl_dari" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tanggal" PropertyName="Text" Name="Tanggal"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                          <asp:SqlDataSource runat="server" ID="ds_kelas" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT [Kelas] FROM [tblTravelAuthorization_Flight_Class] WHERE ([AirlineCode] = @AirlineCode)">
                                                             <SelectParameters>
                                                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="AirlineCode" Type="String"></asp:ControlParameter>
                                                             </SelectParameters>
                                                         </asp:SqlDataSource>
                     </div>
                    <div class="form-group "> 
                         <br />
                         <br />
                     </div>
                    <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Rute Transit Ke</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_ketransit" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Jam</label>
                     <div class="col-sm-3">
                         <asp:DropDownList ID="ddl_jamtransit" runat="server" CssClass="form-control" DataSourceID="ds_jamtransit" DataTextField="Berangkat_Desc" DataValueField="Berangkat"></asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="ds_jamtransit" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT Berangkat, MaskapaiCode + '-' + Berangkat AS Berangkat_Desc FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @TUJUAN) AND (CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END = @MASKAPAI)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_ketransit" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>
                                          <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_transit" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_bookingtransit" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting ="gv_transit_RowDeleting"   >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor" SortExpression="NomorST">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">

                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Width="150" />
                                                     <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="Phone" SortExpression="NoTelp">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="Class">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate>
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas"></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT VW_TA_FLIGHT.ID, VW_TA_FLIGHT.Nama + ' (' + VW_TA_FLIGHT.Umur + ')' AS Nama, VW_TA_FLIGHT.NoTelp, SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) AS NomorST FROM VW_TA_FLIGHT INNER JOIN TBL_TEMP_BOOKING ON VW_TA_FLIGHT.ID = TBL_TEMP_BOOKING.ID AND SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (VW_TA_FLIGHT.Dari = @DARI) AND (VW_TA_FLIGHT.Tujuan = @Tujuan) AND (CONVERT (varchar(10), VW_TA_FLIGHT.Tanggal, 105) = @Tanggal)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Host" Name="HOST"></asp:SessionParameter>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_ketransit" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tanggal" PropertyName="Text" Name="Tanggal"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                     </div>
                 </div>
                 </div> 
             
            <div class="box box-info" runat ="server" id ="box_r2">
                 <div class ="box-body ">
                     <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Rute</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_dari_r2" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Ke</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_tujuan_r2" runat="server" Font-Bold ="true"   Text="#"></asp:Label>
                     </div>
                     </div>
                     <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Tanggal</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_tanggal_r2" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Jam</label>
                     <div class="col-sm-3">
                                 <asp:DropDownList ID="ddl_jam_r2" runat="server" CssClass="form-control" DataSourceID="ds_jam_r2" DataTextField="Berangkat_Desc" DataValueField="Berangkat"></asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="ds_jam_r2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT Berangkat, MaskapaiCode + '-' + Berangkat AS Berangkat_Desc FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @TUJUAN) AND (CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END = @MASKAPAI)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lbl_dari_r2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_tujuan_r2" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>
                     <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_booking_r2" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking_r2" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting ="gv_booking_r2_RowDeleting" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor" SortExpression="NomorST">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                   
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Width="150" />
                                                     <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                             
                                                 </asp:BoundField>
                                                  <asp:BoundField DataField="NoTelp" HeaderText="Phone" SortExpression="NoTelp">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                             
                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="Class">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                        <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas"></asp:DropDownList>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_booking_r2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT VW_TA_FLIGHT.ID, VW_TA_FLIGHT.Nama + ' (' + VW_TA_FLIGHT.Umur + ')' AS Nama, VW_TA_FLIGHT.NoTelp, SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) AS NomorST FROM VW_TA_FLIGHT INNER JOIN TBL_TEMP_BOOKING ON VW_TA_FLIGHT.ID = TBL_TEMP_BOOKING.ID AND SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (VW_TA_FLIGHT.Dari = @DARI) AND (VW_TA_FLIGHT.Tujuan = @Tujuan) AND (CONVERT (varchar(10), VW_TA_FLIGHT.Tanggal, 105) = @Tanggal)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Host" Name="HOST"></asp:SessionParameter>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                                 <asp:ControlParameter ControlID="lbl_dari_r2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan_r2" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tanggal_r2" PropertyName="Text" Name="Tanggal"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                         </div> 
                                    </div>
                     </div>
                     <div class="form-group "> 
                         <br />
                         <br />
                     </div>
                      <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Rute Transit Ke</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_ketransit_R2" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Jam</label>
                     <div class="col-sm-3">
                         <asp:DropDownList ID="ddl_jamtransit_R2" runat="server" CssClass="form-control" DataSourceID="ds_jamtransit_R2" DataTextField="Berangkat_Desc" DataValueField="Berangkat"></asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="ds_jamtransit_R2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT Berangkat, MaskapaiCode + '-' + Berangkat AS Berangkat_Desc FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @TUJUAN) AND (CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END = @MASKAPAI)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lbl_tujuan_r2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_ketransit_r2" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="ddl_maskapai" PropertyName="SelectedValue" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>

                     <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_transit_R2" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_bookingtransit_R2" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting="gv_transit_R2_RowDeleting"    >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor" SortExpression="NomorST">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">

                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Width="150" />
                                                     <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NoTelp" HeaderText="Phone" SortExpression="NoTelp">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>

                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="Class">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate>
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas"></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit_R2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT VW_TA_FLIGHT.ID, VW_TA_FLIGHT.Nama + ' (' + VW_TA_FLIGHT.Umur + ')' AS Nama, VW_TA_FLIGHT.NoTelp, SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) AS NomorST FROM VW_TA_FLIGHT INNER JOIN TBL_TEMP_BOOKING ON VW_TA_FLIGHT.ID = TBL_TEMP_BOOKING.ID AND SUBSTRING(VW_TA_FLIGHT.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (VW_TA_FLIGHT.Dari = @DARI) AND (VW_TA_FLIGHT.Tujuan = @Tujuan) AND (CONVERT (varchar(10), VW_TA_FLIGHT.Tanggal, 105) = @Tanggal)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Host" Name="HOST"></asp:SessionParameter>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan_R2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_ketransit_R2" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tanggal_R2" PropertyName="Text" Name="Tanggal"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                     </div>
                 </div>
                 </div>
         

        </div> 
         <div class="col-sm-6">
            <div class="box box-primary">
                
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small">Nomor TA</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddl_TA" runat="server" CssClass="form-control" DataSourceID="ds_TA" DataTextField="TravelAuthorizeNo" DataValueField="TravelAuthorizeNo" AutoPostBack ="true" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_TA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT id, TravelAuthorizeNo FROM (SELECT 0 AS id, 'Pilih Nomor TA' AS TravelAuthorizeNo UNION SELECT 1 AS id, DRV_TA2.TravelAuthorizeNo FROM tblTravelAuthorization_Supplier_Trans INNER JOIN (SELECT DISTINCT TravelAuthorizeNo FROM (SELECT VW_TA_FLIGHT.TravelAuthorizeNo, VW_TA_FLIGHT.NomorST, MIN(VW_TA_FLIGHT.Tanggal) AS tanggal FROM VW_TA_FLIGHT LEFT OUTER JOIN vw_TA_Tiket_onOrder ON VW_TA_FLIGHT.ID = vw_TA_Tiket_onOrder.idFlight WHERE (VW_TA_FLIGHT.STATUS_TA = 'SUDAH ASSIGN') AND (vw_TA_Tiket_onOrder.StatusBiding IS NULL) GROUP BY VW_TA_FLIGHT.NomorST, VW_TA_FLIGHT.TravelAuthorizeNo) AS drv_TA WHERE (tanggal > GETDATE())) AS DRV_TA2 ON DRV_TA2.TravelAuthorizeNo = tblTravelAuthorization_Supplier_Trans.TravelAuthorizeNo WHERE (tblTravelAuthorization_Supplier_Trans.KodeSupplier = @AGENT)) AS drv_A ORDER BY id">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            </div> 
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Area</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddl_area" runat="server" CssClass="form-control" DataSourceID="ds_Area" DataTextField="Area" DataValueField="Area" AutoPostBack ="true"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_Area" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="
                                    SELECT NULL Area UNION
                                    SELECT DISTINCT Area FROM VW_TA_FLIGHT WHERE (TravelAuthorizeNo = @TA)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                            <div class="col-sm-5"> 
                                     <asp:TextBox ID="txt_cari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                            </div> 
                        <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listTA" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_listTA" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" OnSelectedIndexChanging ="gv_listTA_SelectedIndexChanging"  >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Designs/Images/add.png" ButtonType="Image"></asp:CommandField>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor" SortExpression="NomorST">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                      
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                   
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Width="150" />
                                                     <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                             
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="tghtgt" HeaderText="Tanggal" ReadOnly="True" SortExpression="tghtgt">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                         
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Dari" HeaderText="Dari" SortExpression="Dari">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                       
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tujuan" HeaderText="Tujuan" SortExpression="Tujuan">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                           
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Maskapai" HeaderText="Maskapai" SortExpression="Maskapai">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                           
                                                 </asp:BoundField>
                                                  <asp:BoundField DataField="NoTelp" HeaderText="Phone" SortExpression="NoTelp">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
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
                     
                            <asp:SqlDataSource runat="server" ID="ds_listTA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT ID, Substring(NomorST,13,5) NomorST, Nama +' ('+Umur+')' Nama, Umur, NoTelp, GAnonGA, Tanggal, tghtgt, Berangkat, Dari, Tujuan, Keterangan, KodeSupplier, NomorSetTiket, jum, TGL_MIN, Maskapai FROM dbo.CUFN_GET_LIST_TA_BELUM_BOOKING(@TA, @SUPPLIER, @AREA, @SEARCH) AS CUFN_GET_LIST_TA_BELUM_BOOKING_1 WHERE CAST(ID AS VARCHAR(5)) +'-'+Substring(NomorST,13,5) + '-'+ CAST(@SUPPLIER AS VARCHAR) NOT IN (SELECT CAST(ID AS VARCHAR(5)) +'-'+NOMORST + '-'+ CAST(ID_AGENT AS VARCHAR(5)) FROM TBL_TEMP_BOOKING) ORDER BY CAST(TGL_MIN AS DATE)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                    <asp:SessionParameter SessionField="Agent" Name="SUPPLIER"></asp:SessionParameter>
                                    <asp:ControlParameter ControlID="ddl_area" PropertyName="SelectedValue" Name="AREA"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txt_cari" PropertyName="Text" Name="SEARCH"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div> 
                        </div> 
                    </div> 
            </div> 
            
             <div class="box box-primary">
                
                <div class="box-body">
                    <div class="form-horizontal">
                         <div class="col-sm-10" ></div> 
                        <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-twitter " />
                            </div> 
                       
                       </div> 
                    </div> 
                </div> 
        </div> 
        </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
