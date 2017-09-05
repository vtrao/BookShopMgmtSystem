<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--



function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=3", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 51px; width: 126px; position: absolute; top: 115px;
        height: 66px" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
        <asp:Menu ID="Menu1" runat="server" Height="65px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="126px" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
            <Items>
                <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                    Value="Generate Bill"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="Logout" Value="Logout"></asp:MenuItem>
            </Items>
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <StaticSelectedStyle BackColor="#1C5E55" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        </asp:Menu>
    </div>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 81px; position: absolute; top: -27px" Text="Cashier Home Page" Width="305px"></asp:Label>
    &nbsp; Welcome To Our UBP Management System<br />
    <br />
    &nbsp; The Features You are Facilitated with are:<br />
    <br />
    <br />
    <asp:Menu ID="Menu2" runat="server" Style="z-index: 105; left: -142px; position: absolute;
        top: 106px">
        <Items>
            <asp:MenuItem Text="Cashier Features" Value="Cashier Features">
                <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                    Value="Generate Bill"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 102; left: -128px; position: absolute; top: 39px">Generate Bill</asp:HyperLink>
    &nbsp;&nbsp;<br />
    <input id="Button1" style="z-index: 109; left: 398px; position: absolute; top: 49px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 104; left: -143px; position: absolute; top: 61px">Change Password</asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

