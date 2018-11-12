<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true"
    CodeFile="Orders.aspx.cs" Inherits="Pages_Orders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Width="900px">
        <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
            <HeaderTemplate>Open Orders</HeaderTemplate>
            <ContentTemplate>Show orders between : <asp:TextBox ID="txtDateOpen1" 
                    runat="server" AutoPostBack="True" style="font-weight: bold"></asp:TextBox><asp:CalendarExtender 
                    ID="txtDateOpen1_CalendarExtender" runat="server" Enabled="True" 
                    TargetControlID="txtDateOpen1"></asp:CalendarExtender>And: <asp:TextBox 
                    ID="txtDateOpen2" runat="server" AutoPostBack="True" style="font-weight: bold"></asp:TextBox><strong><asp:CalendarExtender 
                    ID="txtDateOpen2_CalendarExtender" runat="server" TargetControlID="txtDateOpen2"
                        Enabled="True"></asp:CalendarExtender><br /></strong><br /><asp:Label ID="lblOpenOrders" runat="server"></asp:Label></ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <HeaderTemplate>Completed Orders</HeaderTemplate>
            <ContentTemplate><strong>Show orders between : <asp:TextBox ID="txtDateClosed1" runat="server" AutoPostBack="True"></asp:TextBox><asp:CalendarExtender ID="txtDateClosed1_CalendarExtender" runat="server" 
                    TargetControlID="txtDateClosed1"></asp:CalendarExtender>And: <asp:TextBox ID="txtDateClosed2" runat="server" AutoPostBack="True"></asp:TextBox><asp:CalendarExtender ID="txtDateClosed2_CalendarExtender" runat="server" 
                    TargetControlID="txtDateClosed2"></asp:CalendarExtender><br /></strong><br /><asp:Label ID="lblClosedOrders" runat="server"></asp:Label></ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
            <HeaderTemplate>Charts<br /></HeaderTemplate>
            <ContentTemplate><br /><asp:LineChart ID="LineChart1" runat="server" Height="353px" Theme="" 
                    TooltipBackgroundColor="" TooltipBorderColor="" TooltipFontColor="" 
                    ValueAxisLines="0" Width="16px"></asp:LineChart>
                <br />
                <asp:LineChart ID="LineChart2" runat="server" Height="353px" Theme="" 
                    TooltipBackgroundColor="" TooltipBorderColor="" TooltipFontColor="" 
                    ValueAxisLines="0" Width="16px">
                </asp:LineChart>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
</asp:Content>
