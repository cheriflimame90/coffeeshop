<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td><b>Login: </b></td>
            <td>
                <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtLogin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><b>Password: </b></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    onclick="btnLogin_Click" /><br/>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" 
                    PostBackUrl="~/Pages/Account/Registration.aspx" CausesValidation="False">Register</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

