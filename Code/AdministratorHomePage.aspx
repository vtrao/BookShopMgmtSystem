<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Administrator Home Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["username"].ToString();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=2", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 31px; width: 346px; position: absolute; top: 145px;
        height: 247px">
        <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" Height="235px" StaticSubMenuIndent="10px"
            Style="z-index: 100; left: 8px; position: absolute; top: 6px" Width="178px">
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
                <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                    Value="Generate Bill"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/AdminReportGenerationA.aspx" Text="Report Generation"
                    Value="Report Generation"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/AdminChangeBookShopName.aspx" Text="Change name of Book Shop"
                    Value="Change name of Book Shop"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="Logout" Value="Logout"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        </asp:Menu>
    </div>
    <br />
    &nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 97px; position: absolute; top: -22px" Text="Administrator Home Page" Width="305px"></asp:Label>
    &nbsp;&nbsp;<br />
    <br />
    &nbsp; &nbsp;&nbsp; Welcome To Our UBP Management System<br />
    <input id="Button1" style="z-index: 110; left: 407px; position: absolute; top: 40px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    &nbsp; &nbsp; &nbsp;&nbsp; The Features You are Facilitated with are:<br />
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
    <div style="z-index: 109; left: 598px; width: 168px; position: absolute; top: 4px;
        height: 411px">
        <asp:Menu ID="Menu2" runat="server"
            Style="z-index: 100; left: -748px; position: absolute; top: 103px" Height="14px">
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            <Items>
                <asp:MenuItem Text="Administrator Features" Value="Administrator Features">
                    <asp:MenuItem NavigateUrl="~/AdminClerkAddBooks.aspx" Text="Add Book" Value="Add Book">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx" Text="Edit/Delete Books"
                        Value="Edit/Delete Books"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/AdminReportGenerationA.aspx" Text="Report Generation"
                        Value="Report Generation"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                        Value="Generate Bill"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/AdminChangeBookShopName.aspx" Text="Change name of Book Shop"
                        Value="Change name of Book Shop"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                        Value="Generate Bill"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
            Style="z-index: 101; left: -726px; position: absolute; top: 78px" Height="14px">Change Password</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
            Style="z-index: 102; left: -727px; position: absolute; top: 9px" Height="14px">Edit/Delete Books</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/AdminReportGenerationA.aspx"
            Style="z-index: 103; left: -730px; position: absolute; top: 32px" Height="14px">Report Generation</asp:HyperLink>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AdminChangeBookShopName.aspx"
            Style="z-index: 104; left: -751px; position: absolute; top: 55px" Width="184px" Height="14px">Change Book Shop Name</asp:HyperLink>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
            Style="z-index: 106; left: -703px; position: absolute; top: -32px">Add Books</asp:HyperLink>
    </div>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Style="z-index: 101; left: 321px; position: absolute;
        top: 84px"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 103; left: -113px; position: absolute; top: -6px">Generate Bill</asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

