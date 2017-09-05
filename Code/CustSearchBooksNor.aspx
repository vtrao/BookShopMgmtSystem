<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        HyperLink1.Visible = false;
        HyperLink3.Visible = false;
        HyperLink4.Visible = false;
        HyperLink5.Visible = false;
        HyperLink6.Visible = false;
        HyperLink7.Visible = false;
        Menu1.Visible = false;
        if (Request["value"] == null)
        {
        }
        else
        {
            ProcessAndDisplay(Request["value"].ToString());
            SearchTextBox.Text = Session["searchkey"].ToString();
        }
        if (Session["username"] != null)
        {
            if (Session["username"].Equals("administrator")) { }
            else if (Session["username"].Equals("clerk")) { }
            else if (Session["username"].Equals("cashier")) { }
            else
            {
                HyperLink1.Visible = true;
                HyperLink3.Visible = true;
                HyperLink4.Visible = true;
                HyperLink5.Visible = true;
                HyperLink6.Visible = true;
                HyperLink7.Visible = true;
                Menu1.Visible = true;
            }
        }
        if (IsPostBack == false)
            TitleRadioButton.Checked = true;
    }

           
    protected void BackButton_Click(object sender, EventArgs e)
    {
        if (Session["username"] != null)
            Server.Transfer("CustomerHomePage.aspx");
        else
            Server.Transfer("Homepage.aspx");
    }
   
    void ProcessAndDisplay(String searchKeyword)
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query = "Select [Title],[Author],[Edition],[Price],[Publisher],[Category] FROM BooksAvailable " + searchKeyword;
        System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet ds = new System.Data.DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        Label1.Text = "Search Results";
    }   

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        String searchkeyword = "WHERE [Title] LIKE '%" + SearchTextBox.Text + "%'";
        ProcessAndDisplay(searchkeyword);      
    }
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        String searchkeyword = "WHERE [Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author3] LIKE '%" + SearchTextBox.Text + "%'";
        ProcessAndDisplay(searchkeyword);
    }
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        String searchkeyword = "WHERE [Category] LIKE '%" + SearchTextBox.Text + "%'";
        ProcessAndDisplay(searchkeyword);
    }
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        String searchkeyword = "WHERE [ISBN] LIKE '%" + SearchTextBox.Text + "%'";
        ProcessAndDisplay(searchkeyword);
    }
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        String searchkeyword = "WHERE [Title]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author3] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Category] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[ISBN]     LIKE '%" + SearchTextBox.Text + "%'";
        ProcessAndDisplay(searchkeyword);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--


function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=20", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div id="DIV1" style="z-index: 108; left: 4px; width: 587px; position: absolute;
        top: -30px; height: 350px" language="javascript" onclick="return DIV1_onclick()">
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 171px; position: absolute;
            top: 13px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 101;
            left: 150px; position: absolute; top: -14px" Text="Search for Books" Width="122px"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT DISTINCT [Category] FROM [BooksAvailable]"></asp:SqlDataSource>
        <input id="Button1" style="z-index: 105; left: 413px; position: absolute; top: -13px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
        &nbsp; &nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" Height="161px" Style="z-index: 103; left: 3px;
            position: absolute; top: 42px" Width="603px" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        &nbsp;
        <div style="z-index: 104; left: -158px; width: 171px; position: absolute; top: -9px;
            height: 215px">
            <asp:RadioButton ID="TitleRadioButton" runat="server" GroupName="search" Style="z-index: 100;
                left: 17px; position: absolute; top: 73px" Text="Title" AutoPostBack="True" OnCheckedChanged="TitleRadioButton_CheckedChanged" CausesValidation="True" />
            <asp:RadioButton ID="AuthorRadioButton" runat="server" GroupName="search" Style="z-index: 101;
                left: 17px; position: absolute; top: 99px" Text="Author" AutoPostBack="True" OnCheckedChanged="AuthorRadioButton_CheckedChanged" CausesValidation="True" />
            <asp:RadioButton ID="CategoryRadioButton" runat="server" GroupName="search" Style="z-index: 102;
                left: 17px; position: absolute; top: 125px" Text="Category" AutoPostBack="True" OnCheckedChanged="CategoryRadioButton_CheckedChanged" CausesValidation="True" />
            <asp:RadioButton ID="ISBNRadioButton" runat="server" GroupName="search" Style="z-index: 103;
                left: 17px; position: absolute; top: 151px" Text="ISBN Number" AutoPostBack="True" OnCheckedChanged="ISBNRadioButton_CheckedChanged" CausesValidation="True" />
            <asp:RadioButton ID="KeywordRadioButton" runat="server" GroupName="search" Style="z-index: 104;
                left: 17px; position: absolute; top: 177px" Text="Keyword" AutoPostBack="True" OnCheckedChanged="KeywordRadioButton_CheckedChanged" CausesValidation="True" />
            <asp:TextBox ID="SearchTextBox" runat="server" Style="z-index: 105; left: 3px; position: absolute;
                top: 44px" Width="138px"></asp:TextBox>
            &nbsp;&nbsp;<br />
            &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SearchTextBox"
                ErrorMessage="Search Key Required" Style="z-index: 108; left: 94px; position: absolute; top: 67px" Width="35px"></asp:RequiredFieldValidator>
            </span></strong>
        </div>
    </div>
    <br />
    &nbsp;<br />
    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 100;
        left: 536px; position: absolute; top: -45px" Text="Back" CausesValidation="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px"
        Style="z-index: 101; left: -145px; position: absolute; top: 346px" Width="123px">
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <StaticSelectedStyle BackColor="#507CD1" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
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
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
    </asp:Menu>
    <asp:HyperLink ID="HyperLink3" runat="server" Height="16px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 102; left: -130px; position: absolute; top: 320px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" Height="16px" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 103; left: -143px; position: absolute; top: 297px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" Height="16px" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 104; left: -112px; position: absolute; top: 274px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" Height="16px" NavigateUrl="~/CustProfile.aspx?myvalue=2"
        Style="z-index: 105; left: -129px; position: absolute; top: 251px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" Height="16px" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 106; left: -110px; position: absolute; top: 228px">View Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" Height="16px" NavigateUrl="~/CustViewCart.aspx"
        Style="z-index: 108; left: -104px; position: absolute; top: 205px">View Cart</asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
</asp:Content>

