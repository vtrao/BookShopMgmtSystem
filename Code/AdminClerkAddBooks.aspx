<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">
    
    protected void GoBack_Click(object sender, EventArgs e)
    {
        Label2.Text = "venki";
        if (Session["username"].ToString().Equals("administrator"))
            Server.Transfer("AdministratorHomePage.aspx");
        else
            Server.Transfer("ClerkHomePage.aspx");
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        int alreadyexists = 0;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM [BooksAvailable] WHERE [Title] = '" + BookNameTextBox.Text + "' OR [ISBN] = '" + ISBNTextBox.Text + "'", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "BooksAvailable");
        if (dt.Tables["BooksAvailable"].Rows.Count == 0)
            alreadyexists = 0;
        else
            alreadyexists = 1;
        con.Close();
        if (alreadyexists == 0)
        {
            SqlDataSource test = new SqlDataSource();
            test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            test.InsertCommand = "INSERT INTO [BooksAvailable] ([Title],[Author],[Edition],[Price],[Number of Copies],[Category],[Discount],[Author2],[Author3],[ISBN],[Publisher],[Rating]) VALUES (@title,@author,@edition,@price,@numberofcopies,@category,@discount,@author2,@author3,@isbn,@publisher,@rating)";
            test.InsertParameters.Add("title", BookNameTextBox.Text);
            test.InsertParameters.Add("author", AuthorTextBox.Text);
            test.InsertParameters.Add("edition", EditionTextBox.Text);
            test.InsertParameters.Add("price", PriceTextBox.Text);
            test.InsertParameters.Add("numberofcopies", CopiesTextBox.Text);
            test.InsertParameters.Add("category", CategoryTextBox.Text);
            test.InsertParameters.Add("discount", DiscountTextBox.Text);
            test.InsertParameters.Add("author2", Author2TextBox.Text);
            test.InsertParameters.Add("author3", Author3TextBox.Text);
            test.InsertParameters.Add("isbn", ISBNTextBox.Text);
            test.InsertParameters.Add("publisher", PublisherTextBox.Text);
            test.InsertParameters.Add("rating", RatingTextBox.Text);
            test.Insert();
            successorfailurelabel.Text = "Successful! the Specified book has been added to the Book Store and made available";
        }
        else
            successorfailurelabel.Text = "Sorry the Specified Book already exists,Update the book GoTo Edit/Delete Books";
    }
    protected void ResetButton_Click(object sender, EventArgs e)
    {
        BookNameTextBox.Text = " ";
        Author2TextBox.Text = " ";
        Author3TextBox.Text = " ";
        AuthorTextBox.Text = " ";
        CategoryTextBox.Text = " ";
        ISBNTextBox.Text = " ";
        EditionTextBox.Text = " ";
        CopiesTextBox.Text = " ";
        PriceTextBox.Text = " ";
        DiscountTextBox.Text = " ";
        PublisherTextBox.Text = " ";
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
            HyperLink8.Visible = false;
            HyperLink7.Visible = false;
        }
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=6", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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
    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <div style="z-index: 109; left: 599px; width: 168px; position: absolute; top: -36px;
        height: 411px">
        &nbsp; &nbsp;&nbsp;
    </div>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
    &nbsp;
    <div style="z-index: 110; left: 11px; width: 485px; position: absolute; top: 4px;
        height: 482px">
        <asp:Label ID="Label6" runat="server" Style="z-index: 100; left: 122px; position: absolute;
            top: 6px" Text="Add a Book" Width="79px"></asp:Label>
        <asp:Label ID="Label7" runat="server" Height="17px" Style="z-index: 101; left: 21px;
            position: absolute; top: 56px" Text="Book Name" Width="91px"></asp:Label>
        <asp:Label ID="Label8" runat="server" Height="19px" Style="z-index: 102; left: 21px;
            position: absolute; top: 87px" Text="Author" Width="83px"></asp:Label>
        <asp:Label ID="Label9" runat="server" Height="19px" Style="z-index: 103; left: 21px;
            position: absolute; top: 118px" Text="Category" Width="101px"></asp:Label>
        <asp:Label ID="Label10" runat="server" Height="19px" Style="z-index: 104; left: 21px;
            position: absolute; top: 180px" Text="Edition"></asp:Label>
        <asp:Label ID="Label11" runat="server" Height="19px" Style="z-index: 105; left: 21px;
            position: absolute; top: 149px" Text="ISBN" Width="95px"></asp:Label>
        <asp:Label ID="Label12" runat="server" Height="19px" Style="z-index: 106; left: 21px;
            position: absolute; top: 242px" Text="Price"></asp:Label>
        <asp:Label ID="Label13" runat="server" Height="19px" Style="z-index: 107; left: 21px;
            position: absolute; top: 211px" Text="Copies"></asp:Label>
        <asp:Label ID="Label14" runat="server" Style="z-index: 108; left: 21px; position: absolute;
            top: 273px" Text="Discount"></asp:Label>
        <asp:TextBox ID="BookNameTextBox" runat="server" Height="16px" Style="z-index: 109; left: 134px;
            position: absolute; top: 54px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="CategoryTextBox" runat="server" Height="16px" Style="z-index: 110;
            left: 134px; position: absolute; top: 116px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="AuthorTextBox" runat="server" Height="16px" Style="z-index: 111; left: 134px;
            position: absolute; top: 85px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="EditionTextBox" runat="server" Height="16px" Style="z-index: 112;
            left: 134px; position: absolute; top: 178px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="CopiesTextBox" runat="server" Height="16px" Style="z-index: 113;
            left: 134px; position: absolute; top: 209px" Width="48px"></asp:TextBox>
        <asp:TextBox ID="PriceTextBox" runat="server" Height="16px" Style="z-index: 114;
            left: 134px; position: absolute; top: 239px" Width="60px"></asp:TextBox>
        &nbsp;
        <asp:TextBox ID="DiscountTextBox" runat="server" Height="16px" Style="z-index: 115;
            left: 134px; position: absolute; top: 271px" Width="72px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="SaveButton" runat="server" Height="41px" OnClick="SaveButton_Click"
            Style="z-index: 116; left: 49px; position: absolute; top: 455px" Text="Save"
            Width="87px" />
        <asp:Button ID="ResetButton" runat="server" Height="41px" Style="z-index: 117; left: 199px;
            position: absolute; top: 455px" Text="Reset" Width="87px" OnClick="ResetButton_Click" />
        &nbsp;&nbsp;
        <asp:TextBox ID="PublisherTextBox" runat="server" Height="16px" Style="z-index: 118;
            left: 134px; position: absolute; top: 302px" Width="172px"></asp:TextBox>
        <asp:Label ID="Label16" runat="server" Style="z-index: 119; left: 21px; position: absolute;
            top: 304px" Text="Publisher"></asp:Label>
        <asp:TextBox ID="ISBNTextBox" runat="server" Height="16px" Style="z-index: 120; left: 134px;
            position: absolute; top: 147px" Width="172px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 121; left: 21px; position: absolute;
            top: 335px" Text="Author 2"></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 122; left: 21px; position: absolute;
            top: 366px" Text="Author 3"></asp:Label>
        <asp:TextBox ID="Author3TextBox" runat="server" Height="16px" Style="z-index: 123;
            left: 134px; position: absolute; top: 364px" Width="172px"></asp:TextBox>
        <asp:TextBox ID="Author2TextBox" runat="server" Height="16px" Style="z-index: 124;
            left: 134px; position: absolute; top: 333px" Width="172px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Style="z-index: 125; left: 409px; position: absolute;
            top: 20px" Text="Label"></asp:Label>
        <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 126;
            left: 437px; position: absolute; top: -32px" Text="Back"  CausesValidation= "false"/>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Menu ID="Menu2" runat="server" Style="z-index: 127; left: -142px; position: absolute;
            top: 103px">
            <Items>
                <asp:MenuItem Text="Clerk Features" Value="Clerk Features">
                    <asp:MenuItem NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx" Text="Edit/Delete Books"
                        Value="Edit/Delete Books"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change password" Value="Change password">
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp;
        <input id="Button1" style="z-index: 148; left: 472px; position: absolute; top: 17px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BookNameTextBox"
            ErrorMessage="Title Required" Style="z-index: 129; left: 320px; position: absolute;
            top: 56px"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AuthorTextBox"
            ErrorMessage="Author Name Required" Style="z-index: 130; left: 320px; position: absolute;
            top: 87px" Width="142px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CategoryTextBox"
            ErrorMessage="Cagtegory Required" Style="z-index: 131; left: 320px; position: absolute;
            top: 118px" Width="123px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ISBNTextBox"
            ErrorMessage="ISBN Required" Style="z-index: 132; left: 320px; position: absolute;
            top: 149px" Width="95px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EditionTextBox"
            ErrorMessage="Edition Required" Style="z-index: 133; left: 320px; position: absolute;
            top: 180px" Width="101px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="CopiesTextBox"
            ErrorMessage="Copies Required" Style="z-index: 134; left: 388px; position: absolute;
            top: 214px" Width="103px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="PriceTextBox"
            ErrorMessage="Price Required" Style="z-index: 135; left: 387px; position: absolute;
            top: 244px" Width="90px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DiscountTextBox"
            ErrorMessage="Discount Required" Style="z-index: 136; left: 323px; position: absolute;
            top: 274px" Width="112px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="PublisherTextBox"
            ErrorMessage="Publisher Required" Style="z-index: 137; left: 322px; position: absolute;
            top: 304px" Width="115px"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="PriceRangeValidator1" runat="server" ControlToValidate="PriceTextBox"
            ErrorMessage="Price Must be +ve Number" MaximumValue="20000" MinimumValue="1" Style="z-index: 138;
            left: 206px; position: absolute; top: 242px" Width="170px" Type="Double"></asp:RangeValidator>
        &nbsp;
        <asp:RangeValidator ID="DiscountRangeValidator1" runat="server" ControlToValidate="DiscountTextBox"
            ErrorMessage="Discount Cant be -ve" Height="1px" MinimumValue="0" Style="z-index: 139;
            left: 220px; position: absolute; top: 262px" Width="73px" MaximumValue="12000" Type="Double"></asp:RangeValidator>
        <asp:CompareValidator ID="DiscountCompareValidator1" runat="server" ControlToCompare="PriceTextBox"
            ControlToValidate="DiscountTextBox" ErrorMessage="Discount Cant be More than Price"
            Operator="LessThan" Style="z-index: 140; left: 448px; position: absolute; top: 263px"
            Width="112px"></asp:CompareValidator>
        &nbsp;
        <asp:RangeValidator ID="CopiesRangeValidator1" runat="server" ControlToValidate="CopiesTextBox"
            ErrorMessage="Copies Must be +ve Numbers" MaximumValue="15000" MinimumValue="1"
            Style="z-index: 141; left: 195px; position: absolute; top: 212px" Type="Integer"
            Width="187px"></asp:RangeValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="RatingTextBox" runat="server" Style="z-index: 142; left: 134px;
            position: absolute; top: 400px" Width="41px">2</asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Style="z-index: 143; left: 21px; position: absolute;
            top: 399px" Text="Rating"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RatingTextBox"
            ErrorMessage="Required" Style="z-index: 144; left: 188px; position: absolute;
            top: 403px"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="RatingTextBox"
            ErrorMessage="1 to 4" MaximumValue="4" MinimumValue="1" Style="z-index: 145;
            left: 251px; position: absolute; top: 403px"></asp:RangeValidator>
        <asp:Label ID="successorfailurelabel" runat="server" Height="114px" Style="z-index: 146;
            left: 343px; position: absolute; top: 350px" Width="240px"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ISBNTextBox"
            ErrorMessage="ISBN Format is Wrong" Style="z-index: 147; left: 437px; position: absolute;
            top: 150px" ValidationExpression="^ISBN\s(?=[-0-9xX ]{13}$)(?:[0-9]+[- ]){3}[0-9]*[xX0-9]$"
            Width="133px"></asp:RegularExpressionValidator>
    </div>
    <br />
    <br />
    <br />
    <br />
    &nbsp;<br />
    &nbsp; &nbsp;<br />
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
    &nbsp; 
    <asp:Menu ID="Menu1" runat="server" Height="14px" Style="z-index: 100; left: -152px;
        position: absolute; top: 106px">
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
    <asp:HyperLink ID="HyperLink5" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 101; left: -130px; position: absolute; top: 58px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" Height="14px" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
        Style="z-index: 102; left: -128px; position: absolute; top: -6px">Edit/Delete Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" Height="14px" NavigateUrl="~/AdminReportGenerationA.aspx"
        Style="z-index: 103; left: -131px; position: absolute; top: 36px">Report Generation</asp:HyperLink>
    <asp:HyperLink ID="HyperLink8" runat="server" Height="14px" NavigateUrl="~/AdminChangeBookShopName.aspx"
        Style="z-index: 104; left: -153px; position: absolute; top: 80px" Width="184px">Change Book Shop Name</asp:HyperLink>
    <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 107; left: -115px; position: absolute; top: 14px">Generate Bill</asp:HyperLink>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
    <br />
    <br />
    <br />
    <br />
    &nbsp;
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
    &nbsp;
</asp:Content>

