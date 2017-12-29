<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_Housekeeping.aspx.vb" Inherits="HRGA_OL.Frm_Housekeeping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="form-horizontal">
             <div class="col-sm-12">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Housekeeping Kamar</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Lokasi</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="ddl_lokasi" runat="server" CssClass="form-control" DataSourceID="ds_lokasi" DataTextField="KETERANGAN" DataValueField="KETERANGAN" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="ds_lokasi" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="
                                        SELECT NULL KETERANGAN UNION
                                        SELECT DISTINCT KETERANGAN FROM View_Mess"></asp:SqlDataSource>
                                </div>
                               
                             <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Gedung</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="ddl_gedung" runat="server" CssClass="form-control" DataSourceID="ds_gedung" DataTextField="NAMA_GEDUNG" DataValueField="PID_GEDUNG" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="ds_gedung" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="
                                        SELECT NULL NAMA_GEDUNG, NULL PID_GEDUNG UNION
                                        SELECT NAMA_GEDUNG, PID_GEDUNG FROM View_Mess WHERE (KETERANGAN = @BLOK)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_lokasi" PropertyName="SelectedValue" Name="BLOK"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                            </div>
                                 
                       <div class="col-sm-11">
                             <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto"> 
                                         <asp:GridView ID="gv_listkamar" runat="server" AutoGenerateColumns="False" EmptyDataText="Tidak ada data" CssClass="table table-bordered table-hover" AllowPaging="True" DataSourceID="ds_listkamar" DataKeyNames="PID_TRANSIT_PEGAWAI" OnSelectedIndexChanging ="gv_listkamar_SelectedIndexChanging" >
                                             <AlternatingRowStyle BackColor="WhiteSmoke" />
                                             <Columns>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA" HeaderText="NAMA" SortExpression="NAMA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="KETERANGAN" HeaderText="KETERANGAN" SortExpression="KETERANGAN">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_KAMAR" HeaderText="KAMAR" SortExpression="NAMA_KAMAR">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA_BED" HeaderText="BED" SortExpression="NAMA_BED">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                  <asp:BoundField DataField="CHECKIN" HeaderText="CHECKIN" SortExpression="CHECKIN">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                  <asp:BoundField DataField="CHECKOUT" HeaderText="CHECKOUT" SortExpression="CHECKOUT">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl ="~/Designs/Images/clean.png" ></asp:CommandField>
                                             </Columns>

                                <Columns>
                                </Columns>

                                <HeaderStyle BackColor="SeaGreen"   ForeColor="White" />
                            </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_listkamar" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT TBL_T_TRANSIT_PEGAWAI.PID_TRANSIT_PEGAWAI, TBL_T_TRANSIT_PEGAWAI.NRP, TBL_T_TRANSIT_PEGAWAI.NAMA, TBL_T_TRANSIT_PEGAWAI.KETERANGAN, View_Mess.NAMA_KAMAR, View_Mess.NAMA_BED, CASE WHEN START_CLEAN IS NULL THEN 'UNCLEAN' ELSE 'CLEANING' END AS STATUS, CONVERT (VARCHAR(10), TBL_T_TRANSIT_PEGAWAI.TGL_CHECKIN, 105) + ' ' + CONVERT (VARCHAR(5), TBL_T_TRANSIT_PEGAWAI.TGL_CHECKIN, 108) AS CHECKIN, CONVERT (VARCHAR(10), TBL_T_TRANSIT_PEGAWAI.TGL_CHECKOUT, 105) + ' ' + CONVERT (VARCHAR(5), TBL_T_TRANSIT_PEGAWAI.TGL_CHECKOUT, 108) AS CHECKOUT FROM TBL_T_TRANSIT_PEGAWAI INNER JOIN View_Mess ON TBL_T_TRANSIT_PEGAWAI.PID_DETAIL_MESS_BED = View_Mess.PID_DETAIL_MESS_BED WHERE (TBL_T_TRANSIT_PEGAWAI.STATUS_KAMAR = 'UNCLEAN') AND (View_Mess.PID_GEDUNG = @GEDUNG)
                                             ORDER BY CASE WHEN START_CLEAN IS NULL THEN 'UNCLEAN' ELSE 'CLEANING' END DESC" DeleteCommand="DELETE TBL_T_TRANSIT_PEGAWAI WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="ddl_gedung" PropertyName="SelectedValue" Name="GEDUNG"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                                         </div> </div>
                        </div>


                        </div> 
                    </div> 
                </div> 
                 </div> 
            </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
</asp:Content>
