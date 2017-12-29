<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_SMSHotline.aspx.vb" Inherits="HRGA_OL.Frm_SMSHotline" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="form-horizontal">
        <div class="col-sm-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">SMS Hotline</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small">Keperluan</label>
                            <div class="col-sm-5">
                               <asp:TextBox ID="txt_keperluan" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small">Isi SMS</label>
                            <div class="col-sm-5">
                               <asp:TextBox ID="txt_isi" runat="server" CssClass="form-control" TextMode ="MultiLine" MaxLength ="150" Height ="80" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small">No. Tujuan</label>
                            <div class="col-sm-4">
                               <asp:TextBox ID="txt_notujuan" runat="server" CssClass="form-control" TextMode ="MultiLine"  Height="100"></asp:TextBox>
                            </div>
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small; font-style: italic; color: #FF0000;">*Gunakan "Enter" untuk memisah nomor tujuan lebih dari satu</label>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label" style="font-size: small">Modem</label>
                            <div class="col-sm-2">
                                <asp:DropDownList ID="ddl_modem" runat="server" CssClass ="form-control ">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        </div> 
                    </div> 
                      <div class="box-footer">
             <div class="col-sm-9"> </div> 
             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-facebook " />
             </div> 
                      
                </div> 
            </div> 

         <div class="col-sm-11">
                             <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto"> 
                                         <asp:GridView ID="gv_listsms" runat="server" AutoGenerateColumns="False" EmptyDataText="Tidak ada data" CssClass="table table-bordered table-hover" AllowPaging="True" DataSourceID="ds_listsms" >
                                             <AlternatingRowStyle BackColor="WhiteSmoke" />
                                             <Columns>
                                                 <asp:BoundField DataField="NoTujuan" HeaderText="No Tujuan" SortExpression="NoTujuan">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Keperluan" HeaderText="Keperluan" SortExpression="Keperluan">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Isi" HeaderText="Isi" SortExpression="Isi">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Modem" HeaderText="Modem" SortExpression="Modem">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Tanggal" HeaderText="Tanggal" SortExpression="Tanggal">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Inputby" HeaderText="Inputby" SortExpression="Inputby">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                             </Columns>

                                <Columns>
                                </Columns>

                                <HeaderStyle BackColor="SeaGreen"   ForeColor="White" />
                            </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_listsms" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NoTujuan, Isi, CASE WHEN Sent = 1 THEN 'TERKIRIM' ELSE 'PENDING' END AS STATUS, Modem, Tanggal, Keperluan, Inputby FROM DB_HCGS_HOTLINE.dbo.tbl_KirimSMS WHERE (Inputby IS NOT NULL) AND (CAST(Tanggal AS date) = CAST(GETDATE() AS date))" DeleteCommand="DELETE TBL_T_TRANSIT_PEGAWAI WHERE 1=0">
                            </asp:SqlDataSource>
                                         </div> </div>
                        </div>

         </div> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
