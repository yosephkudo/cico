<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_PesertaEvent.aspx.vb" Inherits="HRGA_OL.Frm_PesertaEvent" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="form-horizontal">
              <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Detail Training</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                         <div class="col-sm-8"> 
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">ID</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_idtraining" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Training</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_training" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Tanggal</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_tanggal" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        <div class="form-group "> 
                     <label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Diajukan Oleh</label>
                     <div class="col-sm-4 control-label">
                                        <asp:Label ID="lbl_diajukan" runat="server" Font-Bold ="true"  Text="#"></asp:Label>
                     </div>
                     </div>
                        </div>
                        </div> 
                    </div>
                   
                  </div>


            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Peserta</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                                                 <div class="col-sm-8">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_peserta" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_peserta" AllowPaging="True" EmptyDataText="Tidak ada data peserta" PagerStyle-CssClass="gridView" DataKeyNames="PID_PESERTA_TRAINING" OnRowDeleting ="gv_peserta_RowDeleting" >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                             <Columns>
                                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:BoundField DataField="NRP" HeaderText="NRP" SortExpression="NRP">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="NAMA" HeaderText="NAMA" SortExpression="NAMA">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" SortExpression="COMPANY">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="DISTRIK" HeaderText="DISTRIK" SortExpression="DISTRIK">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="DEPARTEMENT" HeaderText="DEPARTEMENT" SortExpression="DEPARTEMENT">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="JABATAN" HeaderText="JABATAN" SortExpression="JABATAN">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="SeaGreen" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="SeaGreen" ForeColor="White"></PagerStyle>

                            <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                                         </div> 
                                    </div>
                     
                                                     <asp:SqlDataSource runat="server" ID="ds_peserta" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT PID_PESERTA_TRAINING, NRP, NAMA, COMPANY, DISTRIK, DEPARTEMENT, JABATAN FROM TBL_T_PESERTA_TRAINING WHERE (ISCANCEL IS NULL) AND (CAST(PID_REQUEST_TRAINING AS VARCHAR(5)) = @TRAINING)" DeleteCommand ="DELETE TBL_T_PESERTA_TRAINING WHERE 1=0">
                                                         <SelectParameters>
                                                             <asp:ControlParameter ControlID="lbl_idtraining" PropertyName="Text" Name="TRAINING"></asp:ControlParameter>


                                                         </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-sm-4">

                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">NRP</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nrp" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="txt_nrp_AutoCompleteExtender" runat="server" CompletionSetCount="7" DelimiterCharacters="" Enabled="True" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchNRP"  TargetControlID="txt_nrp">
                    </asp:AutoCompleteExtender>
                            </div>
                        </div>
                       
                         
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Nama</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_nama" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>
                       
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Dept</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_dept" runat="server" CssClass="form-control"></asp:TextBox>
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
                                <asp:TextBox ID="txt_jabatan" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>

                               <div class="box-footer">
             <div class="col-sm-9"> </div> 

             <asp:Button ID="btn_addpeserta" runat="server" Text="Submit" class="btn btn-success " />
             </div> 

                        </div>

                        </div>
                        </div> 
                    </div> 
            </div>

             <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Kebutuhan</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                                                 <div class="col-sm-8">
                            <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto">
                                         <asp:GridView ID="gv_kebutuhan" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ds_kebutuhan" AllowPaging="True" EmptyDataText="Tidak ada data akomodasi" PagerStyle-CssClass="gridView" DataKeyNames ="PID_AKOMODASI_TAMBAHAN" OnRowDeleting ="gv_kebutuhan_RowDeleting" >
                                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                             <Columns>
                                                 <asp:BoundField DataField="AKOMODASI_TRAINING" HeaderText="AKOMODASI_TRAINING" SortExpression="AKOMODASI_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TGL_AWAL" HeaderText="TGL_AWAL" SortExpression="TGL_AWAL" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>

                                                 <asp:BoundField DataField="TGL_AKHIR" HeaderText="TGL_AKHIR" SortExpression="TGL_AKHIR" ReadOnly="True">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="JUMLAH" HeaderText="JUMLAH" SortExpression="JUMLAH">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                      <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign ="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:CommandField DeleteImageUrl="~/Designs/Images/delete.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
                                             </Columns>

                                             <EditRowStyle BackColor="#999999"></EditRowStyle>

                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle HorizontalAlign="Center" BackColor="SeaGreen" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="SeaGreen" ForeColor="White"></PagerStyle>

                            <RowStyle HorizontalAlign="Center" Font-Size="Small" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                                         </div> 
                                    </div>
                     
                                                     <asp:SqlDataSource runat="server" ID="ds_kebutuhan" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT PID_AKOMODASI_TAMBAHAN, PID_REQUEST_TRAINING, AKOMODASI_TRAINING, TGL_AWAL, TGL_AKHIR, JUMLAH FROM VW_CLS_AKOMODASI_TAMBAHAN WHERE (PID_REQUEST_TRAINING = @EVENT)" DeleteCommand ="DELETE TBL_M_COMPANY WHERE 1=0">
                                                         <SelectParameters>
                                                             <asp:SessionParameter SessionField="ID_EVENT" Name="EVENT"></asp:SessionParameter>

                                                         </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-sm-4">
                             <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Item</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_item" runat="server" CssClass="form-control" DataSourceID="ds_item" DataTextField="AKOMODASI_TRAINING" DataValueField="PID_AKOMODASI_TRAINING"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_item" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="
                                    SELECT NULL [PID_AKOMODASI_TRAINING], NULL [AKOMODASI_TRAINING] UNION
                                    SELECT [PID_AKOMODASI_TRAINING], [AKOMODASI_TRAINING] FROM [TBL_M_AKOMODASI_TRAINING] WHERE ([AKTIF] = @AKTIF)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="AKTIF" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tgl Awal</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_awal" runat="server" CssClass="form-control" ></asp:TextBox>
                                 <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_awal" ID="txt_awal_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                        </div>
                             <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tgl Akhir</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_akhir" runat="server" CssClass="form-control" ></asp:TextBox>
                                   <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_akhir" ID="txt_akhir_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                        </div>
                             <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Jumlah</label>
                            <div class="col-sm-8">
                               <asp:TextBox ID="txt_jumlah" runat="server" CssClass="form-control" Text ="0" ></asp:TextBox>
                            </div>
                        </div>
                             <div class="box-footer">
             <div class="col-sm-9"> </div> 

             <asp:Button ID="btn_addkebutuhan" runat="server" Text="Submit" class="btn btn-success " />
             </div> 
                        </div>

                        </div>
                        </div> 
                    </div> 
                </div> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
