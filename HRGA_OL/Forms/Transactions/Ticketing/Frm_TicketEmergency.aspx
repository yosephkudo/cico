<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_TicketEmergency.aspx.vb" Inherits="HRGA_OL.Frm_TicketEmergency" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Ticket Emergency</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txt_kodebooking" runat="server" CssClass="form-control" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                                </div>
                   
                     
                             <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Service Fee</label>
                                   
                                    <div class="col-sm-5">
                                        <asp:Label ID="lbl_servicefee" runat="server" Text="0"></asp:Label>
                                    </div>
                                    
                                </div>

                                <div class="form-group ">
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
                                         <asp:GridView ID="gv_booking" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting="gv_booking_RowDeleting"   >
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
                                                         <asp:TextBox ID="txt_NTA" runat="server" Width ="80"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Nomor Tiket">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_notiket" runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="reqTiket" runat="server" ErrorMessage="*" ControlToValidate ="txt_notiket" ForeColor ="Red"  Font-Size ="15pt" ></asp:RequiredFieldValidator>
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
                                         <asp:SqlDataSource runat="server" ID="ds_booking" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT distinct vw_TA_Tiket_onOrder_NonTA.idflight as ID, vw_TA_Tiket_onOrder_NonTA.Nama + ' (' + vw_TA_Tiket_onOrder_NonTA.Umur + ')' AS Nama, vw_TA_Tiket_onOrder_NonTA.NoTelp, SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) AS NomorST FROM vw_TA_Tiket_onOrder_NonTA INNER JOIN TBL_TEMP_BOOKING ON vw_TA_Tiket_onOrder_NonTA.idFlight = TBL_TEMP_BOOKING.ID AND SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (vw_TA_Tiket_onOrder_NonTA.Departure = @DARI) AND (vw_TA_Tiket_onOrder_NonTA.Arrive = @Tujuan) AND (CONVERT (varchar(10), vw_TA_Tiket_onOrder_NonTA.TglBerangkat, 105) = @Tanggal)"
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
                                         <asp:GridView ID="gv_transit" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_bookingtransit" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting="gv_transit_RowDeleting"    >
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
                                                         <asp:TextBox ID="txt_NTA" runat="server"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Nomor Tiket">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_notiket" runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="reqTiket" runat="server" ErrorMessage="*" ControlToValidate ="txt_notiket" ForeColor ="Red"  Font-Size ="15pt" ></asp:RequiredFieldValidator>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT distinct vw_TA_Tiket_onOrder_NonTA.idflight as ID, vw_TA_Tiket_onOrder_NonTA.Nama + ' (' + vw_TA_Tiket_onOrder_NonTA.Umur + ')' AS Nama, vw_TA_Tiket_onOrder_NonTA.NoTelp, SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) AS NomorST FROM vw_TA_Tiket_onOrder_NonTA INNER JOIN TBL_TEMP_BOOKING ON vw_TA_Tiket_onOrder_NonTA.IDflight = TBL_TEMP_BOOKING.ID AND SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (vw_TA_Tiket_onOrder_NonTA.Departure = @DARI) AND (vw_TA_Tiket_onOrder_NonTA.Arrive = @Tujuan) and Convert(varchar(10),vw_TA_Tiket_onOrder_NonTA.TglBerangkat,105)=@Tanggal"
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
                                         <asp:GridView ID="gv_booking_r2" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_booking_r2" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" PageSize="8" OnRowDeleting="gv_booking_r2_RowDeleting"  >
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
                                                         <asp:TextBox ID="txt_NTA" runat="server"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Nomor Tiket">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_notiket" runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="reqTiket" runat="server" ErrorMessage="*" ControlToValidate ="txt_notiket" ForeColor ="Red"  Font-Size ="15pt" ></asp:RequiredFieldValidator>
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
                                         <asp:SqlDataSource runat="server" ID="ds_booking_r2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT distinct vw_TA_Tiket_onOrder_NonTA.idflight as ID, vw_TA_Tiket_onOrder_NonTA.Nama + ' (' + vw_TA_Tiket_onOrder_NonTA.Umur + ')' AS Nama, vw_TA_Tiket_onOrder_NonTA.NoTelp, SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) AS NomorST FROM vw_TA_Tiket_onOrder_NonTA INNER JOIN TBL_TEMP_BOOKING ON vw_TA_Tiket_onOrder_NonTA.IDflight = TBL_TEMP_BOOKING.ID AND SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (vw_TA_Tiket_onOrder_NonTA.Departure = @DARI) AND (vw_TA_Tiket_onOrder_NonTA.Arrive = @Tujuan) and Convert(varchar(10),vw_TA_Tiket_onOrder_NonTA.TglBerangkat,105)=@Tanggal"
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
                                                         <asp:TextBox ID="txt_NTA" runat="server"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Nomor Tiket">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_notiket" runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="reqTiket" runat="server" ErrorMessage="*" ControlToValidate ="txt_notiket" ForeColor ="Red"  Font-Size ="15pt" ></asp:RequiredFieldValidator>
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
                                         <asp:SqlDataSource runat="server" ID="ds_bookingtransit_R2" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT distinct vw_TA_Tiket_onOrder_NonTA.idflight as ID, vw_TA_Tiket_onOrder_NonTA.Nama + ' (' + vw_TA_Tiket_onOrder_NonTA.Umur + ')' AS Nama, vw_TA_Tiket_onOrder_NonTA.NoTelp, SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) AS NomorST FROM vw_TA_Tiket_onOrder_NonTA INNER JOIN TBL_TEMP_BOOKING ON vw_TA_Tiket_onOrder_NonTA.IDflight = TBL_TEMP_BOOKING.ID AND SUBSTRING(vw_TA_Tiket_onOrder_NonTA.NomorST, 13, 5) = TBL_TEMP_BOOKING.NOMORST WHERE (TBL_TEMP_BOOKING.HOSTNAME = @HOST) AND (TBL_TEMP_BOOKING.ID_AGENT = @AGENT) AND (vw_TA_Tiket_onOrder_NonTA.Departure = @DARI) AND (vw_TA_Tiket_onOrder_NonTA.Arrive = @Tujuan) and Convert(varchar(10),vw_TA_Tiket_onOrder_NonTA.TglBerangkat,105)=@Tanggal"
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
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small">Nomor NonTA</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_TA" runat="server" CssClass="form-control" DataSourceID="ds_TA" DataTextField="TravelAuthorizeNo" DataValueField="TravelAuthorizeNo" AutoPostBack ="true" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_TA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT id, TravelAuthorizeNo FROM (SELECT 0 AS id, 'Pilih Nomor' AS TravelAuthorizeNo UNION SELECT DISTINCT 1 as id, NOMORTE AS TravelAuthorizeNo FROM tblTravelAuthorization_TicketOrder_NonTA
                                  WHERE TGLISSUED IS NULL  AND KODESUPPLIER=@SUPPLIER AND DATEADD(DAY,3,TGLBERANGKAT)>=CAST(GETDATE() AS DATE)) AS drv_A ORDER BY id"><SelectParameters>
