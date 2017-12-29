<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_ModifBooking.aspx.vb" Inherits="HRGA_OL.Frm_ModifBooking" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-6">
            <div class="box box-primary">
                
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small">Nomor TA</label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddl_TA" runat="server" CssClass="form-control" DataSourceID="ds_TA" DataTextField="TravelAuthorizeNo" DataValueField="TravelAuthorizeNo" AutoPostBack ="true" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_TA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT id, TravelAuthorizeNo FROM (SELECT 0 AS id, 'Pilih Nomor TA' AS TravelAuthorizeNo UNION SELECT DISTINCT 1 AS id, TravelAuthorizeNo FROM [vw_TA_Tiket_onOrder] Where StatusBiding IS NULL AND KodeSupplier=@AGENT) AS drv_A ORDER BY id">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="AGENT" Name="AGENT"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Area</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ddl_area" runat="server" CssClass="form-control" DataSourceID="ds_Area" DataTextField="Area" DataValueField="Area" AutoPostBack ="true"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_Area" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="
                                    SELECT NULL Area UNION
                                    SELECT DISTINCT Area FROM vw_TA_Tiket_onOrder WHERE (TravelAuthorizeNo = @TA) AND StatusBiding IS NULL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                           
                            </div> 
                        <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listBooking" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="KodeBooking" DataSourceID="ds_listTA" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" OnSelectedIndexChanging ="gv_listBooking_SelectedIndexChanging"    >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/Designs/Images/arrow.png" ButtonType="Image"></asp:CommandField>
                                                 <asp:BoundField DataField="KodeBooking" HeaderText="Kode Booking" SortExpression="KodeBooking">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="FlightName" HeaderText="Maskapai" SortExpression="FlightName">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TglBooking" HeaderText="Tanggal Booking" SortExpression="TglBooking">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NTA" HeaderText="NTA" SortExpression="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="ServiceFee" HeaderText="Service Fee" SortExpression="ServiceFee">
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
                     
                            <asp:SqlDataSource runat="server" ID="ds_listTA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT vw_TA_Tiket_onOrder.KodeBooking, tblTravelAuthorization_Flight.FlightName, CONVERT (varchar(10), vw_TA_Tiket_onOrder.TglBooking, 105) AS TglBooking, TBL_T_BOOKING.NTA, TBL_T_BOOKING.ServiceFee FROM vw_TA_Tiket_onOrder INNER JOIN tblTravelAuthorization_Flight ON vw_TA_Tiket_onOrder.AirlineCode = tblTravelAuthorization_Flight.AirlineCode INNER JOIN TBL_T_BOOKING ON vw_TA_Tiket_onOrder.KodeBooking = TBL_T_BOOKING.KodeBooking AND vw_TA_Tiket_onOrder.AirlineCode = TBL_T_BOOKING.Maskapai_Code WHERE (vw_TA_Tiket_onOrder.statusBiding IS NULL) AND (vw_TA_Tiket_onOrder.KodeSupplier = @AGENT) AND (vw_TA_Tiket_onOrder.TglIssued IS NULL) AND (vw_TA_Tiket_onOrder.TravelAuthorizeNo = @TA) AND (vw_TA_Tiket_onOrder.Area = @AREA)">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="AGENT" Name="AGENT"></asp:SessionParameter>
                                    <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddl_area" PropertyName="SelectedValue" Name="AREA"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div> 
                        </div> 
                    </div> 
            </div> 
        </div> 
        </div> 
        <div class="col-sm-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Modif Booking</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                     <div class="col-sm-2 control-label">
                                        <asp:Label ID="lbl_kodebooking" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                 <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                     <div class="col-sm-1 control-label">
                                        <asp:Label ID="lbl_maskapai" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                 <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_Maskapaidesc" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                            <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Service Fee</label>
                     <div class="col-sm-2 control-label">
                                        <asp:Label ID="lbl_servicefee" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                 <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Total NTA</label>
                     <div class="col-sm-2 control-label">
                                        <asp:Label ID="lbl_NTA" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                             <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tanggal Limit</label>
                     <div class="col-sm-5 control-label">
                                        <asp:Label ID="lbl_tgllimit" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                                
                     </div>

                        </div>
                      
                       <div class ="col-sm-12">
                          
                       </div> 
                       
                        </div> 
                    </div> 
            </div> 
             <div class="box box-info">
                 <div class ="box-body ">
                     <div class="form-horizontal"> 
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
                                 <asp:ControlParameter ControlID="lbl_maskapai" PropertyName="Text" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>
                     <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_booking" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8"  >
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
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas" SelectedValue='<%# Bind("Kelas")%>' ></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60" Text='<%# Bind("NTA")%>' ></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 
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
                                         <asp:SqlDataSource runat="server" ID="ds_booking" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT id, Nama + ' (' + Umur + ')' AS Nama, NoTelp, SUBSTRING(NomorST, 13, 5) AS NomorST, NTA, Kelas FROM vw_TA_Tiket_onOrder WHERE (statusBiding IS NULL) AND (Departure = @Dari) AND (Arrive = @Tujuan) AND (KodeBooking = @Kode)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="lbl_dari" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_kodebooking" PropertyName="Text" Name="Kode"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                          <asp:SqlDataSource runat="server" ID="ds_kelas" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT [Kelas] FROM [tblTravelAuthorization_Flight_Class] WHERE ([AirlineCode] = @AirlineCode)">
                                                             <SelectParameters>
                                                                 <asp:ControlParameter ControlID="lbl_maskapai" PropertyName="Text" Name="AirlineCode" Type="String"></asp:ControlParameter>
                                                             </SelectParameters>
                                                         </asp:SqlDataSource>
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
                                 <asp:ControlParameter ControlID="lbl_maskapai" PropertyName="Text" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>
                         <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_transit" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_bookingtransit" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8"   >
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
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas" SelectedValue='<%# Bind("Kelas")%>' ></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60" Text='<%# Bind("NTA")%>' ></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT id, Nama + ' (' + Umur + ')' AS Nama, NoTelp, SUBSTRING(NomorST, 13, 5) AS NomorST, NTA, Kelas FROM vw_TA_Tiket_onOrder WHERE (statusBiding IS NULL) AND (Departure = @Dari) AND (Arrive = @Tujuan) AND (KodeBooking = @Kode)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                            <SelectParameters>
                                                 <asp:ControlParameter ControlID="lbl_tujuan" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_ketransit" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_kodebooking" PropertyName="Text" Name="Kode"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                     </div>

                     </div>
                 </div>
                 </div> 

            <div class="box box-info" runat ="server" id ="box_r2">
                 <div class ="box-body ">
                      <div class="form-horizontal">
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
                                 <asp:ControlParameter ControlID="lbl_maskapai" PropertyName="Text" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>
                     <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_booking_r2" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking_r2" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8"  >
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
                                                       <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas" SelectedValue='<%# Bind("Kelas")%>' ></asp:DropDownList>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60" Text='<%# Bind("NTA")%>'></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                
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
                                          <asp:SqlDataSource runat="server" ID="ds_booking_r2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT id, Nama + ' (' + Umur + ')' AS Nama, NoTelp, SUBSTRING(NomorST, 13, 5) AS NomorST, NTA, Kelas FROM vw_TA_Tiket_onOrder WHERE (statusBiding IS NULL) AND (Departure = @Dari) AND (Arrive = @Tujuan) AND (KodeBooking = @Kode)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="lbl_dari_r2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_tujuan_r2" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_kodebooking" PropertyName="Text" Name="Kode"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                         </div> 
                                    </div>
                     </div>
                          <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Rute Transit Ke</label>
                     <div class="col-sm-3 control-label">
                                        <asp:Label ID="lbl_ketransit_r2" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small; text-align: left">Jam</label>
                     <div class="col-sm-3">
                         <asp:DropDownList ID="ddl_jamtransit_R2" runat="server" CssClass="form-control" DataSourceID="ds_jamtransit_R2" DataTextField="Berangkat_Desc" DataValueField="Berangkat"></asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="ds_jamtransit_R2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT Berangkat, MaskapaiCode + '-' + Berangkat AS Berangkat_Desc FROM tblPenerbangan WHERE (Dari = @DARI) AND (Tujuan = @TUJUAN) AND (CASE WHEN MaskapaiCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN MaskapaiCode IN ('SJ' , 'IN') THEN 'SJ' ELSE MASKAPAICODE END = @MASKAPAI)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="lbl_tujuan_R2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_ketransit_R2" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="lbl_maskapai" PropertyName="Text" Name="MASKAPAI"></asp:ControlParameter>
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     </div>

                                                   <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_transit_R2" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_bookingtransit_R2" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8"   >
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
                                                         <asp:DropDownList ID="ddl_class" runat="server" DataSourceID="ds_kelas" DataTextField="Kelas" DataValueField="Kelas" SelectedValue='<%# Bind("Kelas")%>' ></asp:DropDownList>
                                                        
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="NTA">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="60" Text='<%# Bind("NTA")%>' ></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit_R2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT id, Nama + ' (' + Umur + ')' AS Nama, NoTelp, SUBSTRING(NomorST, 13, 5) AS NomorST, NTA, Kelas FROM vw_TA_Tiket_onOrder WHERE (statusBiding IS NULL) AND (Departure = @Dari) AND (Arrive = @Tujuan) AND (KodeBooking = @Kode)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                            <SelectParameters>
                                                 <asp:ControlParameter ControlID="lbl_tujuan_R2" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_ketransit_R2" PropertyName="Text" Name="Tujuan"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="lbl_kodebooking" PropertyName="Text" Name="Kode"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                     </div>
                     </div>
                 </div>
                 </div>
           <div class="box box-primary">
                
                <div class="box-body">
                    <div class="form-horizontal">
                     
                        <div class="col-sm-4" >
                             <asp:Button ID="btn_delete" runat="server" Text="Cancel Booking" class="btn btn-warning " Visible ="false"  />
                            </div>
                        <div class="col-sm-5" ></div> 
                        <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-success " Visible ="false"  />
                            </div> 
                       
                       </div> 
                    </div> 
                </div> 

        </div> 
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
