<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Forms/SiteMaster/HrgaOl.Master" CodeBehind="Frm_MasterMess.aspx.vb" Inherits="HRGA_OL.Frm_MasterMess" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<div class="form-horizontal">
		<div class="box box-info">
			<div class="box-header with-border">
				<h4 class="box-title" style="font-style: italic">Master Kamar</h4>
			</div>
			<div class="box-body">
				<div class="form-horizontal">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Komplek</label>
							<div class="col-sm-8">
								<asp:DropDownList ID="ddl_komplek" runat="server" CssClass="form-control" DataSourceID="ds_group" DataTextField="KETERANGAN" DataValueField="PID_KOMPLEK_MESS" AutoPostBack="true"></asp:DropDownList>
								<asp:SqlDataSource runat="server" ID="ds_group" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT NULL AS KETERANGAN, NULL PID_KOMPLEK_MESS UNION SELECT DISTINCT KETERANGAN , PID_KOMPLEK_MESS FROM TBL_R_GROUP_MESS WHERE PID_KOMPLEK_MESS IN (1,2)"></asp:SqlDataSource>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Gedung</label>
							<div class="col-sm-8">
								<asp:DropDownList ID="ddl_gedung" runat="server" CssClass="form-control" DataSourceID="ds_gedung" DataTextField="NAMA_GEDUNG" DataValueField="PID_GEDUNG" AutoPostBack="true"></asp:DropDownList>
								<asp:SqlDataSource runat="server" ID="ds_gedung" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT DISTINCT NULL AS NAMA_GEDUNG, NULL AS PID_GEDUNG UNION SELECT NAMA_GEDUNG, PID_GEDUNG FROM TBL_M_GEDUNG WHERE (PID_KOMPLEK_MESS = @KOMPLEK)">
									<SelectParameters>
										<asp:ControlParameter ControlID="ddl_komplek" PropertyName="SelectedValue" Name="KOMPLEK"></asp:ControlParameter>
									</SelectParameters>
								</asp:SqlDataSource>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kamar</label>

							<div class="col-sm-4">
								<asp:TextBox ID="txt_kamar" runat="server" CssClass="form-control"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: small; text-align: left">Kapasitas</label>

							<div class="col-sm-3">
								<asp:TextBox ID="txt_kapasitas" runat="server" CssClass="form-control"></asp:TextBox>
							</div>
						</div>
						<div class="col-sm-10"></div>
						<div class="col-sm-2">
							<asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-twitter " />
						</div>
					</div>

					<div class="col-sm-6">
						<div class="col-sm-12">
							<div class="x_panel" runat="server">
								<div style="overflow-x:auto">
									<asp:GridView ID="gv_kamar" runat="server" CssClass="table table-striped jambo_table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="PID_DETAIL_MESS" DataSourceID="ds_kamar" AllowPaging="True" EmptyDataText="No Data" PagerStyle-CssClass="gridView">
										<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

										<Columns>
											<asp:BoundField DataField="NAMA_KAMAR" HeaderText="KAMAR" SortExpression="NAMA_KAMAR">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
												<ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
											</asp:BoundField>
											<asp:BoundField DataField="NAMA_GEDUNG" HeaderText="GEDUNG" SortExpression="NAMA_GEDUNG">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
												<ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
											</asp:BoundField>
											<asp:BoundField DataField="KETERANGAN" HeaderText="KOMPLEK" SortExpression="KETERANGAN">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
												<ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
											</asp:BoundField>
											<asp:BoundField DataField="KAPASITAS" HeaderText="KAPASITAS" SortExpression="KAPASITAS">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="9pt" />
												<ItemStyle Font-Size="9pt" Width="100" Wrap="False" HorizontalAlign="Left"></ItemStyle>
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
									<asp:SqlDataSource runat="server" ID="ds_kamar" ConnectionString='<%$ ConnectionStrings:DB_GSISConn %>' SelectCommand="SELECT DISTINCT NAMA_KAMAR, PID_DETAIL_MESS, KETERANGAN, NAMA_GEDUNG, COUNT(PID_DETAIL_MESS_BED) AS KAPASITAS FROM View_Mess WHERE (PID_GEDUNG = @GEDUNG) OR (@GEDUNG = 0) OR (@GEDUNG IS NULL) OR (@GEDUNG='') GROUP BY NAMA_KAMAR, PID_DETAIL_MESS, KETERANGAN, NAMA_GEDUNG ORDER BY NAMA_KAMAR" DeleteCommand="Delete TBL_TEMP_BOOKING WHERE 1=0">
										<SelectParameters>
											<asp:ControlParameter ControlID="ddl_gedung" PropertyName="SelectedValue" Name="GEDUNG"></asp:ControlParameter>
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