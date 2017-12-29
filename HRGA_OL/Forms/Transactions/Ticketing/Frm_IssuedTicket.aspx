<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_IssuedTicket.aspx.vb" Inherits="HRGA_OL.Frm_IssuedTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-6">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">List Ticket Issued</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                                             <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_issued" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="KodeBooking" DataSourceID="ds_issued" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" OnSelectedIndexChanging ="gv_issued_SelectedIndexChanging" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Designs/Images/arrow.png"></asp:CommandField>
                                                 <asp:BoundField DataField="KodeBooking" HeaderText="Kode Booking" SortExpression="KodeBooking">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="FlightName" HeaderText="Maskapai" SortExpression="FlightName">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TglBooking" HeaderText="Tanggal Booking" SortExpression="TglBooking">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NTA" HeaderText="NTA" SortExpression="NTA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="ServiceFee" HeaderText="ServiceFee" SortExpression="ServiceFee">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
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
                                         <asp:SqlDataSource runat="server" ID="ds_issued" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT DISTINCT vw_TA_Tiket_onOrder.KodeBooking, CASE WHEN tblTravelAuthorization_Flight.FlightName IN ('LION AIR' , 'BATIK AIR' , 'WINGS AIR') THEN 'LION AIR' WHEN tblTravelAuthorization_Flight.FlightName IN ('SRIWIJAYA AIR' , 'NAM AIR') THEN 'SRIWIJAYA AIR' ELSE tblTravelAuthorization_Flight.FlightName END AS FlightName, CONVERT (varchar(10), vw_TA_Tiket_onOrder.TglBooking, 105) AS TglBooking, TBL_T_BOOKING.NTA, TBL_T_BOOKING.ServiceFee FROM vw_TA_Tiket_onOrder INNER JOIN tblTravelAuthorization_Flight ON vw_TA_Tiket_onOrder.AirlineCode = tblTravelAuthorization_Flight.AirlineCode INNER JOIN TBL_T_BOOKING ON vw_TA_Tiket_onOrder.KodeBooking = TBL_T_BOOKING.KodeBooking AND CASE WHEN vw_TA_Tiket_onOrder.AirlineCode IN ('ID' , 'JT' , 'IW') THEN 'JT' WHEN vw_TA_Tiket_onOrder.AirlineCode IN ('SJ' , 'IN') THEN 'SJ' ELSE vw_TA_Tiket_onOrder.AirlineCode END = TBL_T_BOOKING.Maskapai_Code LEFT OUTER JOIN TBL_T_REVISI_TICKET ON vw_TA_Tiket_onOrder.idFlight = TBL_T_REVISI_TICKET.IdFlight_Rev WHERE (vw_TA_Tiket_onOrder.statusBiding = 1) AND (vw_TA_Tiket_onOrder.KodeSupplier = @AGENT) AND (vw_TA_Tiket_onOrder.TglIssued IS NULL) AND (TBL_T_REVISI_TICKET.IdFlight_Rev IS NULL)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                         </div> 
                                    </div>
                     </div>
                        </div> 
                    </div> 
                </div> 
            </div>
         <div class="col-sm-6">
            <div class="box box-info" runat ="server"  >
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kode Booking</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_kodebooking" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_maskapai" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">NTA</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_NTA" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Service Fee</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_servicefee" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_detailtiket" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_detailissued" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="TglBerangkat" HeaderText="Tanggal" SortExpression="TglBerangkat">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Departure" HeaderText="Departure" SortExpression="Departure">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Arrive" HeaderText="Arrive" SortExpression="Arrive">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Kelas" HeaderText="Kelas" SortExpression="Kelas">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TravelAuthorizeNo" HeaderText="No. TA" SortExpression="TravelAuthorizeNo">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:TemplateField HeaderText="Nomor Tiket">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="150" Wrap="False" HorizontalAlign ="Left" ></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_nomortiket" CssClass ="form-control " runat="server" Width ="100"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="reqTiket" runat="server" ErrorMessage="*" ControlToValidate ="txt_nomortiket" ForeColor ="Red"  Font-Size ="15pt" ></asp:RequiredFieldValidator>
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
                                           <asp:SqlDataSource runat="server" ID="ds_detailissued" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="
                                               SELECT distinct Nama, Convert(Varchar(10),TglBerangkat,105) +' '+ JamBerangkat TglBerangkat, Departure, Arrive, Kelas, TravelAuthorizeNo, id FROM vw_TA_Tiket_onOrder WHERE (KodeBooking = @KODE) AND (statusBiding = 1) AND (KodeSupplier = @AGENT)"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="lbl_kodebooking" PropertyName="Text" Name="KODE"></asp:ControlParameter>
                                                 <asp:SessionParameter SessionField="Agent" Name="AGENT"></asp:SessionParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>

                                        
                                         </div> 
                                    </div>
                     </div>
                        <div class="col-sm-8" ></div> 
                        <div class="col-sm-2" >
                             <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="btn btn-google  " />
                            </div>
                          <div class="col-sm-1" >
                             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-facebook   " Visible ="false"  />
                            </div> 
                        </div> 
                    </div> 
                </div> 
             </div>  
        </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
