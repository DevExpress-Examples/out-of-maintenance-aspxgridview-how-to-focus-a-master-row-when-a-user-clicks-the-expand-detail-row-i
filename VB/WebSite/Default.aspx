<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function OnDetailRowExpanding(s, e) {
			grid.SetFocusedRowIndex(e.visibleIndex);
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsMain"
			ClientInstanceName="grid" KeyFieldName="CategoryID">
			<SettingsBehavior AllowFocusedRow="true" />
			<SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="true" />
			<ClientSideEvents DetailRowExpanding="OnDetailRowExpanding" />
			<Columns>
				<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
			</Columns>
			<Templates>
				<DetailRow>
					<dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail"
						KeyFieldName="ProductID" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect">
						<Columns>
							<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
								<EditFormSettings Visible="False" />
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
							</dx:GridViewDataTextColumn>
						</Columns>
					</dx:ASPxGridView>
				</DetailRow>
			</Templates>
		</dx:ASPxGridView>
		<asp:SqlDataSource ID="dsMain" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
		</asp:SqlDataSource>
		<asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
			<SelectParameters>
				<asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>
	</div>
	</form>
</body>
</html>