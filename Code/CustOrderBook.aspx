<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
            TitleRadioButton.Visible = true;
    }

    protected void notinbookstoreRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        //Profile.MyNewProperty = "2";
        avaLabel.Visible = false;
        suggLabel.Visible = false;
        inbookstoreRadioButton.Visible = false;
        notinbookstoreRadioButton.Visible = false;
        BookNameTextBox.ReadOnly = false;
        BookNameTextBox.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true; 
        Label5.Text = "Number of Copies";
        AuthorTextBox.ReadOnly = false;
        AuthorTextBox.Visible = true;
        PublisherTextBox.ReadOnly = false;
        PublisherTextBox.Visible = true;
        EditionTextBox.Visible = true;
        EditionTextBox.ReadOnly = false;   // using edition text box as number of copies
        RequiredFieldValidator1.Visible = false;
        RequiredFieldValidator1.Enabled = false;
        oButton.Visible = true;
        edRequiredFieldValidator2.Visible = true;
        edRequiredFieldValidator2.Enabled = true;
    }

    protected void inbookstoreRadioButton_CheckedChanged(object sender, EventArgs e)
    {
      //  Profile.MyNewProperty = "1"; 
        avaLabel.Visible = false;
        suggLabel.Visible = false;
        inbookstoreRadioButton.Visible = false;
        notinbookstoreRadioButton.Visible = false;
        orderButton.Visible = true;
        //continueButton.Visible = true;
        BookIDDropDownList.Visible = true;
        Label8.Visible = true;        
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        Label1.Visible = true;
        CostTextBox.Visible = true;
        BookNameTextBox.Visible=true;
        AuthorTextBox.Visible=true;
        PublisherTextBox.Visible=true;
        EditionTextBox.Visible = true;
        nocTextBox.Visible = true;
        RequiredFieldValidator1.Visible = true;
        RequiredFieldValidator1.Enabled = true;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query = "SELECT [BookID] FROM BooksAvailable ";
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
        {
            BookIDDropDownList.Items.Add(dt.Tables["BooksAvailable"].Rows[i]["BookID"].ToString());
        }
        con.Close();
        filldata();
    }

    protected void BookIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        filldata();     
    }
    void filldata()
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Title],[Publisher],[Author],[Edition],[Price] FROM [BooksAvailable] WHERE [BookID] = '" + BookIDDropDownList.SelectedValue.ToString() + "'", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        BookNameTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Title"].ToString();
        AuthorTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Author"].ToString();
        PublisherTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Publisher"].ToString();
        EditionTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Edition"].ToString();
        CostTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Price"].ToString();
        con.Close(); 
    }

   protected void orderButton_Click(object sender, EventArgs e)
    {
        String uname;
        if (Session["username"] == null)
            Server.Transfer("sessionexpired.aspx");
        String orderid = Session["username"].ToString() + DateTime.Now.ToString();
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        test.InsertCommand = "INSERT INTO [Orders] ([OrderID],[BookID],[BookName],[Publisher],[Author],[Cost],[noc],[Type],[UserName]) VALUES (@oid,@bid,@bn,@p,@a,@co,@noc1,@ty,@unn)";
        test.InsertParameters.Add("oid", orderid);
        test.InsertParameters.Add("bid", BookIDDropDownList.SelectedValue.ToString());
        test.InsertParameters.Add("bn", BookNameTextBox.Text);
        test.InsertParameters.Add("p", PublisherTextBox.Text);
        test.InsertParameters.Add("a", AuthorTextBox.Text);
        test.InsertParameters.Add("co", CostTextBox.Text);
        test.InsertParameters.Add("noc1", nocTextBox.Text);
        test.InsertParameters.Add("unn", Session["username"].ToString());     
        test.InsertParameters.Add("ty", "Av"); // AV means Available NAv means New                       
        test.Insert();
        orderButton.Visible = false;        
        BookIDDropDownList.Visible = false;
        Label8.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        Label1.Visible = false;
        CostTextBox.Visible = false;
        BookNameTextBox.Visible = false;
        AuthorTextBox.Visible = false;
        PublisherTextBox.Visible = false;
        EditionTextBox.Visible = false;
        nocTextBox.Visible = false;
        RequiredFieldValidator1.Visible = false;
        RequiredFieldValidator1.Enabled = false;
        continueButton.Visible = true;
        Button1.Visible = true;
        finalMessageLabel.Visible = true;
        finalMessageLabel.Text = "Your TransactionID is "+orderid +" We will be back to U soon For Further Details Contact: admin@UBP.com";
    }

    protected void continueButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustOrderBook.aspx");
    }

    protected void oButton_Click(object sender, EventArgs e)
    {
        if ((BookNameTextBox.Text.Equals("") || BookNameTextBox.Text.Equals(" "))
           && (AuthorTextBox.Text.Equals("") || AuthorTextBox.Text.Equals(" ")))
        {
            Label6.Text = " Atleast one of Book name and Author fields need to be filled";
            Label6.Visible = true;
        }
        else
        {
            Label6.Visible = false;
            String uname;
            if (Session["username"] == null)
                Server.Transfer("sessionexpired.aspx");
            String orderid = Session["username"].ToString() + DateTime.Now.ToString();
            SqlDataSource test = new SqlDataSource();
            test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            test.InsertCommand = "INSERT INTO [Orders] ([OrderID],[BookName],[Publisher],[Author],[noc],[Type],[UserName]) VALUES (@oid,@bn,@p,@a,@noc1,@ty,@unn)";
            test.InsertParameters.Add("oid", orderid);
            test.InsertParameters.Add("bn", BookNameTextBox.Text);
            test.InsertParameters.Add("p", PublisherTextBox.Text);
            test.InsertParameters.Add("a", AuthorTextBox.Text);
            test.InsertParameters.Add("noc1", EditionTextBox.Text);
            test.InsertParameters.Add("unn", Session["username"].ToString());
            test.InsertParameters.Add("ty", "NAv"); // AV means Available NW means New        
            test.Insert();
            continueButton.Visible = true;
            Button1.Visible = true;
            BookNameTextBox.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            AuthorTextBox.Visible = false;
            PublisherTextBox.Visible = false;
            EditionTextBox.Visible = true; // using edition text box as number of copies
            edRequiredFieldValidator2.Visible = false;
            edRequiredFieldValidator2.Enabled = false;
            oButton.Visible = false;
            EditionTextBox.Visible = false;
            finalMessageLabel.Visible = true;
            finalMessageLabel.Text = "Your TransactionID is " + orderid + " We will be back to U soon For Further Details Contact: admin@UBP.com";
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button2_onclick() {
myWin= open("Helpbutton.aspx?help=17", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 6px; width: 405px; position: absolute; top: -50px;
        height: 460px">
        &nbsp;
        <asp:Label ID="Label2" runat="server" Style="z-index: 100; left: 60px; position: absolute;
            top: 95px" Text="Book Name" Visible="False"></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 101; left: 60px; position: absolute;
            top: 146px" Text="Author" Visible="False"></asp:Label>
        <asp:Label ID="Label4" runat="server" Style="z-index: 102; left: 60px; position: absolute;
            top: 197px" Text="Publisher" Visible="False"></asp:Label>
        <asp:Label ID="Label5" runat="server" Style="z-index: 103; left: 60px; position: absolute;
            top: 248px" Text="Edition" Visible="False"></asp:Label>
        <asp:Label ID="Label6" runat="server" Style="z-index: 104; left: 65px; position: absolute;
            top: 351px" Text="Number of Copies" Visible="False" Width="121px"></asp:Label>
        <asp:TextBox ID="BookNameTextBox" runat="server" Height="15px" Style="z-index: 105; left: 211px;
            position: absolute; top: 93px" Width="312px" ReadOnly="True" Visible="False"></asp:TextBox>
        <asp:TextBox ID="AuthorTextBox" runat="server" Height="14px" Style="z-index: 106; left: 211px;
            position: absolute; top: 145px" Width="220px" ReadOnly="True" Visible="False"></asp:TextBox>
        <asp:TextBox ID="PublisherTextBox" runat="server" Height="14px" Style="z-index: 107; left: 211px;
            position: absolute; top: 197px" Width="181px" ReadOnly="True" Visible="False"></asp:TextBox>
        &nbsp;
        <asp:TextBox ID="nocTextBox" runat="server" Height="15px" Style="z-index: 108; left: 216px;
            position: absolute; top: 349px" Width="39px" Visible="False"></asp:TextBox>
        <asp:Button ID="orderButton" runat="server" Height="39px" Style="z-index: 109; left: 176px;
            position: absolute; top: 412px" Text="Order" Width="71px" Visible="False" OnClick="orderButton_Click" />
        <asp:Button ID="continueButton" runat="server" Height="39px" Style="z-index: 110; left: 128px;
            position: absolute; top: 211px" Text="Continue... with another Order" Width="186px" Visible="False" OnClick="continueButton_Click" />
        <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 111;
            left: 557px; position: absolute; top: 0px" Text="Back" CausesValidation="False" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Number Required"
            Style="z-index: 112; left: 272px; position: absolute; top: 351px" Visible="False" ControlToValidate="nocTextBox" Enabled="False"></asp:RequiredFieldValidator>
        <asp:TextBox ID="EditionTextBox" runat="server" Height="13px" ReadOnly="True" Style="z-index: 113;
            left: 211px; position: absolute; top: 249px" Width="91px" Visible="False"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Height="18px" Style="z-index: 114; left: 60px;
            position: absolute; top: 54px" Text="Select BookID" Width="92px" Visible="False"></asp:Label>
        <asp:DropDownList ID="BookIDDropDownList" runat="server" Style="z-index: 115; left: 211px;
            position: absolute; top: 50px" Width="53px" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="BookIDDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:RadioButton ID="notinbookstoreRadioButton" runat="server" AutoPostBack="True"
            GroupName="order" OnCheckedChanged="notinbookstoreRadioButton_CheckedChanged"
            Style="z-index: 116; left: 151px; position: absolute; top: 181px" Text="Not Available" />
        <asp:RadioButton ID="inbookstoreRadioButton" runat="server" AutoPostBack="True" GroupName="order"
            Style="z-index: 117; left: 151px; position: absolute; top: 151px" Text="In Book Store" OnCheckedChanged="inbookstoreRadioButton_CheckedChanged" />
        <asp:Label ID="suggLabel" runat="server" Height="26px" Style="z-index: 118; left: 279px;
            position: absolute; top: 159px" Text="not sure! search  using quick search tool, get the id of the book u want to order"></asp:Label>
        <asp:Label ID="avaLabel" runat="server" Style="z-index: 119; left: 92px; position: absolute;
            top: 122px" Text="Select the Availability of Book" Width="286px"></asp:Label>
        <asp:Label ID="Label1" runat="server" Style="z-index: 120; left: 63px; position: absolute;
            top: 301px" Text="Cost" Visible="False"></asp:Label>
        <asp:TextBox ID="CostTextBox" runat="server" Style="z-index: 121; left: 214px; position: absolute;
            top: 297px" Width="78px" ReadOnly="True" Visible="False" Height="12px"></asp:TextBox>
        <asp:Label ID="finalMessageLabel" runat="server" Height="67px" Style="z-index: 122; left: 68px;
            position: absolute; top: 126px" Visible="False" Width="279px"></asp:Label>
        <asp:Button ID="oButton" runat="server" Style="z-index: 123; left: 189px; position: absolute;
            top: 310px" Text="Order" Visible="False" OnClick="oButton_Click" />
        <asp:RequiredFieldValidator ID="edRequiredFieldValidator2" runat="server" ControlToValidate="EditionTextBox"
            Enabled="False" ErrorMessage="NumberRequired" Style="z-index: 124; left: 323px;
            position: absolute; top: 250px" Visible="False"></asp:RequiredFieldValidator>
        <input id="Button2" style="z-index: 125; left: 554px; position: absolute; top: 62px"
            type="button" value="Help" language="javascript" onclick="return Button2_onclick()" />
    </div>
    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 140px; position: absolute; top: -49px" Text="Order Book" Width="305px"></asp:Label>
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
        Style="z-index: 101; left: -146px; position: absolute; top: 334px" Width="123px">
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
        Style="z-index: 102; left: -96px; position: absolute; top: 235px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 103; left: -131px; position: absolute; top: 307px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 104; left: -144px; position: absolute; top: 283px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2"
        Style="z-index: 105; left: -130px; position: absolute; top: 259px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 106; left: -111px; position: absolute; top: 187px">View Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 107;
        left: -105px; position: absolute; top: 211px">View Cart</asp:HyperLink>
    <div style="z-index: 109; left: -152px; width: 171px; position: absolute; top: -53px;
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
    <br />
    <br />
    <br /><asp:Button ID="Button1" runat="server" OnClick="BackButton_Click" Style="z-index: 109;
            left: 200px; position: absolute; top: 227px" Text="Exit" CausesValidation="False" Visible="False" />
    <br />
    <br />
</asp:Content>