<asp:SessionParameter SessionField="Agent" Name="SUPPLIER"></asp:SessionParameter>
</SelectParameters>
</asp:SqlDataSource>
                            </div>
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                            <div class="col-sm-4"> 
                                     <asp:TextBox ID="txt_cari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                            </div> 
                        <div class="col-sm-12">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_listTA" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_listTA" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" OnSelectedIndexChanging="gv_listTA_SelectedIndexChanging"   >
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
                     
                            <asp:SqlDataSource runat="server" ID="ds_listTA" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT distinct  ID, Substring(NomorST,13,5) NomorST, Nama +' ('+Umur+')' Nama, Umur, NoTelp,  Tanggal, tghtgt, Berangkat, Dari, Tujuan, Keterangan, KodeSupplier, NomorSetTiket,  Maskapai FROM dbo.CUFN_GET_LIST_NONTA_BELUM_ORDER(@TA, @SUPPLIER, @SEARCH)
                                WHERE CAST(ID AS VARCHAR(5)) +'-'+Substring(NomorST,13,5) + '-'+ CAST(@SUPPLIER AS VARCHAR) NOT IN (SELECT CAST(ID AS VARCHAR(5)) +'-'+NOMORST + '-'+ CAST(ID_AGENT AS VARCHAR(5)) FROM TBL_TEMP_BOOKING)
                                ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_TA" PropertyName="SelectedValue" Name="TA"></asp:ControlParameter>
                                    <asp:SessionParameter SessionField="Agent" Name="SUPPLIER"></asp:SessionParameter>
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
