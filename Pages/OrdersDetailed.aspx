<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="OrdersDetailed.aspx.cs" Inherits="Pages.Pages_OrdersDetailed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="12" DataSourceID="sds_DetailedOrder" ForeColor="Black" 
        GridLines="Vertical" Width="503px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="product" HeaderText="product" 
                SortExpression="product" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" 
                ReadOnly="True" SortExpression="Amount" />
            <asp:BoundField DataField="price" HeaderText="price" 
                SortExpression="price" />
            <asp:CheckBoxField DataField="orderShipped" HeaderText="orderShipped" 
                SortExpression="orderShipped" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" 
                ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="sds_DetailedOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:coffeeConnection %>" 
        DeleteCommand="DELETE FROM [orders] WHERE [id] = @id" 
        
        InsertCommand="INSERT INTO [orders] ([product], [amount], [price], [orderShipped]) VALUES (@product, @amount, @price, @orderShipped)" SelectCommand="SELECT [product], SUM([amount]) AS Amount, [price], [orderShipped], SUM([amount] *  [price]) AS Total
FROM [orders]
WHERE (([client] = @client) AND ([date] = @date))
GROUP BY product, price, orderShipped" 
        
        UpdateCommand="UPDATE [orders] SET [product] = @product, [amount] = @amount, [price] = @price, [orderShipped] = @orderShipped WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="product" Type="String" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="orderShipped" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="client" QueryStringField="client" 
                Type="String" />
            <asp:QueryStringParameter DbType="Date" Name="date" QueryStringField="date" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="product" Type="String" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="orderShipped" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnShip" runat="server" Height="41px" Text="Ship Order" 
        Width="125px" onclick="btnShip_Click" />
    <br />
    </asp:Content>

