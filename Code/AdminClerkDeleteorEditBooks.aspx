<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void GoBack_Click(object sender, EventArgs e)
    {
        if (Session["username"].ToString().Equals("administrator"))
            Server.Transfer("AdministratorHomePage.aspx");
        else
            Server.Transfer("ClerkHomePage.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].Equals("administrator"))
        {
            Menu2.Visible = false;
        }
        else
        {
            Menu1.Visible = false;
            HyperLink10.Visible = false;
            HyperLink7.Visible = false;
            HyperLink8.Visible = false;
        }
        if (IsPostBack == false)
        {
            fillbooksnamemenu();
            getandfilldata();
        }
    }
    
    void fillbooksnamemenu()
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Title] FROM [BooksAvailable]", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        DropDownList1.Items.Clear();
        for (int i = 0; i < dt.Tables["BooksAvailable"].Rows.Count; i++)
            DropDownList1.Items.Add(dt.Tables["BooksAvailable"].Rows[i]["Title"].ToString());
    }  

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        test.UpdateCommand = "UPDATE [BooksAvailable] SET [Title]=(@fname1),[Author]=(@mname1),[Edition]=(@lname1),[Price]=(@al1),[Number of Copies]=(@al2),[Category]=(@pnr),[Discount]=(@pno),[Author2]=(@mon),[Author3]=(@fn),[ISBN]=(@emid),[Publisher]=(@aemid),[Rating]=(@dob1),[RatedUserCount]=(@pc) WHERE ([Title]=(@uname))";
        test.UpdateParameters.Add("uname", DropDownList1.SelectedValue.ToString());
        test.UpdateParameters.Add("fname1", BookNameTextBox.Text);
        test.UpdateParameters.Add("mname1", AuthorTextBox.Text);
        test.UpdateParameters.Add("lname1", EditionTextBox.Text);
        test.UpdateParameters.Add("al1", PriceTextBox.Text);
        test.UpdateParameters.Add("al2", CopiesTextBox.Text);
        test.UpdateParameters.Add("pnr", CategoryTextBox.Text);
        test.UpdateParameters.Add("pno", DiscountTextBox.Text);
        test.UpdateParameters.Add("mon", Author2TextBox.Text);
        test.UpdateParameters.Add("fn", Author3TextBox.Text);
        test.UpdateParameters.Add("emid", ISBNTextBox.Text);
        test.UpdateParameters.Add("aemid", PublisherTextBox.Text);
        test.UpdateParameters.Add("dob1", RatingTextBox.Text);
        test.UpdateParameters.Add("pc", RatedUserCountTextBox.Text);        
        test.Update();
        getandfilldata();
        successorfailurelabel.Text = "Successfully Updated";
    }

    protected void ResetButton_Click(object sender, EventArgs e)//delete button
    {
        successorfailurelabel.Text = "";
        if (int.Parse(CopiesTextBox.Text) != 0)
        {
            ContinueButton.Visible = true;
            Label17.Visible = true;
            noButton.Visible = true;
        }
        else
        {
            deletedata();
        }
    }

    void deletedata()
    {
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        test.DeleteCommand = "DELETE FROM [BooksAvailable] WHERE [BookID]= (@bookid)";
        test.DeleteParameters.Add("bookid", DummyLabel17.Text);
        test.Delete();
        fillbooksnamemenu();
        getandfilldata();
        successorfailurelabel.Text = "Successfully Deleted";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        getandfilldata();
        successorfailurelabel.Text = "";
        ContinueButton.Visible = false;
        Label17.Visible = false;
        noButton.Visible = false;
    }
    void getandfilldata()
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM [BooksAvailable] WHERE [Title] = '"+DropDownList1.SelectedValue.ToString()+"'",con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        if(dt.Tables["BooksAvailable"].Rows.Count!=0)
        {
            DummyLabel17.Text = dt.Tables["BooksAvailable"].Rows[0]["BookID"].ToString();
            BookNameTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Title"].ToString();
            AuthorTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Author"].ToString();
            EditionTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Edition"].ToString();
            PriceTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Price"].ToString();
            CopiesTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Number of Copies"].ToString();
            CategoryTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Category"].ToString();
            DiscountTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Discount"].ToString();
            Author2TextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Author2"].ToString();
            Author3TextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Author3"].ToString();
            ISBNTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["ISBN"].ToString();
            PublisherTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Publisher"].ToString();
            RatingTextBox.Text = dt.Tables["BooksAvailable"].Rows[0]["Rating"].ToString();
            RatedUserCountTextBox.Text=dt.Tables["BooksAvailable"].Rows[0]["RatedUserCount"].ToString();
        }
    }

    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        deletedata();
        ContinueButton.Visible = false;
        Label17.Visible = false;
        noButton.Visible = false;
    }

    protected void noButton_Click(object sender, EventArgs e)
    {
        ContinueButton.Visible = false;
        Label17.Visible = false;
        noButton.Visible = false;
        successorfailurelabel.Text = "";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=7", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 100;
        left: 563px; position: absolute; top: -53px" Text="Back" CausesValidation="False" />
    <br />
    &nbsp;
    <div style="z-index: 109; left: 599px; width: 168px; position: absolute; top: -37px;
        height: 411px">
        &nbsp; &nbsp; &nbsp;&nbsp;
    </div>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 101;
        left: 94px; position: absolute; top: -52px" Text="Delete/Edit Books page" Width="186px"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Style="z-index: 102; left: 23px;
        position: absolute; top: 16px" Width="252px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp; &nbsp;&nbsp;&nbsp;<br />
    &nbsp;
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; 
    <div style="z-index: 110; left: 10px; width: 504px; position: absolute; top: 36px;
        height: 1px">
        &nbsp;
        <asp:Label ID="Label7" runat="server" Height="17px" Style="z-index: 100; left: 21px;
            position: absolute; top: 56px" Text="Book Name" Width="91px"></asp:Label>
        <asp:Label ID="Label8" runat="server" Height="19px" Style="z-index: 101; left: 21px;
            position: absolute; top: 87px" Text="Author" Width="83px"></asp:Label>
        <asp:Label ID="Label9" runat="server" Height="19px" Style="z-index: 102; left: 21px;
            position: absolute; top: 118px" Text="Category" Width="101px"></asp:Label>
        <asp:Label ID="Label10" runat="server" Height="19px" Style="z-index: 103; left: 21px;
            position: absolute; top: 180px" Text="Edition"></asp:Label>
        <asp:Label ID="Label11" runat="server" Height="19px" Style="z-index: 104; left: 21px;
            position: absolute; top: 149px" Text="ISBN" Width="95px"></asp:Label>
        <asp:Label ID="Label12" runat="server" Height="19px" Style="z-index: 105; left: 21px;
            position: absolute; top: 242px" Text="Price"></asp:Label>
        <asp:Label ID="Label13" runat="server" Height="19px" Style="z-index: 106; left: 21px;
            position: absolute; top: 211px" Text="Copies"></asp:Label>
        <asp:Label ID="Label14" runat="server" Style="z-index: 107; left: 21px; position: absolute;
            top: 273px" Text="Discount"></asp:Label>
        <asp:TextBox ID="BookNameTextBox" runat="server" Height="16px" Style="z-index: 108;
            left: 134px; position: absolute; top: 54px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="CategoryTextBox" runat="server" Height="16px" Style="z-index: 109;
            left: 134px; position: absolute; top: 116px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="AuthorTextBox" runat="server" Height="16px" Style="z-index: 110;
            left: 134px; position: absolute; top: 85px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="EditionTextBox" runat="server" Height="16px" Style="z-index: 111;
            left: 134px; position: absolute; top: 178px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="CopiesTextBox" runat="server" Height="16px" Style="z-index: 112;
            left: 134px; position: absolute; top: 209px" Width="48px"></asp:TextBox>
        <asp:TextBox ID="PriceTextBox" runat="server" Height="16px" Style="z-index: 113;
            left: 134px; position: absolute; top: 239px" Width="60px"></asp:TextBox>
        &nbsp;
        <asp:TextBox ID="DiscountTextBox" runat="server" Height="16px" Style="z-index: 114;
            left: 134px; position: absolute; top: 271px" Width="72px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="UpdateButton" runat="server" Height="41px" OnClick="SaveButton_Click"
            Style="z-index: 115; left: 78px; position: absolute; top: 495px" Text="Update"
            Width="87px" />
        <asp:Button ID="DeleteButton" runat="server" Height="41px" OnClick="ResetButton_Click"
            Style="z-index: 116; left: 225px; position: absolute; top: 495px" Text="Delete"
            Width="87px" CausesValidation="False" />
        &nbsp;&nbsp;
        <asp:TextBox ID="PublisherTextBox" runat="server" Height="16px" Style="z-index: 117;
            left: 134px; position: absolute; top: 302px" Width="172px"></asp:TextBox>
        <asp:Label ID="Label16" runat="server" Style="z-index: 118; left: 21px; position: absolute;
            top: 304px" Text="Publisher"></asp:Label>
        <asp:TextBox ID="ISBNTextBox" runat="server" Height="16px" Style="z-index: 119; left: 134px;
            position: absolute; top: 147px" Width="172px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 120; left: 21px; position: absolute;
            top: 335px" Text="Author 2"></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 121; left: 21px; position: absolute;
            top: 366px" Text="Author 3"></asp:Label>
        <asp:TextBox ID="Author3TextBox" runat="server" Height="16px" Style="z-index: 122;
            left: 134px; position: absolute; top: 364px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="Author2TextBox" runat="server" Height="16px" Style="z-index: 123;
            left: 134px; position: absolute; top: 333px" Width="172px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="noButton" runat="server" CausesValidation="False" Height="24px" OnClick="noButton_Click"
            Style="z-index: 124; left: 470px; position: absolute; top: 395px" Text="Cancel"
            Visible="False" Width="100px" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <input id="Button1" style="z-index: 149; left: 478px; position: absolute; top: -8px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="DummyLabel17" runat="server" Style="z-index: 126; left: 431px; position: absolute;
            top: 21px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
        <asp:Label ID="Label6" runat="server" Style="z-index: 127; left: 12px; position: absolute;
            top: -54px" Text="Select the Title of the Books Available "></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BookNameTextBox"
            ErrorMessage="Title Required" Style="z-index: 128; left: 320px; position: absolute;
            top: 56px"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AuthorTextBox"
            ErrorMessage="Author Name Required" Style="z-index: 129; left: 320px; position: absolute;
            top: 87px" Width="142px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CategoryTextBox"
            ErrorMessage="Cagtegory Required" Style="z-index: 130; left: 320px; position: absolute;
            top: 118px" Width="123px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ISBNTextBox"
            ErrorMessage="ISBN Required" Style="z-index: 131; left: 320px; position: absolute;
            top: 149px" Width="95px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EditionTextBox"
            ErrorMessage="Edition Required" Style="z-index: 132; left: 320px; position: absolute;
            top: 180px" Width="101px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="CopiesTextBox"
            ErrorMessage="Copies Required" Style="z-index: 133; left: 388px; position: absolute;
            top: 214px" Width="103px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="PriceTextBox"
            ErrorMessage="Price Required" Style="z-index: 134; left: 387px; position: absolute;
            top: 244px" Width="90px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DiscountTextBox"
            ErrorMessage="Discount Required" Style="z-index: 135; left: 323px; position: absolute;
            top: 274px" Width="112px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="PublisherTextBox"
            ErrorMessage="Publisher Required" Style="z-index: 136; left: 322px; position: absolute;
            top: 304px" Width="115px"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="PriceRangeValidator1" runat="server" ControlToValidate="PriceTextBox"
            ErrorMessage="Price Must be +ve Number" MaximumValue="20000" MinimumValue="1"
            Style="z-index: 137; left: 206px; position: absolute; top: 242px" Type="Double"
            Width="170px"></asp:RangeValidator>
        &nbsp;
        <asp:RangeValidator ID="DiscountRangeValidator1" runat="server" ControlToValidate="DiscountTextBox"
            ErrorMessage="Discount Cant be -ve" Height="1px" MaximumValue="12000" MinimumValue="0"
            Style="z-index: 138; left: 220px; position: absolute; top: 262px" Type="Double"
            Width="73px"></asp:RangeValidator>
        <asp:CompareValidator ID="DiscountCompareValidator1" runat="server" ControlToCompare="PriceTextBox"
            ControlToValidate="DiscountTextBox" ErrorMessage="Discount Cant be More than Price"
            Operator="LessThan" Style="z-index: 139; left: 448px; position: absolute; top: 263px"
            Width="112px"></asp:CompareValidator>
        &nbsp;&nbsp;
        <asp:Label ID="Label15" runat="server" Style="z-index: 140; left: 117px; position: absolute;
            top: 21px" Text="Details of Selected Book " Width="136px"></asp:Label>
        <asp:RangeValidator ID="CopiesRangeValidator1" runat="server" ControlToValidate="CopiesTextBox"
            ErrorMessage="Copies Must be +ve Numbers" MaximumValue="15000" MinimumValue="1"
            Style="z-index: 141; left: 195px; position: absolute; top: 212px" Type="Integer"
            Width="187px"></asp:RangeValidator>
        <asp:Button ID="ContinueButton" runat="server" Style="z-index: 142; left: 352px; position: absolute;
            top: 395px" Text="Continue..." Visible="False" OnClick="ContinueButton_Click" CausesValidation="False" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Label ID="Label17" runat="server" Style="z-index: 143; left: 351px; position: absolute;
            top: 330px" Text="Still the Stock of  the Book Persists, Deleting this book may create problems make sure before deleting Do U want to Continue..........."
            Width="201px" Visible="False" ForeColor="Red"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="RatingTextBox" runat="server" Style="z-index: 144; left: 134px;
            position: absolute; top: 400px" Width="41px">2</asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Style="z-index: 145; left: 21px; position: absolute;
            top: 399px" Text="Rating"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RatingTextBox"
            ErrorMessage="Required" Style="z-index: 146; left: 188px; position: absolute;
            top: 403px"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="RatingTextBox"
            ErrorMessage="1 to 4" MaximumValue="4" MinimumValue="1" Style="z-index: 147;
            left: 251px; position: absolute; top: 403px"></asp:RangeValidator>
        <asp:Label ID="successorfailurelabel" runat="server" Height="114px" Style="z-index: 148;
            left: 344px; position: absolute; top: 431px" Width="240px"></asp:Label>
    </div>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Menu ID="Menu2" runat="server" Style="z-index: 103; left: -126px; position: absolute;
        top: 109px">
        <Items>
            <asp:MenuItem Text="Clerk Features" Value="Clerk Features">
                <asp:MenuItem NavigateUrl="~/AdminClerkAddBooks.aspx" Text="Add Books" Value="Add Books">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change password" Value="Change password">
                </asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    <br />
    <asp:Menu ID="Menu1" runat="server" Height="14px" Style="z-index: 104; left: -145px;
        position: absolute; top: 110px">
        <DynamicItemTemplate>
                <%# Eval("Text") %>
        </DynamicItemTemplate>
        <Items>
            <asp:MenuItem Text="Administrator Features" Value="Administrator Features">
                <asp:MenuItem NavigateUrl="~/AdminClerkAddBooks.aspx" Text="Add Book" Value="Add Book">
                </asp:MenuItem>
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
    <asp:HyperLink ID="HyperLink2" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 105; left: -123px; position: absolute; top: 87px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" Height="14px" NavigateUrl="~/AdminReportGenerationA.aspx"
        Style="z-index: 106; left: -124px; position: absolute; top: 41px">Report Generation</asp:HyperLink>
    <asp:HyperLink ID="HyperLink8" runat="server" Height="14px" NavigateUrl="~/AdminChangeBookShopName.aspx"
        Style="z-index: 107; left: -158px; position: absolute; top: 64px" Width="184px">Change Book Shop Name</asp:HyperLink>
    <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
        Style="z-index: 108; left: -99px; position: absolute; top: -5px">Add Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 109; left: -108px; position: absolute; top: 18px">Generate Bill</asp:HyperLink>
    &nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Style="z-index: 110; left: 32px; position: absolute;
        top: 475px" Text="Rated User Count"></asp:Label>
    <br />
    <asp:TextBox ID="RatedUserCountTextBox" runat="server" Style="z-index: 112; left: 145px; position: absolute;
        top: 475px"></asp:TextBox>
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

