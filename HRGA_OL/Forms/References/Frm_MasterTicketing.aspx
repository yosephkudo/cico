<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_MasterTicketing.aspx.vb" Inherits="HRGA_OL.Frm_MasterTicketing" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="box box-info">
            <div class="box-header with-border">
                <h4 class="box-title" style="font-style: italic">Master Rute Penerbangan</h4>
            </div>
            <div class="box-body">
                <div class="form-horizontal">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Dari</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_dari" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tujuan</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_tujuan" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_maskapai" runat="server" CssClass="form-control" DataSourceID="DS_PENERBANGAN" DataTextField="FlightName" DataValueField="AirlineCode"></asp:DropDownList>

                                <asp:SqlDataSource runat="server" ID="DS_PENERBANGAN" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT [FlightName], [AirlineCode] FROM [tblTravelAuthorization_Flight]"></asp:SqlDataSource>
                            </div>
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small; text-align: left">Flight</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_flight" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Jam Berangkat</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_jamberangkat" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamberangkat" ID="txt_jamberangkat_MaskedEditExtender" Mask ="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>

                            </div>
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Jam Tiba</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_jamtiba" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamtiba" ID="MaskedEditExtender1" Mask ="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div> 
                        <div class="form-group">
                      <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Jadwal Hari</label>
                            <div class="col-sm-7">
                            <asp:CheckBoxList ID="cb_hari" runat="server" RepeatColumns="4" Width ="100%"  RepeatDirection="Horizontal" CellPadding ="5" CellSpacing ="5">
                                <asp:ListItem Selected="True" Value="Monday">Senin</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Tuesday">Selasa</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Wednesday">Rabu</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Thursday">Kamis</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Friday">Jumat</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Saturday">Sabtu</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Sunday">Minggu</asp:ListItem>
                            </asp:CheckBoxList>
                                </div> 
                            </div> 
                        <div class="col-sm-10" >
                            <asp:Label ID="lbl_id" runat="server" Text="" Visible ="false" ></asp:Label>
                        </div> 
                        <div class="col-sm-2" >
                             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-twitter " />
                            </div>
                        </div> 
                    <div class ="col-sm-6">
                        <div class ="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small">Maskapai</label>
                            <div class="col-sm-9"> 
                                <asp:DropDownList ID="ddl_pesawat" CssClass ="form-control " runat="server" DataSourceID="DS_MASKAPAI" DataTextField="FlightName" DataValueField="AirlineCode" AutoPostBack ="true" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="DS_MASKAPAI" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT 'ALL' AS FlightName, '*' AS AirlineCode UNION SELECT FlightName, AirlineCode FROM tblTravelAuthorization_Flight"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                        <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Dari</label>
                            <div class="col-sm-5"> 
                                     <asp:TextBox ID="txt_caridari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Tujuan</label>
                            <div class="col-sm-5"> 
                                     <asp:TextBox ID="txt_caritujuan" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                                    </div>
                            

                        </div> 
                                             <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_penerbangan" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="idPenerbangan" DataSourceID="ds_rutepenerbangan" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView" OnRowDeleting ="gv_penerbangan_RowDeleting" OnSelectedIndexChanging ="gv_penerbangan_SelectedIndexChanging" >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="Dari" HeaderText="Dari" ReadOnly="True" SortExpression="Dari">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="Tujuan" HeaderText="Tujuan" SortExpression="Tujuan" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Maskapai" HeaderText="Maskapai" SortExpression="Maskapai" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Flight" HeaderText="Flight" SortExpression="Flight">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="Berangkat" HeaderText="Berangkat" SortExpression="Berangkat">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tiba" HeaderText="Tiba" SortExpression="Tiba">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                                 <asp:CommandField SelectText="Edit" ShowSelectButton="True"></asp:CommandField>
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
                                         <asp:SqlDataSource runat="server" ID="ds_rutepenerbangan" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT idPenerbangan, UPPER(Dari) AS Dari, UPPER(Tujuan) AS Tujuan, UPPER(Maskapai) AS Maskapai, Berangkat, Tiba, UPPER(Flight) AS Flight FROM tblPenerbangan WHERE (Dari LIKE '%' + @DARI + '%') AND (Tujuan LIKE '%' + @TUJUAN + '%') AND (MaskapaiCode = @MASKAPAI) OR (Dari LIKE '%' + @DARI + '%') AND (@TUJUAN = '*') AND (MaskapaiCode = @MASKAPAI) OR (Tujuan LIKE '%' + @TUJUAN + '%') AND (@DARI = '*') AND (MaskapaiCode = @MASKAPAI) OR (Dari LIKE '%' + @DARI + '%') AND (@TUJUAN = '') AND (MaskapaiCode = @MASKAPAI) OR (Tujuan LIKE '%' + @TUJUAN + '%') AND (@DARI = '') AND (MaskapaiCode = @MASKAPAI) OR (@TUJUAN = '*') AND (@DARI = '*') AND (MaskapaiCode = @MASKAPAI) OR (@TUJUAN = '') AND (@DARI = '') AND (MaskapaiCode = @MASKAPAI) OR (Dari LIKE '%' + @DARI + '%') AND (Tujuan LIKE '%' + @TUJUAN + '%') AND (@MASKAPAI = '*') OR (Dari LIKE '%' + @DARI + '%') AND (@TUJUAN = '*') AND (@MASKAPAI = '*') OR (Tujuan LIKE '%' + @TUJUAN + '%') AND (@DARI = '*') AND (@MASKAPAI = '*') OR (Dari LIKE '%' + @DARI + '%') AND (@TUJUAN = '') AND (@MASKAPAI = '*') OR (Tujuan LIKE '%' + @TUJUAN + '%') AND (@DARI = '') AND (@MASKAPAI = '*') OR (@TUJUAN = '*') AND (@DARI = '*') AND (@MASKAPAI = '*') OR (@TUJUAN = '') AND (@DARI = '') AND (@MASKAPAI = '*')"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="txt_caridari" PropertyName="Text" Name="DARI"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="txt_caritujuan" PropertyName="Text" Name="TUJUAN"></asp:ControlParameter>
                                                 <asp:ControlParameter ControlID="ddl_pesawat" PropertyName="SelectedValue" Name="MASKAPAI"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                      
                     </div>
                    </div>
                    </div> 
                    </div> 
                </div> 

          <div class="box box-warning">
            <div class="box-header with-border">
                <h4 class="box-title" style="font-style: italic">Master Kelas Maskapai</h4>
            </div>
            <div class="box-body">
                <div class="form-horizontal">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Maskapai</label>
                            <div class="col-sm-8">
                                    <asp:DropDownList ID="ddl_airline" runat="server" CssClass="form-control" DataSourceID="DS_PENERBANGAN" DataTextField="FlightName" DataValueField="AirlineCode"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kelas</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_kelas" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kelas Desc</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_kelasdesc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-10" ></div> 
                        <div class="col-sm-2" >
                             <asp:Button ID="btn_submitkelas" runat="server" Text="Submit" class="btn btn-warning " />
                            </div>
                    </div>
                          <div class ="col-sm-6">
                        <div class="form-group">
                        <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                            <div class="col-sm-5"> 
                                     <asp:TextBox ID="txt_carikelas" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                                    </div></div> 
                                             <div class ="col-sm-12">
                         <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_kelas" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_kelas" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView">
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="FlightName" HeaderText="Maskapai" SortExpression="FlightName">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="Kelas" HeaderText="Kelas" SortExpression="Kelas">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Desc" HeaderText="Kelas Desc" SortExpression="Desc">
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                             <HeaderStyle HorizontalAlign="Center" BackColor="#FF9900" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                             <PagerStyle HorizontalAlign="Center" BackColor="#FF9900" ForeColor="White"></PagerStyle>

                                             <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                             <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                             <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                             <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                             <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                         </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_kelas" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT tblTravelAuthorization_Flight.FlightName, tblTravelAuthorization_Flight_Class.Kelas, tblTravelAuthorization_Flight_Class.[Desc] FROM tblTravelAuthorization_Flight_Class INNER JOIN tblTravelAuthorization_Flight ON tblTravelAuthorization_Flight_Class.AirlineCode = tblTravelAuthorization_Flight.AirlineCode WHERE (@CARI = '*') OR (@CARI = '') OR (tblTravelAuthorization_Flight.FlightName LIKE '%' + @CARI + '%') OR (tblTravelAuthorization_Flight_Class.Kelas LIKE '%' + @CARI + '%') OR (tblTravelAuthorization_Flight_Class.[Desc] LIKE '%' + @CARI + '%')"
                                             DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="txt_carikelas" PropertyName="Text" Name="CARI"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </div> 
                                    </div>
                      
                     </div>
                    </div>
                    </div> 
                </div> 
              </div> 
        </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
