<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=4", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" Height="235px" StaticSubMenuIndent="10px"
        Style="z-index: 100; left: 12px; position: absolute; top: 118px" Width="301px">
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
        <DynamicMenuStyle BackColor="#E3EAEB" />
        <StaticSelectedStyle BackColor="#1C5E55" />
        <DynamicSelectedStyle BackColor="#1C5E55" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <Items>
            <asp:MenuItem NavigateUrl="~/AdminClerkAddBooks.aspx" Text="Add Books" Value="Add Books">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx" Text="Edit/Delete Book"
                Value="Edit/Delete Book"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="Logout" Value="Logout"></asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    </asp:Menu>
    <asp:HyperLink ID="HyperLink1" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 101; left: -139px; position: absolute; top: 62px">Change Password</asp:HyperLink>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 102;
        left: 191px; position: absolute; top: -99px" Text="Clerk Home Page" Width="305px"></asp:Label>
    <asp:Menu ID="Menu2" runat="server" Style="z-index: 106; left: -138px; position: absolute;
        top: 104px">
        <Items>
            <asp:MenuItem Text="Clerk Features" Value="Clerk Features">
                <asp:MenuItem NavigateUrl="~/AdminClerkAddBooks.aspx" Text="Add Books" Value="Add Books">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx" Text="Edit/Delete Books"
                    Value="Edit/Delete Books"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change password" Value="Change password">
                </asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    <input id="Button1" style="z-index: 100; left: 439px; position: absolute; top: 16px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    &nbsp;&nbsp; Welcome To Our UBP Management System<br />
    <asp:HyperLink ID="HyperLink2" runat="server" Height="14px" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
        Style="z-index: 104; left: -135px; position: absolute; top: 40px">Edit/Delete Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
        Style="z-index: 105; left: -112px; position: absolute; top: -7px">Add Books</asp:HyperLink>
    <br />
    &nbsp; &nbsp;&nbsp; The Features You are Facilitated with are:<br />
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
    <br />
    <br />
    <br />
</asp:Content>

