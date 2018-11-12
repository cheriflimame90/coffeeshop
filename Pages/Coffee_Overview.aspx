<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Coffee_Overview.aspx.cs" Inherits="Pages_Coffee_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Available Coffee:</h3>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Pages/Coffee_Add.aspx">Add new Coffee</asp:LinkButton>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            CellSpacing="4" DataKeyNames="id" DataSourceID="sds_coffee" ForeColor="Black" 
            GridLines="Vertical" Width="858px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="roast" HeaderText="roast" SortExpression="roast" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                <asp:BoundField DataField="review" HeaderText="review" 
                    SortExpression="review" />
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
        <asp:SqlDataSource ID="sds_coffee" runat="server" 
            ConnectionString="<%$ ConnectionStrings:coffeeConnection %>" 
            DeleteCommand="DELETE FROM [coffee] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [coffee] ([name], [type], [price], [roast], [country], [image], [review]) VALUES (@name, @type, @price, @roast, @country, @image, @review)" 
            SelectCommand="SELECT * FROM [coffee]" 
            UpdateCommand="UPDATE [coffee] SET [name] = @name, [type] = @type, [price] = @price, [roast] = @roast, [country] = @country, [image] = @image, [review] = @review WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="roast" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="roast" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

