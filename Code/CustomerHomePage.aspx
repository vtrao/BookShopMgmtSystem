<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["username"].ToString();
        if (IsPostBack == false)
            TitleRadioButton.Checked = true;
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
    }

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e){}

    protected void GoButton_Click(object sender, EventArgs e)
    {
        String searchkeyword = "";
        if (TitleRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Title] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (AuthorRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author3] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (CategoryRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Category] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (ISBNRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [ISBN] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (KeywordRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Title]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author3] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Category] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[ISBN]     LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        Session["searchkey"] = SearchTextBox.Text;
        Server.Transfer("CustSearchBooksNor.aspx?value=" + searchkeyword);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=5", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 18px; width: 308px; position: absolute; top: 125px;
        height: 336px">
        <asp:Menu ID="Menu1" runat="server" Style="z-index: 100; left: -169px; position: absolute;
            top: 239px" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px" Width="123px">
            <Items>
                <asp:MenuItem Text="Customer Features" Value="Customer Features">
                    <asp:MenuItem NavigateUrl="~/CustViewBooks.aspx" Text="View Available Books" Value="View Available Books">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/CustViewCart.aspx" Text="View Cart" Value="Purchase Book">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/CustSearchBooksNor.aspx" Text="Search" Value="Search"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/CustOrderBook.aspx" Text="OrderBooks" Value="OrderBook">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/CustProfile.aspx?myvalue=2" Text="Update Profile" Value="Update Profile">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/CustFeedBackandRating.aspx" Text="Feed back and Rating"
                        Value="Feed back and Rating"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="Log out" Value="Log out"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <StaticSelectedStyle BackColor="#507CD1" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
        </asp:Menu>
        <asp:Label ID="Label1" runat="server" Style="z-index: 101; left: 271px; position: absolute;
            top: -43px"></asp:Label>
        &nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Menu ID="Menu2" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" Height="209px" StaticSubMenuIndent="10px"
            Style="z-index: 103; left: 126px; position: absolute; top: 24px" Width="213px">
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <StaticSelectedStyle BackColor="#1C5E55" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <Items>
                <asp:MenuItem NavigateUrl="~/CustViewBooks.aspx" Text="View Books" Value="View Books">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CustViewCart.aspx" Text="View Cart" Value="View Cart"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CustSearchBooksNor.aspx" Text="Search" Value="Search"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CustOrderBook.aspx" Text="Order Books" Value="Order Books">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CustProfile.aspx?myvalue=2" Text="Update My Profile" Value="Update My Profile">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/CustFeedBackandRating.aspx" Text="Feed back and Rating"
                    Value="Feed back and Rating"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        </asp:Menu>
        <br />
        <br />
        <br />
    </div>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 116px; position: absolute; top: -49px" Text="Customer Home Page " Width="305px"></asp:Label>
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CustSearchBooksNor.aspx"
        Style="z-index: 101; left: -101px; position: absolute; top: 254px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 102; left: -131px; position: absolute; top: 341px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 103; left: -143px; position: absolute; top: 318px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 104; left: -111px; position: absolute; top: 298px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2" Style="z-index: 105;
        left: -132px; position: absolute; top: 274px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 106; left: -112px; position: absolute; top: 209px">View Books</asp:HyperLink>
    &nbsp;<br />
    <br />
    &nbsp; &nbsp; Welcome To Our UBP Management System<br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 108;
        left: -106px; position: absolute; top: 233px">View Cart</asp:HyperLink>
    <input id="Button1" style="z-index: 110; left: 439px; position: absolute; top: 35px"
        type="button" value="button" language="javascript" onclick="return Button1_onclick()" />
    <br />
    &nbsp; &nbsp; &nbsp; The Features You are Facilitated with are:
    <div style="z-index: 109; left: -152px; width: 171px; position: absolute; top: -51px;
        height: 215px">
        <asp:RadioButton ID="TitleRadioButton" runat="server" GroupName="search"
            OnCheckedChanged="TitleRadioButton_CheckedChanged" Style="z-index: 100; left: 17px;
            position: absolute; top: 73px" Text="Title" />
        <asp:RadioButton ID="AuthorRadioButton" runat="server" GroupName="search"
            OnCheckedChanged="AuthorRadioButton_CheckedChanged" Style="z-index: 101; left: 17px;
            position: absolute; top: 99px" Text="Author" />
        <strong><span style="text-decoration: underline"><span></span></span></strong>
        <asp:RadioButton ID="CategoryRadioButton" runat="server" GroupName="search"
            OnCheckedChanged="CategoryRadioButton_CheckedChanged" Style="z-index: 102; left: 17px;
            position: absolute; top: 125px" Text="Category" />
        <asp:RadioButton ID="ISBNRadioButton" runat="server" GroupName="search"
            OnCheckedChanged="ISBNRadioButton_CheckedChanged" Style="z-index: 103; left: 17px;
            position: absolute; top: 151px" Text="ISBN Number" />
        <asp:RadioButton ID="KeywordRadioButton" runat="server" GroupName="search"
            OnCheckedChanged="KeywordRadioButton_CheckedChanged" Style="z-index: 104; left: 17px;
            position: absolute; top: 177px" Text="Keyword" />
        <asp:TextBox ID="SearchTextBox" runat="server" Style="z-index: 105; left: 3px; position: absolute;
            top: 44px" Width="138px"></asp:TextBox>
        <asp:Button ID="GoButton" runat="server" OnClick="GoButton_Click" Style="z-index: 106;
            left: 18px; position: absolute; top: 211px" Text="Go...Search" Width="108px" />
        <br />
        &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SearchTextBox"
                ErrorMessage="Search Key Required" Style="z-index: 108; left: 100px; position: absolute;
                top: 73px" Width="35px"></asp:RequiredFieldValidator>
        </span></strong>
    </div>
    <br />
    <br />
    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 109;
        left: 527px; position: absolute; top: -51px" Text="Back" />
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

