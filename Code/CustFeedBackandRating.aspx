<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            TitleRadioButton.Checked = true;
            Title1RadioButton.Checked = true;
            filldropdown1("Title");
            SelectBookDropDownList.Visible = false;
            SelectBookLabel.Visible = false;
            CurrentRatingTextBoxfill(Select1DropDownList.SelectedValue.ToString());
        }
    }
    
    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e) { }

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

    protected void Title1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        SelectBookDropDownList.Visible = false;
        SelectBookLabel.Visible = false;
        Select1DropDownList.Items.Clear();
        filldropdown1("Title");
        displayLabel.Text = "Books as per Title";
    }

    protected void Author1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        SelectBookDropDownList.Visible = true;
        SelectBookLabel.Visible = true;
        Select1DropDownList.Items.Clear();
        filldropdown1("Author");
        displayLabel.Text = "Books as per Author";
        filldropdown1("Author2");
        filldropdown1("Author3");
        selectbookdropdownfillwhenaothororcategoryissselected(" WHERE [Author] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author2] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author3] = '" + Select1DropDownList.SelectedValue.ToString() + "'");
    }

    protected void Category1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        SelectBookDropDownList.Visible = true;
        SelectBookLabel.Visible = true;
        Select1DropDownList.Items.Clear();
        filldropdown1("Category");
        displayLabel.Text = "Books as per Category";
        selectbookdropdownfillwhenaothororcategoryissselected("WHERE [Category] = '" + Select1DropDownList.SelectedValue.ToString() + "'");
    }
    void filldropdown1(String key) // to fill the category of selection menu
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query = "SELECT DISTINCT [" + key + "] FROM BooksAvailable WHERE [Number of Copies]<>0";
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
        {
            if (dt.Tables["BooksAvailable"].Rows[i][key].ToString().Equals("") || dt.Tables["BooksAvailable"].Rows[i][key].ToString().Equals(" "))
            { }
            else
                Select1DropDownList.Items.Add(dt.Tables["BooksAvailable"].Rows[i][key].ToString());
        }
        con.Close();
    }

    protected void select1DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Title1RadioButton.Checked == true)
        {
            CurrentRatingTextBoxfill(Select1DropDownList.SelectedValue.ToString());          
        }
        else if (Author1RadioButton.Checked == true)
        {
            selectbookdropdownfillwhenaothororcategoryissselected(" WHERE [Author] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author2] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author3] = '" + Select1DropDownList.SelectedValue.ToString() + "'");                        
        }
        else if (Category1RadioButton.Checked == true)
        {
            selectbookdropdownfillwhenaothororcategoryissselected("WHERE [Category] = '" + Select1DropDownList.SelectedValue.ToString() + "'");
        }
    }
    void CurrentRatingTextBoxfill(String key)    
    {        
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Rating],[RatedUserCount] FROM [BooksAvailable] WHERE [Title] = '" + key +"'", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        CurrentRatingTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Rating"].ToString();
        BufferLabel.Text = dt.Tables["BooksAvailable"].Rows[0]["RatedUserCount"].ToString();        
        con.Close();    
    }
    void selectbookdropdownfillwhenaothororcategoryissselected(String key)
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query;
        System.Data.SqlClient.SqlDataAdapter adapter;
        System.Data.DataSet dt;
        query = "SELECT DISTINCT [Title] FROM BooksAvailable "+key ;
        adapter = new System.Data.SqlClient.SqlDataAdapter(query, con);
        dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        SelectBookDropDownList.Items.Clear();
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
        {
            SelectBookDropDownList.Items.Add(dt.Tables["BooksAvailable"].Rows[i]["Title"].ToString());
        }
        CurrentRatingTextBoxfill(SelectBookDropDownList.SelectedValue.ToString());        
    }
    protected void SelectBookDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentRatingTextBoxfill(SelectBookDropDownList.SelectedValue.ToString()); 
    }

    protected void RateitButton_Click(object sender, EventArgs e)
    {
        float rating = (float.Parse(myratingDropDownList.SelectedValue.ToString()) + float.Parse(CurrentRatingTextBox.Text) * int.Parse(BufferLabel.Text)) / (int.Parse(BufferLabel.Text) + 1);
        //Label.Text =  rating.ToString();
        int users = int.Parse(BufferLabel.Text) + 1;
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.UpdateCommand = "UPDATE [BooksAvailable] SET [Rating]=(@rat),[RatedUserCount]=(@ruc) WHERE ([Title]=(@title))";
        sds.UpdateParameters.Add("rat", rating.ToString());
        sds.UpdateParameters.Add("ruc",users.ToString());
        if(Title1RadioButton.Checked == true)
            sds.UpdateParameters.Add("title",Select1DropDownList.SelectedValue.ToString());
        else
            sds.UpdateParameters.Add("title",SelectBookDropDownList.SelectedValue.ToString());
        sds.Update();
        Labelc.Text = "Successful! Your feedBack on book is considered";
        if (Title1RadioButton.Checked == true)
        {
            CurrentRatingTextBoxfill(Select1DropDownList.SelectedValue.ToString());
        }
        else if (Author1RadioButton.Checked == true)
        {
            selectbookdropdownfillwhenaothororcategoryissselected(" WHERE [Author] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author2] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                                                    "[Author3] = '" + Select1DropDownList.SelectedValue.ToString() + "'");
        }
        else if (Category1RadioButton.Checked == true)
        {
            selectbookdropdownfillwhenaothororcategoryissselected("WHERE [Category] = '" + Select1DropDownList.SelectedValue.ToString() + "'");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=15", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 100;
        left: 525px; position: absolute; top: -25px" Text="Back" CausesValidation="False" />
    <br />
    <br />
    <input id="Button1" style="z-index: 110; left: 494px; position: absolute; top: 21px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 101;
        left: 74px; position: absolute; top: -49px" Text="FeedBack and Rating on Books"
        Width="305px"></asp:Label>
    <asp:Label ID="Label5" runat="server" Style="z-index: 102; left: 5px; position: absolute;
        top: 5px" Text="Select the Category to View by" Width="189px"></asp:Label>
    <asp:RadioButton ID="Title1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        OnCheckedChanged="Title1RadioButton_CheckedChanged" Style="z-index: 103; left: 30px;
        position: absolute; top: 38px" Text="Title" />
    <asp:RadioButton ID="Author1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        OnCheckedChanged="Author1RadioButton_CheckedChanged" Style="z-index: 104; left: 30px;
        position: absolute; top: 65px" Text="Author" />
    <asp:RadioButton ID="Category1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        OnCheckedChanged="Category1RadioButton_CheckedChanged" Style="z-index: 105; left: 30px;
        position: absolute; top: 92px" Text="Category" />
    <asp:DropDownList ID="Select1DropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="select1DropDownList_SelectedIndexChanged"
        Style="z-index: 106; left: 221px; position: absolute; top: 93px" Width="367px">
    </asp:DropDownList>
    <asp:Label ID="displayLabel" runat="server" Style="z-index: 107; left: 221px; position: absolute;
        top: 69px"></asp:Label>
    <asp:Label ID="Label3" runat="server" Style="z-index: 108; left: 6px; position: absolute;
        top: 130px" Text="Current Rating of Selected Book" Width="183px"></asp:Label>
    <br />
    <br />
    <asp:Label ID="SelectBookLabel" runat="server" Height="3px" Style="z-index: 109;
        left: 221px; position: absolute; top: 130px" Width="151px" Visible="False">Select the Book to Rate</asp:Label>
    <br />
    <br />
    <br />
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px"
        Style="z-index: 110; left: -151px; position: absolute; top: 350px" Width="123px">
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
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CustSearchBooksNor.aspx"
        Style="z-index: 111; left: -101px; position: absolute; top: 263px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 112; left: -136px; position: absolute; top: 326px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 113; left: -118px; position: absolute; top: 284px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2"
        Style="z-index: 114; left: -135px; position: absolute; top: 305px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 115; left: -116px; position: absolute; top: 221px">View Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 116;
        left: -110px; position: absolute; top: 242px">View Cart</asp:HyperLink>
    <div style="z-index: 109; left: -151px; width: 171px; position: absolute; top: -50px;
        height: 215px">
        <asp:RadioButton ID="TitleRadioButton" runat="server" GroupName="search" OnCheckedChanged="TitleRadioButton_CheckedChanged"
            Style="z-index: 100; left: 17px; position: absolute; top: 73px" Text="Title" />
        <asp:RadioButton ID="AuthorRadioButton" runat="server" GroupName="search" OnCheckedChanged="AuthorRadioButton_CheckedChanged"
            Style="z-index: 101; left: 17px; position: absolute; top: 99px" Text="Author" />
        <strong><span style="text-decoration: underline"><span></span></span></strong>
        <asp:RadioButton ID="CategoryRadioButton" runat="server" GroupName="search" OnCheckedChanged="CategoryRadioButton_CheckedChanged"
            Style="z-index: 102; left: 17px; position: absolute; top: 125px" Text="Category" />
        <asp:RadioButton ID="ISBNRadioButton" runat="server" GroupName="search" OnCheckedChanged="ISBNRadioButton_CheckedChanged"
            Style="z-index: 103; left: 17px; position: absolute; top: 151px" Text="ISBN Number" />
        <asp:RadioButton ID="KeywordRadioButton" runat="server" GroupName="search" OnCheckedChanged="KeywordRadioButton_CheckedChanged"
            Style="z-index: 104; left: 17px; position: absolute; top: 177px" Text="Keyword" />
        <asp:TextBox ID="SearchTextBox" runat="server" Style="z-index: 105; left: 3px; position: absolute;
            top: 44px" Width="138px"></asp:TextBox>
        <asp:Button ID="GoButton" runat="server" CausesValidation="False" OnClick="GoButton_Click"
            Style="z-index: 106; left: 18px; position: absolute; top: 211px" Text="Go...Search"
            Width="108px" />
        <br />
        &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search &nbsp;
        </span></strong>
    </div>
    <asp:TextBox ID="CurrentRatingTextBox" runat="server" ReadOnly="True" Style="z-index: 117; left: 33px;
        position: absolute; top: 160px" Width="109px"></asp:TextBox>
    <br />
    <asp:DropDownList ID="SelectBookDropDownList" runat="server" Style="z-index: 118; left: 221px;
        position: absolute; top: 160px" Width="343px" OnSelectedIndexChanged="SelectBookDropDownList_SelectedIndexChanged" Visible="False" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label" runat="server" Style="z-index: 119; left: 6px; position: absolute;
        top: 200px" Text="Select Your Rating out of 4" Width="152px"></asp:Label>
    &nbsp;<br />
    <br />
    &nbsp;
    <asp:Button ID="RateitButton" runat="server" Style="z-index: 123; left: 239px; position: absolute;
        top: 227px" Text="Rate It..." OnClick="RateitButton_Click" />
    <br />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="myratingDropDownList" runat="server" Style="z-index: 128; left: 33px;
        position: absolute; top: 229px" Width="51px">
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Label ID="BufferLabel" runat="server" Style="z-index: 125; left: 15px; position: absolute;
        top: 347px" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Labelc" runat="server" Style="z-index: 126; left: 7px; position: absolute;
        top: 267px" Width="289px"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Style="z-index: 127; left: 352px; position: absolute;
        top: 227px" Text="Continue" CausesValidation="False" OnClick="Button2_Click" />
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
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>

