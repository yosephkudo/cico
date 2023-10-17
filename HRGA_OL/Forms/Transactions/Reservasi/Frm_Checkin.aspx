<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_Checkin.aspx.vb" Inherits="HRGA_OL.Frm_Reservasi" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-5">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Reservasi Mess</h3>
                </div>
                
                <div class="box-body">
                    <div class="form-horizontal">
                       
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NRP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nrp" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="txt_nrp_AutoCompleteExtender" runat="server" CompletionSetCount="7" DelimiterCharacters="" Enabled="True" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchNRP"  TargetControlID="txt_nrp">
                    </asp:AutoCompleteExtender>
                            </div>
                        </div>
                         <asp:UpdatePanel runat ="server"  ><ContentTemplate >
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Nama</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nama" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">No. HP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nohp" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Company</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_company" runat="server" CssClass="form-control" DataSourceID="ds_company" DataTextField="COMPANY" DataValueField="COMPANY"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_company" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL COMPANY UNION SELECT  COMPANY FROM TBL_M_COMPANY WHERE (AKTIF = 1)"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Distrik</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_distrik" runat="server" CssClass="form-control" DataSourceID="ds_distrik" DataTextField="DISTRIK" DataValueField="DISTRIK"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_distrik" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL DISTRIK UNION SELECT [DISTRIK] FROM [VW_DISTRIK]"></asp:SqlDataSource>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Jabatan</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_jabatan" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Status Keluarga</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_keluarga" runat="server" CssClass="form-control">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>KARYAWAN</asp:ListItem>
                                    <asp:ListItem>ISTRI</asp:ListItem>
                                    <asp:ListItem>ANAK</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Keperluan</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_keperluan" runat="server" CssClass="form-control" DataSourceID="ds_keperluan" DataTextField="KEPERLUAN" DataValueField="KEPERLUAN"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_keperluan" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL KEPERLUAN UNION SELECT [KEPERLUAN] FROM [TBL_R_KEPERLUAN]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Check IN</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txt_tglcheckin" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglcheckin" ID="txt_checkin_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txt_jamcheckin" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:MaskedEditExtender runat="server" CultureDatePlaceholder="" CultureTimePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureDateFormat="" CultureCurrencySymbolPlaceholder="" CultureAMPMPlaceholder="" Century="2000" Enabled="True" TargetControlID="txt_jamcheckin" ID="txt_jamcheckin_MaskedEditExtender" Mask="99:99" ClearMaskOnLostFocus ="false" ></asp:MaskedEditExtender>
                            </div> 
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Check OUT</label>
                             <div class="col-sm-8">
                                <asp:TextBox ID="txt_checkout" runat="server" CssClass="form-control"></asp:TextBox>
                                 <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_checkout" ID="txt_checkout_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                             </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Lokasi</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_lokasi" runat="server" CssClass="form-control" DataSourceID="ds_lokasi" DataTextField="KETERANGAN" DataValueField="PID_KOMPLEK_MESS" AutoPostBack="True"  ></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_lokasi" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL PID_KOMPLEK_MESS, NULL KETERANGAN UNION SELECT DISTINCT PID_KOMPLEK_MESS, KETERANGAN FROM View_Mess"></asp:SqlDataSource>
                             </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Gedung</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_gedung" runat="server" CssClass="form-control" DataSourceID="ds_gedung" DataTextField="NAMA_GEDUNG" DataValueField="PID_GEDUNG" AutoPostBack="True" ></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_gedung" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS NAMA_GEDUNG, NULL AS PID_GEDUNG UNION SELECT DISTINCT NAMA_GEDUNG, PID_GEDUNG FROM View_Mess WHERE (PID_KOMPLEK_MESS = @KOMPLEK) ">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="ddl_lokasi" PropertyName="SelectedValue" Name="KOMPLEK"></asp:ControlParameter>
                                         <asp:SessionParameter SessionField="GPID" Name="GPID"></asp:SessionParameter>
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                             </div>
                        </div>
                           <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Kamar</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_kamar" runat="server" CssClass="form-control" AutoPostBack="True" ></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_kamar" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS PID_DETAIL_MESS, NULL AS NAMA_KAMAR UNION SELECT PID_DETAIL_MESS, NAMA_KAMAR FROM dbo.CUFN_GET_KAMAR_READY(@NRP, @AWAL, @AKHIR,@GEDUNG) AS CUFN_GET_KAMAR_READY_1 ">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="txt_nrp" PropertyName="Text" Name="NRP"></asp:ControlParameter>
                                         <asp:ControlParameter ControlID="txt_tglcheckin" PropertyName="Text" Name="AWAL"></asp:ControlParameter>
                                         <asp:ControlParameter ControlID="txt_checkout" PropertyName="Text" Name="AKHIR"></asp:ControlParameter>

                                         <asp:ControlParameter ControlID="ddl_gedung" PropertyName="SelectedValue" Name="GEDUNG"></asp:ControlParameter>
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                             </div>
                        </div>
    
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Kedatangan</label>
                             <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_kedatangan" runat="server" CssClass="form-control" DataSourceID="ds_distrik" DataTextField="DISTRIK" DataValueField="DISTRIK"></asp:DropDownList>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tujuan</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_tujuan" runat="server" CssClass="form-control" DataSourceID="ds_distrik" DataTextField="DISTRIK" DataValueField="DISTRIK"></asp:DropDownList>
                            </div>
                        </div>
                         </ContentTemplate></asp:UpdatePanel>
                        </div> 
                </div>
                    
     
         </div>
         </div>
        
                <div class="col-sm-7">        
     <div class="box box-primary">
         <div class="box-header with-border">
                    <h3 class="box-title" style="font-style:italic">List Request Transit</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Distrik</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="ddl_caridistrik" runat="server" CssClass="form-control" DataSourceID="ds_sitereq" DataTextField="DISTRIK" DataValueField="DISTRIK" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="ds_sitereq" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS Distrik UNION SELECT DISTINCT Site AS Distrik FROM TBL_T_TRAVEL_REQUEST_KARYAWAN WHERE (CAST(MessCI AS date) >= CAST(GETDATE()-2 AS date))"></asp:SqlDataSource>
                                </div>
                                <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                             <div class="col-sm-5">
                                <asp:TextBox ID="txt_cari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                            </div>
                                 
                        </div>
                        </div> 
                        <div class="col-sm-12">
                             <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto"> 
                                         <asp:GridView ID="gv_listreq" runat="server" AutoGenerateColumns="False" EmptyDataText="Tidak ada data" CssClass="table table-bordered table-hover" AllowPaging="True" DataSourceID="ds_listreq" DataKeyNames="NRP" OnSelectedIndexChanging="gv_listreq_SelectedIndexChanging" OnRowDeleting ="gv_listreq_RowDeleting" >
                                             <AlternatingRowStyle BackColor="WhiteSmoke" />
                                             <Columns>
                                                 <asp:CommandField SelectImageUrl="~/Designs/Images/add.png" ShowSelectButton="True" ButtonType="Image"></asp:CommandField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Jabatan" HeaderText="Jabatan" SortExpression="Jabatan">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KEPERLUAN" HeaderText="Keperluan" SortExpression="KEPERLUAN">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="CHECKIN" HeaderText="Tgl Checkin" ReadOnly="True" SortExpression="CHECKIN">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NO_TR" HeaderText="Nomor" SortExpression="NO_TR">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_KAMAR" HeaderText="Kamar Booking" SortExpression="NAMA_KAMAR">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:TemplateField HeaderText="Remark Cancel" HeaderStyle-Wrap ="false" >
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_remark" runat="server" CssClass="form-control"></asp:TextBox>
                                                     </ItemTemplate>
                                                 </asp:TemplateField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
                                             </Columns>

                                <Columns>
                                </Columns>

                                <HeaderStyle BackColor="#41709e" ForeColor="White" />
                            </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_listreq" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NO_TR, NRP, Nama, NO_HP, CASE WHEN STATUSKELUARGA = 'KARYAWAN' THEN Jabatan ELSE STATUSKELUARGA END + ' (' + COMPANY + ')' AS JABATAN, Site, COMPANY, KEPERLUAN, CONVERT (VARCHAR(10), [IN], 105) AS CHECKIN, CONVERT (VARCHAR(10), OUT, 105) AS CHECKOUT, NAMA_KAMAR FROM VW_KARYAWAN_BELUM_CHECKIN WHERE (Site = CASE WHEN @SITE = NULL THEN [SITE] ELSE @SITE END) AND (NRP LIKE '%' + @CARI + '%') AND ([IN] < CAST(GETDATE() + 2 AS DATE)) AND ([IN] > CAST(GETDATE() - 2 AS DATE)) OR (Site = CASE WHEN @SITE = NULL THEN [SITE] ELSE @SITE END) AND ([IN] < CAST(GETDATE() + 2 AS DATE)) AND (Nama LIKE '%' + @CARI + '%') AND ([IN] > CAST(GETDATE() - 2 AS DATE)) OR (Site = CASE WHEN @SITE = NULL THEN [SITE] ELSE @SITE END) AND ([IN] < CAST(GETDATE() + 2 AS DATE)) AND (@CARI LIKE '%' + @CARI + '%') AND ([IN] > CAST(GETDATE() - 2 AS DATE)) ORDER BY NAMA_KAMAR, [IN]" DeleteCommand="DELETE TBL_T_TRANSIT_PEGAWAI WHERE 1=0">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_caridistrik" PropertyName="SelectedValue" Name="SITE"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txt_cari" PropertyName="Text" Name="CARI"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                                         </div> </div>
                        </div>
                        </div> 
                </div>

         </div>
                        <div class="box-footer">
             <div class="col-sm-2"> </div>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btn_clear" runat="server" Text="Clear" class="btn btn-instagram"   /> 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btn_booking" runat="server" Text="Booking" class="btn btn-facebook" Visible ="false"  />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btn_checkin" runat="server" Text="Check IN" class="btn btn-twitter " />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:Button ID="btn_update" runat="server" Text="Update" class="btn btn-google" />
             </div> 
         </div> 
        <div class="col-sm-12">
                                        <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <%-- <asp:GridView ID="gv_tiket" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_tiket" AllowPaging="True" EmptyDataText="No Data Tiket" PagerStyle-CssClass="gridView">
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                                             <Columns>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NomorST" HeaderText="Nomor ST" SortExpression="NomorST">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Nama" HeaderText="Nama" SortExpression="Nama">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="ForTiket" HeaderText="Status" SortExpression="ForTiket">
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
                                                 <asp:BoundField DataField="Tanggal" HeaderText="Tanggal" SortExpression="Tanggal" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Maskapai" HeaderText="Maskapai" SortExpression="Maskapai">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KodeBooking" HeaderText="Kode Booking" SortExpression="KodeBooking">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                                             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                             <HeaderStyle HorizontalAlign="Center" BackColor="#0066ff"  Font-Bold="True" ForeColor="White"></HeaderStyle>

                                             <PagerStyle HorizontalAlign="Center" BackColor="Maroon" ForeColor="White"></PagerStyle>

                                             <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                             <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                             <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                             <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                             <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                         </asp:GridView> --%>
                                         <%-- <asp:SqlDataSource runat="server" ID="ds_tiket" ConnectionString='<%$ ConnectionStrings:DB_HRGAConn %>' SelectCommand="SELECT NRP, KodeBooking, NomorST, Nama, ForTiket, Dari, Tujuan, CONVERT (varchar(10), Tanggal, 105) + ' ' + JamBerangkat AS Tanggal, Maskapai FROM VW_ETicket WHERE (KodeBooking IN (SELECT DISTINCT KodeBooking FROM VW_ETicket AS VW_ETicket_1 WHERE (Tanggal >= CAST(GETDATE() AS DATE)) AND (NRP = @NRP))) AND (Tanggal >= CAST(GETDATE() AS DATE)) ORDER BY Tanggal">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="txt_nrp" PropertyName="Text" Name="NRP"></asp:ControlParameter>
                                             </SelectParameters>
                                         </asp:SqlDataSource> --%>
                                     </div> 
                                    </div>
        </div> 
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
