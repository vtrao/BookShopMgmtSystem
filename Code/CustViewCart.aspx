<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    int numberofcopies = 0;
    int bookid = 0;
    int numberofcopiesinbooksavailable = 0;
    float costis = 0.0f;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int something = 0;
        if (IsPostBack == false)
        {
            TitleRadioButton.Checked = true; 
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                con.Open();
                System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [noc],[UserName],[Status] FROM [Custcart] WHERE [Status]=1", con);
                System.Data.DataSet dt = new System.Data.DataSet();
                adapter.Fill(dt, "CustCart");
                for (int i = 0; i < dt.Tables["CustCart"].Rows.Count; i++)
                {
                    if (Session["username"].ToString().Equals(dt.Tables["CustCart"].Rows[i]["UserName"].ToString())
                        && dt.Tables["CustCart"].Rows[i]["Status"].ToString().Equals("1")) // if not already billed
                    {
                        numberofcopies = int.Parse(dt.Tables["CustCart"].Rows[i]["noc"].ToString());
                        something=1;
                    }
                }
                con.Close();
                for (int i = 0; i <= numberofcopies; i++)
                    nocDropDownList.Items.Add(i.ToString());
            if(something==0)
            {
                Label5.Text = " Cart is Empty Select Books to Purchase Go to View Books and Add them to cart to purchase";
                Button1.Enabled = false;
                Button2.Enabled = false;
                gotoviewbooksButton.Visible = true;
                nocDropDownList.Enabled = false;
                BookIDDropDownList.Enabled = false;
                Button1.Enabled = false;
            }
            
        }
    }

    protected void BookIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        nocDropDownList.Items.Clear();
        getNumberofCopiesofCustCart();
        for (int i = 0; i <= numberofcopies; i++)
            nocDropDownList.Items.Add(i.ToString()); 
    }
    
    void getNumberofCopiesofCustCart() // sets numberofcopies in custcart
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [BookID],[noc],[UserName],[Total Cost] FROM [Custcart] WHERE [Status]=1", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "CustCart");
        for (int i = 0; i < dt.Tables["CustCart"].Rows.Count; i++)
        {
            bookid = int.Parse(dt.Tables["CustCart"].Rows[i]["BookID"].ToString());
            if (bookid == int.Parse(BookIDDropDownList.SelectedValue.ToString())
               && dt.Tables["CustCart"].Rows[i]["UserName"].ToString().Equals(Session["username"].ToString()))
            {
                numberofcopies = int.Parse(dt.Tables["CustCart"].Rows[i]["noc"].ToString());
                costis = float.Parse(dt.Tables["CustCart"].Rows[i]["Total Cost"].ToString()); 
            }
        }
        con.Close();
    }

    void getNumberofCopiesofBooksAvailable() // sets numberofcopiesinbooksavailable
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [BookID],[Number of Copies] FROM [BooksAvailable] WHERE [Number of Copies]<>0", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
        {
            bookid = int.Parse(dt.Tables["BooksAvailable"].Rows[i]["BookID"].ToString());
            if (bookid == int.Parse(BookIDDropDownList.SelectedValue.ToString()))
                numberofcopiesinbooksavailable = int.Parse(dt.Tables["BooksAvailable"].Rows[i]["Number of Copies"].ToString());
        }
        con.Close();
    }
    
    protected void Button2_Click(object sender, EventArgs e) // update cart button
    {
        getNumberofCopiesofCustCart(); 
        getNumberofCopiesofBooksAvailable();
        int selectedbookID = int.Parse(BookIDDropDownList.SelectedValue.ToString());
        int selectedcopies = int.Parse(nocDropDownList.SelectedValue.ToString());
        int addcopies1 = numberofcopies - selectedcopies + numberofcopiesinbooksavailable;
        float currentcost = 0.0f;
        currentcost = (costis / numberofcopies) * selectedcopies; 
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        if (selectedcopies == 0)
        {
                test.DeleteCommand = "DELETE FROM [CustCart] WHERE ([BookID] = (@bookid) AND [UserName] = (@username) AND [Status]=1)";
                test.DeleteParameters.Add("bookid", selectedbookID.ToString());
                test.DeleteParameters.Add("username", Session["username"].ToString());               
                test.Delete();
            // remove the row from custcart
            // add back all the books to books available            
        }
        else
        {
            test.UpdateCommand = "UPDATE [CustCart] SET [noc]=(@ncp1), [Total Cost]=(@toc) WHERE ([BookID]= (@bookid1) AND [UserName] = (@un)) AND [Status]=1";
            test.UpdateParameters.Add("ncp1",selectedcopies.ToString());
            test.UpdateParameters.Add("toc",currentcost.ToString());
            test.UpdateParameters.Add("un", Session["username"].ToString());
            test.UpdateParameters.Add("bookid1", selectedbookID.ToString());
            test.Update();
            // add back the Books 
        }
        test.UpdateCommand = "UPDATE [BooksAvailable] SET [Number of Copies]=(@ncp) WHERE ([BookID]= @bookid2)";
        test.UpdateParameters.Add("ncp", addcopies1.ToString());
        test.UpdateParameters.Add("bookid2", selectedbookID.ToString());
        test.Update();
        
        Server.Transfer("CustViewCart.aspx");
    }

    protected void gotoviewbooksButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustViewBooks.aspx");
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerBill.aspx");
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

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button3_onclick() {
myWin= open("Helpbutton.aspx?help=22", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 4px; width: 409px; position: absolute; top: 3px;
        height: 235px">
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 222px; position: absolute;
            top: 4px" Text="Contents of the Cart"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="3" DataSourceID="SqlDataSource1"
            PageSize="5" Style="z-index: 102; left: 2px; position: absolute; top: 35px" Width="591px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" SortExpression="Book_Name" />
                <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" />
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                <asp:BoundField DataField="noc" HeaderText="Number Of Copies" SortExpression="noc" />
                <asp:BoundField DataField="Total_Cost" HeaderText="Total_Cost" SortExpression="Total_Cost" />
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Book Name] AS Book_Name, [Publisher], [noc], [Total Cost] AS Total_Cost, [BookID] FROM [CustCart] WHERE (([UserName] = @UserName) AND ([Status] = @Status))">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="username" Type="String" />
                <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px"
        Style="z-index: 100; left: -148px; position: absolute; top: 360px" Width="123px">
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
        Style="z-index: 101; left: -100px; position: absolute; top: 241px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 102; left: -133px; position: absolute; top: 333px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 103; left: -146px; position: absolute; top: 287px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 104; left: -117px; position: absolute; top: 264px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2"
        Style="z-index: 105; left: -132px; position: absolute; top: 310px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 106; left: -115px; position: absolute; top: 218px">View Books</asp:HyperLink>
    <div style="z-index: 109; left: -154px; width: 171px; position: absolute; top: -50px;
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
    &nbsp;<br />
    <asp:Label ID="Label2" runat="server" Style="z-index: 108; left: 9px; position: absolute;
        top: 225px" Text="Select Book ID to Reduce the Number of Copies to Purchase "
        Width="379px"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Height="31px" Style="z-index: 109; left: 243px;
        position: absolute; top: 380px" Text="Continue With Billing" Width="155px" OnClick="Button1_Click" />
    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 110;
        left: 506px; position: absolute; top: -25px" Text="Back" CausesValidation="False" />
    <br />
    <asp:DropDownList ID="BookIDDropDownList" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="BookID" DataValueField="BookID" OnSelectedIndexChanged="BookIDDropDownList_SelectedIndexChanged"
        Style="z-index: 111; left: 44px; position: absolute; top: 257px" AutoPostBack="True">
    </asp:DropDownList>
    <asp:DropDownList ID="nocDropDownList" runat="server" Style="z-index: 112; left: 44px;
        position: absolute; top: 333px">
    </asp:DropDownList>
    &nbsp;
    <asp:Label ID="Label3" runat="server" Style="z-index: 113; left: 9px; position: absolute;
        top: 300px" Text="Modify the Number of Copies to Purchase "></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Height="31px" Style="z-index: 114; left: 40px;
        position: absolute; top: 380px" Text="Update Cart" Width="80px" OnClick="Button2_Click" />
    <asp:Label ID="Label4" runat="server" Style="z-index: 115; left: 138px; position: absolute;
        top: 334px" Text="To remove Item from Cart Select 0 here and Update" Width="321px"></asp:Label>
    <br />
    <br />
    <input id="Button3" style="z-index: 110; left: 502px; position: absolute; top: 7px"
        type="button" value="Help" language="javascript" onclick="return Button3_onclick()" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Height="70px" Style="z-index: 116; left: 149px;
        position: absolute; top: 44px" Width="285px"></asp:Label>
    <br />
    <asp:Button ID="gotoviewbooksButton" runat="server" OnClick="gotoviewbooksButton_Click"
        Style="z-index: 117; left: 198px; position: absolute; top: 136px" Text="Go To View Books"
        Visible="False" Height="41px" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

