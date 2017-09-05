<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack==false)
        {
            TitleRadioButton.Checked = true;
        }
    }
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
    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e) { }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 63px; position: absolute; top: -48px" Text="On Line Help and Some Useful Links"
        Width="320px"></asp:Label>
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Set of Help features
    on line to be provided<br />
    <br />
    <br />
    <br />
    <div style="z-index: 106; left: -273px; width: 113px; position: absolute; top: -50px;
        height: 606px">
        <img src="images/globe.JPG" style="z-index: 107; left: 38px; width: 43px; position: absolute;
            top: 11px; height: 31px" />
        <img src="images/Contact-S.jpg" style="z-index: 108; left: 41px; width: 37px; position: absolute;
            top: 90px; height: 27px" />
        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/AboutUs.aspx" Style="z-index: 100;
            left: 41px; position: absolute; top: 58px">About</asp:HyperLink>
        <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/ContactUs.aspx" Style="z-index: 101;
            left: 26px; position: absolute; top: 133px">Contact Us</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/CustSearchBooksNor.aspx"
            Style="z-index: 102; left: 12px; position: absolute; top: 215px">Normal Search</asp:HyperLink>
        <img src="images/search.jpg" style="z-index: 110; left: 37px; width: 45px; position: absolute;
            top: 165px; height: 34px" />
        &nbsp; &nbsp;&nbsp;
        <img src="images/books.JPG" style="z-index: 112; left: 36px; width: 46px; position: absolute;
            top: 247px; height: 35px" />
        <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 105;
            left: 17px; position: absolute; top: 298px">Order a Book</asp:HyperLink>
        <img src="images/J0321179.JPG" style="z-index: 113; left: 37px; width: 44px; position: absolute;
            top: 330px; height: 31px" />
        <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
            Style="z-index: 114; left: 7px; position: absolute; top: 384px" Width="105px">Register With Us</asp:HyperLink>
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
        Style="z-index: 101; left: -119px; position: absolute; top: 278px">New User</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ContactUs.aspx" Style="z-index: 102;
        left: -122px; position: absolute; top: 304px">Contact Us</asp:HyperLink>
    &nbsp;
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 104;
        left: -123px; position: absolute; top: 253px">User Login</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 105;
        left: -107px; position: absolute; top: 228px">Home</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/AboutUs.aspx" Style="z-index: 107;
        left: -107px; position: absolute; top: 203px">About</asp:HyperLink>
    <div style="z-index: 107; left: -151px; width: 171px; position: absolute; top: -50px;
        height: 215px">
        <asp:RadioButton ID="TitleRadioButton" runat="server" GroupName="search" OnCheckedChanged="TitleRadioButton_CheckedChanged"
            Style="z-index: 100; left: 17px; position: absolute; top: 73px" Text="Title" />
        <asp:RadioButton ID="AuthorRadioButton" runat="server" GroupName="search" OnCheckedChanged="AuthorRadioButton_CheckedChanged"
            Style="z-index: 101; left: 17px; position: absolute; top: 99px" Text="Author" />
        <strong><span style="text-decoration: underline"></span></strong>
        <asp:RadioButton ID="CategoryRadioButton" runat="server" GroupName="search" OnCheckedChanged="CategoryRadioButton_CheckedChanged"
            Style="z-index: 102; left: 17px; position: absolute; top: 125px" Text="Category" />
        <asp:RadioButton ID="ISBNRadioButton" runat="server" GroupName="search" OnCheckedChanged="ISBNRadioButton_CheckedChanged"
            Style="z-index: 103; left: 17px; position: absolute; top: 151px" Text="ISBN Number" />
        <asp:RadioButton ID="KeywordRadioButton" runat="server" GroupName="search" OnCheckedChanged="KeywordRadioButton_CheckedChanged"
            Style="z-index: 104; left: 17px; position: absolute; top: 177px" Text="Keyword" />
        <asp:TextBox ID="SearchTextBox" runat="server" Style="z-index: 105; left: 3px; position: absolute;
            top: 44px" Width="138px"></asp:TextBox>
        <asp:Button ID="GoButton" runat="server" OnClick="GoButton_Click" Style="z-index: 106;
            left: 18px; position: absolute; top: 211px" Text="Go...Search" Width="108px" />
        <br />
        &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SearchTextBox"
                ErrorMessage="Search Key Required" Style="z-index: 108; left: 103px; position: absolute;
                top: 70px" Width="35px"></asp:RequiredFieldValidator>
        </span></strong>
    </div>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Set of Good links
    on the web are to be given<br />
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
    <br />
</asp:Content>
