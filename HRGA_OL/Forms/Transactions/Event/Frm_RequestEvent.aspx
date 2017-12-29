<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_RequestEvent.aspx.vb" Inherits="HRGA_OL.Frm_RequestEvent" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal">
        <div class="col-sm-5">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title" style="font-style: italic">Request Event</h3>
                </div>
                 <asp:UpdatePanel runat ="server"  ><ContentTemplate >
                <div class="box-body">
                    <div class="form-horizontal">
                       
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Kategori</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_kategori" CssClass="form-control" runat="server" AutoPostBack ="true"  DataSourceID="ds_kategori" DataTextField="KATEGORI_TRAINING" DataValueField="PID_KATEGORI_TRAINING"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_kategori" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS KATEGORI_TRAINING, NULL AS PID_KATEGORI_TRAINING UNION SELECT KATEGORI_TRAINING, PID_KATEGORI_TRAINING FROM TBL_M_KATEGORI_TRAINING WHERE (AKTIF = 1)"></asp:SqlDataSource>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Divisi</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_divisi" CssClass="form-control" runat="server" AutoPostBack="true" DataSourceID="ds_divisi" DataTextField="DEPARTEMENT_TRAINING" DataValueField="DEPARTEMENT_TRAINING"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_divisi" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS DEPARTEMENT_TRAINING UNION SELECT DEPARTEMENT_TRAINING FROM TBL_M_DEPARTEMENT_TRAINING WHERE (AKTIF = 1)"></asp:SqlDataSource>
                             </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Judul</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddl_judul" CssClass="form-control" runat="server" AutoPostBack="true" DataSourceID="ds_judul" DataTextField="NAMA_TRAINING" DataValueField="PID_TRAINING"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_judul" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="
                                    SELECT NULL PID_TRAINING, NULL NAMA_TRAINING UNION
                                    SELECT PID_TRAINING, NAMA_TRAINING FROM TBL_M_TRAINING WHERE (AKTIF = 1) AND (PID_KATEGORI = @KATEGORI) AND DIVISI LIKE '%'+@DIVISI+'%'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_kategori" PropertyName="SelectedValue" Name="KATEGORI"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddl_divisi" PropertyName="SelectedValue" Name="DIVISI"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tanggal Mulai</label>
                            <div class="col-sm-8">
                                 <asp:TextBox ID="txt_tglmulai" runat="server" CssClass="form-control" AutoPostBack ="true"  ></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglmulai" ID="txt_tglmulai_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Tanggal Selesai</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txt_tglselesai" runat="server" CssClass="form-control" AutoPostBack ="true"  ></asp:TextBox>
                                <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_tglselesai" ID="txt_tglselesai_CalendarExtender" Format ="yyyy/MM/dd"></asp:CalendarExtender>
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
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Est. Peserta</label>
                             <div class="col-sm-8">
                                <asp:TextBox ID="txt_peserta" runat="server" CssClass="form-control" AutoPostBack ="true"  Text ="10" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Ruangan</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_ruangan" runat="server" CssClass="form-control" DataSourceID="ds_ruangan" DataTextField="LOKASI_TRAINING" DataValueField="PID_LOKASI_TRAINING"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_ruangan" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="
                                     SELECT NULL PID_LOKASI_TRAINING, NULL LOKASI_TRAINING UNION
                                     SELECT PID_LOKASI_TRAINING, LOKASI_TRAINING FROM dbo.cufn_get_lokasi_training(@MULAI, @SELESAI, @PESERTA) AS cufn_get_lokasi_training_1">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="txt_tglmulai" PropertyName="Text" Name="MULAI"></asp:ControlParameter>
                                         <asp:ControlParameter ControlID="txt_tglselesai" PropertyName="Text" Name="SELESAI"></asp:ControlParameter>
                                         <asp:ControlParameter ControlID="txt_peserta" PropertyName="Text" Name="PESERTA"></asp:ControlParameter>
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                             </div>
                        </div>
                           <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Dekor Tempat</label>
                             <div class="col-sm-8">
                                 <asp:DropDownList ID="ddl_dekor" runat="server" CssClass="form-control" DataSourceID="ds_dekor" DataTextField="DEKOR" DataValueField="DEKOR"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="ds_dekor" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL DEKOR, NULL PID_DEKOR
