<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">
       
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (IsPostBack == false)
        {
            TitleRadioButton.Checked = true;            
            displayLabel.Text = "Books as per Title";
            Title1RadioButton.Checked = true;
            filldropdown1("Title");
            Processanddisplay();  
        }
       
    }
  
    protected void AddToCartButton_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con1.Open();
        System.Data.SqlClient.SqlDataAdapter adapter1 = new System.Data.SqlClient.SqlDataAdapter("SELECT [BookID],[Title],[Publisher],[Price],[Number of Copies],[Discount] FROM [BooksAvailable] where [BookID]=" + DropDownList2.SelectedValue.ToString(), con1);
        System.Data.DataSet dt2 = new System.Data.DataSet();
        adapter1.Fill(dt2, "[BooksAvailable]");
        String bn = dt2.Tables["[BooksAvailable]"].Rows[0]["Title"].ToString();
        String bid = dt2.Tables["[BooksAvailable]"].Rows[0]["BookID"].ToString();
        String p = dt2.Tables["[BooksAvailable]"].Rows[0]["Publisher"].ToString();
        float c = float.Parse(dt2.Tables["[BooksAvailable]"].Rows[0]["Price"].ToString());
        int numberofcopies = int.Parse(dt2.Tables["[BooksAvailable]"].Rows[0]["Number of Copies"].ToString());
        float discountamount = float.Parse(dt2.Tables["[BooksAvailable]"].Rows[0]["Discount"].ToString());
        con1.Close(); 
        float totcost = 0;
        int alreadyexistsflag = 0;
        int copies = int.Parse(DropDownList1.SelectedValue.ToString());
        totcost = copies * (c - discountamount);
        
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [BookID],[UserName] FROM [CustCart] where [Status] = 1", con);
            System.Data.DataSet dt = new System.Data.DataSet();
            adapter.Fill(dt, "CustCart");
            for (int i = 0; i < dt.Tables["CustCart"].Rows.Count; i++)
            {
                if (Session["username"].Equals(dt.Tables["CustCart"].Rows[i]["UserName"].ToString())
                    && bid.ToString().Equals(dt.Tables["CustCart"].Rows[i]["BookID"].ToString()))
                    alreadyexistsflag = 1;        
            }
            con.Close();
            if (alreadyexistsflag == 0)
            {
                SqlDataSource test = new SqlDataSource();
                test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                test.InsertCommand = "INSERT INTO [CustCart] ([noc],[BookID],[Total Cost],[Status],[UserName],[Book Name],[Publisher],[Delivered],[DateandTime]) VALUES (@nocp,@bookid,@totalcost,@status,@username,@bookname,@publisher,@delivered,@dtime)";
                test.InsertParameters.Add("nocp", copies.ToString());
                test.InsertParameters.Add("bookid", bid.ToString());
                test.InsertParameters.Add("totalcost", totcost.ToString());
                test.InsertParameters.Add("status", "1"); // after billing this is made 0
                test.InsertParameters.Add("username", Session["username"].ToString());
                test.InsertParameters.Add("bookname", bn.ToString());
                test.InsertParameters.Add("publisher", p.ToString());
                test.InsertParameters.Add("delivered", "1"); // after delivery this is made 0
                test.InsertParameters.Add("dtime", DateTime.Now.ToString());
                test.Insert();
                SuccessLabel.Text = "SuccessFully Added To Cart Click View Cart link To purchase the Cart Items" + totcost;
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                sds.UpdateCommand = "UPDATE [BooksAvailable] SET [Number of Copies]=(@numoc) WHERE ([BookID]=(@bookid))";
                int remain = numberofcopies - copies;
                sds.UpdateParameters.Add("numoc", remain.ToString());
                sds.UpdateParameters.Add("bookid", bid.ToString());
                sds.Update();
                //fillDropDown1();
                //Server.Transfer("CustViewBooks.aspx");
            }
            else
                SuccessLabel.Text = "Sorry This Book is already added to ur Cart \nRemove it from Ur Cart to select again Goto View Cart" + totcost;
            Processanddisplay();  
    }

    protected void ViewCartButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustViewCart.aspx");
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
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

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e) {}
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e) {}
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e) {}
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e) {}
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e) {}

    protected void Title1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Select1DropDownList.Items.Clear();
        filldropdown1("Title");
        displayLabel.Text = "Books as per Title";
        Processanddisplay();
    }

    protected void Author1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Select1DropDownList.Items.Clear();
        filldropdown1("Author");
        displayLabel.Text = "Books as per Author";
        filldropdown1("Author2");
        filldropdown1("Author3");
        Processanddisplay();
    }

    protected void Category1RadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Select1DropDownList.Items.Clear();
        filldropdown1("Category");
        displayLabel.Text = "Books as per Category";
        Processanddisplay();
    }

    protected void select1DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Processanddisplay();   
    }

    void Processanddisplay()
    {
        String searchkeyword = "";
        if (Title1RadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Title] = '" + Select1DropDownList.SelectedValue.ToString() + "'";
        }
        else if (Author1RadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Author] = '" + Select1DropDownList.SelectedValue.ToString() + "'  OR " +
                                    "[Author2] = '" + Select1DropDownList.SelectedValue.ToString() + "' OR " +
                                    "[Author3] = '" + Select1DropDownList.SelectedValue.ToString() + "' ";
        }
        else if (Category1RadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Category] = '" + Select1DropDownList.SelectedValue.ToString() + "'";
        }
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query = "Select [BookID],[Title],[Rating],[Author],[Edition],[Price],[Discount],[Publisher],[Author2],[Author3] FROM BooksAvailable " + searchkeyword + " AND [Number of Copies]<>0";
        System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet ds = new System.Data.DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        System.Data.DataSet dt = new System.Data.DataSet();
        da.Fill(dt, "BooksAvailable");
        Label12.Text = "View Books by " + Select1DropDownList.SelectedValue.ToString();
        DropDownList2.Items.Clear(); // filling book ids drop down menu
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
        {
            DropDownList2.Items.Add(dt.Tables["BooksAvailable"].Rows[i]["BookID"].ToString());
        }
        fillDropdownnoitems();
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

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillDropdownnoitems();
    }
    void fillDropdownnoitems()
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Number of Copies] FROM [BooksAvailable] WHERE [BookID] = " + DropDownList2.SelectedValue.ToString(), con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        int numberofcopies = int.Parse(dt.Tables["BooksAvailable"].Rows[0]["Number of Copies"].ToString());
        con.Close();
        DropDownList1.Items.Clear();
        for (int i = 1; i <= numberofcopies; i++)
            DropDownList1.Items.Add(i.ToString());
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=21", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 35px; width: 432px; position: absolute; top: 188px;
        height: 209px">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" Style="z-index: 100; left: -32px;
            position: absolute; top: 49px" Width="607px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:Label ID="Label12" runat="server" Style="z-index: 102; left: 163px; position: absolute;
            top: 20px"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [BooksAvailable] WHERE ([Number of Copies] <> @Number_of_Copies)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Number_of_Copies" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 145px; position: absolute; top: -48px" Text="Available Books to Purchase "
        Width="305px"></asp:Label>
    &nbsp;<br />
    &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Style="z-index: 101; left: 17px; position: absolute;
        top: -4px" Text="Select the Category to View by" Width="189px"></asp:Label>
    <asp:RadioButton ID="Title1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        Style="z-index: 102; left: 18px; position: absolute; top: 18px" Text="Title" OnCheckedChanged="Title1RadioButton_CheckedChanged" />
    <asp:RadioButton ID="Author1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        Style="z-index: 103; left: 18px; position: absolute; top: 43px" Text="Author" OnCheckedChanged="Author1RadioButton_CheckedChanged" />
    <asp:RadioButton ID="Category1RadioButton" runat="server" AutoPostBack="True" GroupName="initial"
        Style="z-index: 104; left: 18px; position: absolute; top: 69px" Text="Category" OnCheckedChanged="Category1RadioButton_CheckedChanged" />
    <input id="Button1" style="z-index: 110; left: 502px; position: absolute; top: 11px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
    <asp:DropDownList ID="Select1DropDownList" runat="server" Style="z-index: 105; left: 210px;
        position: absolute; top: 68px" Width="367px" OnSelectedIndexChanged="select1DropDownList_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="displayLabel" runat="server" Style="z-index: 106; left: 210px; position: absolute;
        top: 46px"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 107;
        left: 518px; position: absolute; top: -49px" Text="Back" CausesValidation="False" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Style="z-index: 108; left: 210px; position: absolute;
        top: 106px" Text="Select Number of Books to Add to Cart by default 1" Width="322px"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" 
        Style="z-index: 109; left: 210px; position: absolute; top: 138px" Width="80px">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Label ID="SuccessLabel" runat="server" Style="z-index: 110; left: 21px; position: absolute;
        top: 172px" Width="305px" Height="33px"></asp:Label>
    &nbsp;&nbsp;<br />
    <br />
    <br />
    <asp:Button ID="AddToCartButton" runat="server" Height="33px" OnClick="AddToCartButton_Click"
        Style="z-index: 111; left: 345px; position: absolute; top: 160px" Text="Add To Cart"
        Width="84px" />
    <br />
    <br />
    <asp:Button ID="ViewCartButton" runat="server" Height="33px" OnClick="ViewCartButton_Click"
        Style="z-index: 112; left: 460px; position: absolute; top: 160px" Text="View Cart"
        Width="84px" />
    &nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList2" runat="server" Style="z-index: 113; left: 22px;
        position: absolute; top: 137px" Width="81px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px"
        Style="z-index: 114; left: -146px; position: absolute; top: 344px" Width="123px">
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
        Style="z-index: 115; left: -96px; position: absolute; top: 231px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 116; left: -131px; position: absolute; top: 319px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 117; left: -144px; position: absolute; top: 273px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 118; left: -113px; position: absolute; top: 250px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2"
        Style="z-index: 119; left: -130px; position: absolute; top: 296px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 120;
        left: -103px; position: absolute; top: 207px">View Cart</asp:HyperLink>
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
        <asp:Button ID="GoButton" runat="server" CausesValidation="False" OnClick="GoButton_Click"
            Style="z-index: 106; left: 18px; position: absolute; top: 211px" Text="Go...Search"
            Width="108px" />
        <br />
        &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search &nbsp;
        </span></strong>
    </div>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Label ID="Label" runat="server" Style="z-index: 122; left: 22px; position: absolute;
        top: 103px" Text="Select the Book id"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