UNION
SELECT DEKOR, PID_DEKOR FROM TBL_M_DEKOR WHERE (AKTIF = 1)"></asp:SqlDataSource>
                             </div>
                        </div>
                       
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label" style="font-size: small">Deskripsi</label>
                            <div class="col-sm-8">
                               <asp:TextBox ID="txt_deskripsi" runat="server" CssClass="form-control" TextMode ="MultiLine"  ></asp:TextBox>
                            </div>
                           
                        </div>
                        </div> 
                </div>
                     </ContentTemplate></asp:UpdatePanel>
         <div class="box-footer">
             <div class="col-sm-9"> </div> 
             <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-facebook " />
             </div> 
         </div>
         </div>
        
                <div class="col-sm-7">        
     <div class="box box-primary">
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-1 control-label" style="font-size: small">Cari</label>
                             <div class="col-sm-5">
                                <asp:TextBox ID="txt_cari" runat="server" CssClass="form-control" Text ="*" AutoPostBack ="true" ></asp:TextBox>
                            </div>
                        </div>
                        </div> 
                        <div class="col-sm-12">
                             <div class="x_panel" runat ="server" > 
                                     <div style="overflow-x:auto"> 
                                         <asp:GridView ID="gv_listevent" runat="server" AutoGenerateColumns="False" EmptyDataText="Tidak ada data" CssClass="table table-bordered table-hover" AllowPaging="True" DataSourceID="ds_listpenghuni" DataKeyNames="PID_REQUEST_TRAINING" OnSelectedIndexChanging ="gv_listevent_SelectedIndexChanging" OnRowDeleting="gv_listevent_RowDeleting" >
                                             <AlternatingRowStyle BackColor="WhiteSmoke" />
                                             <Columns>
                                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Designs/Images/person.png"></asp:CommandField>
                                                
                                                 <asp:BoundField DataField="NAMA_TRAINING" HeaderText="EVENT" SortExpression="NAMA_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TANGGAL_MULAI" HeaderText="TGL MULAI" SortExpression="TANGGAL_MULAI">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="TANGGAL_SELESAI" HeaderText="TGL SELESAI" SortExpression="TANGGAL_SELESAI">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="LOKASI_TRAINING" HeaderText="RUANGAN" SortExpression="LOKASI_TRAINING">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" SortExpression="COMPANY">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="FIX_PESERTA" HeaderText="PESERTA" SortExpression="FIX_PESERTA">
                                                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:BoundField>
                                               
                                                 <asp:TemplateField HeaderText="KET. CANCEL">
                                                     <ItemTemplate >
                                                         <asp:TextBox ID="txt_cancel" runat="server" CssClass="form-control" Width ="100" ></asp:TextBox>
                                                     </ItemTemplate>
                                                      <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" Wrap="False" />
                                                     <ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                 </asp:TemplateField>
                                                 <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Designs/Images/delete.png" ></asp:CommandField>
                                             </Columns>

                                <Columns>
                                </Columns>

                                <HeaderStyle BackColor="#41709e" ForeColor="White" />
                            </asp:GridView>
                                         <asp:SqlDataSource runat="server" ID="ds_listpenghuni" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT PID_REQUEST_TRAINING, TANGGAL_MULAI, TANGGAL_SELESAI, NAMA_TRAINING, KATEGORI_TRAINING, LOKASI_TRAINING, COMPANY, ESTIMASI_PESERTA, FIX_PESERTA, STATUS, PID_REQUESTOR, VERIFIKASI, DEKOR, PIC FROM VW_CLS_REQUESTTRAINING_GENERAL WHERE (PIC = CASE WHEN @GPID = 'ADMINISTRATOR' THEN PIC ELSE @PIC END) AND (STATUS <> 'BERLANGSUNG') AND (NAMA_TRAINING LIKE '%' + @CARI + '%') OR (PIC = CASE WHEN @GPID = 'ADMINISTRATOR' THEN PIC WHEN @GPID = 'PIC TRAINING' THEN PIC WHEN @GPID = 'RECEPTIONIST' THEN PIC ELSE @PIC END) AND (STATUS <> CASE WHEN @GPID IN ('ADMINISTRATOR','PIC TRAINING','RECEPTIONIST') THEN 'XXXX' ELSE 'BERLANGSUNG' END) AND (@CARI = '*') ORDER BY CAST(TANGGAL_MULAI AS DATE)" DeleteCommand="DELETE TBL_T_TRANSIT_PEGAWAI WHERE 1=0">
                                             <SelectParameters>
                                                 <asp:SessionParameter SessionField="GPID" Name="GPID"></asp:SessionParameter>
                                                 <asp:SessionParameter SessionField="Nrp" Name="PIC"></asp:SessionParameter>

                                                 <asp:ControlParameter ControlID="txt_cari" PropertyName="Text" Name="CARI"></asp:ControlParameter>
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
