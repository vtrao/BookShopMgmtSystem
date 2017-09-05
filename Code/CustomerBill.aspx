<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        BillTextBox.ReadOnly = true;
        if (IsPostBack == false)
            TitleRadioButton.Checked = true;
    }

    protected void ChequeRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        datedTextBox.Visible = true;
        datedLabel.Visible = true;
        DoneButton.Visible = true;
        NameLabel.Text = "Cheque Issue Bank Name";
        NameLabel.Visible = true;
        Note1Label.Text = " Cheque Note: Make Sure that U got Enough Balance in Ur Account";
        NumberLabel.Text = "Cheque Number";
        NumberLabel.Visible = true;
        Note1Label.Visible = true;
        NameTextBox.Visible = true;
        NumberTextBox.Visible = true;
        MailLabel.Text = "Mail the Cheque Original along with a Xerox Copy To the Mailing Address Below";
        MailLabel.Visible = true;
        visaRadioButton.Visible = false;
        DinersRadioButton.Visible = false;
        AmexRadioButton.Visible = false;
        MasterRadioButton.Visible = false;
        cardtypeLabel.Visible = false;
        datedLabel.Text = "Drawn on";
        LocationDropDownList.Visible = false;
        RequiredFieldValidator1.Enabled = true;
        RequiredFieldValidator2.Enabled = true;
        RequiredFieldValidator3.Enabled = true;
        NumberRegularValidator.Enabled = true;
        NumberRegularValidator.ValidationExpression = "[0-9]+8";
        NumberRegularValidator.Text = "Like YYYYYYYY, Y is a Number";
        RegularExpressionValidator1.Enabled = true;
        AddressLabel.Visible = false;
        Session["modeofpayment"] = "Cheque";
    }

    protected void DDRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        datedTextBox.Visible = true;
        DoneButton.Visible = true;
        datedLabel.Visible = true;
        NameLabel.Text = "DD Issue Bank Name";
        NameLabel.Visible = true;
        Note1Label.Text = "Take a DD in Favour of     \"Universal Books Paradise\",       Electronic City, Bangalore.     Payable at Bangalore";
        NumberLabel.Text = "DD Number";
        NumberLabel.Visible = true;
        Note1Label.Visible = true;
        NameTextBox.Visible = true;
        NumberTextBox.Visible = true;
        MailLabel.Text = "Mail the DD Original along with a Xerox Copy To the Mailing Address Below";
        MailLabel.Visible = true;
        visaRadioButton.Visible = false;
        DinersRadioButton.Visible = false;
        AmexRadioButton.Visible = false;
        MasterRadioButton.Visible = false;
        cardtypeLabel.Visible = false;
        datedLabel.Text = "Drawn on";
        LocationDropDownList.Visible = false;
        RequiredFieldValidator1.Enabled = true;
        RequiredFieldValidator2.Enabled = true;
        RequiredFieldValidator3.Enabled = true;
        RegularExpressionValidator1.Enabled = true;
        NumberRegularValidator.Enabled = true;
        NumberRegularValidator.ValidationExpression = "[0-9]+8";
        NumberRegularValidator.Text = "Like YYYYYYYY, Y is a Number";
        AddressLabel.Visible = false;
        Session["modeofpayment"] = "DemandDraft";
    }

    protected void CreditCardRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        datedTextBox.Visible = true;
        DoneButton.Visible = true;
        datedLabel.Visible = true;
        NameLabel.Text = "Name on Card";
        NameLabel.Visible = true;
        Note1Label.Text = "Credit Card Note: Make Sure that U got enough Balance in ur Account";
        Note1Label.Visible = true;
        NumberLabel.Text = "Card Number";
        NumberLabel.Visible = true;
        NameTextBox.Visible = true;
        NumberTextBox.Visible = true;
        MailLabel.Visible = false;
        visaRadioButton.Visible = true; visaRadioButton.Checked = true;
        DinersRadioButton.Visible = true;
        AmexRadioButton.Visible = true;
        MasterRadioButton.Visible = true;
        cardtypeLabel.Visible = true;
        datedLabel.Text = "Expiry Date";
        LocationDropDownList.Visible = false;
        RequiredFieldValidator1.Enabled = true;
        RequiredFieldValidator2.Enabled = true;
        RequiredFieldValidator3.Enabled = true;
        RegularExpressionValidator1.Enabled = true;
        NumberRegularValidator.Enabled = true;
        NumberRegularValidator.ValidationExpression = "[1-9][0-9]+9";
        NumberRegularValidator.Text = "Like XYYYYYYYYY and X Cant be 0";
        AddressLabel.Visible = false;
        Session["modeofpayment"] = "CreditCard";
    }
    
    protected void PaybycashRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        LocationDropDownList.Visible = true;                
        datedTextBox.Visible = false;
        datedLabel.Visible = false;
        DoneButton.Visible = true;
        NameLabel.Text = "Pay atLocation";
        NameLabel.Visible = true;     
        NumberLabel.Visible = false;
        Note1Label.Visible = true;
        Note1Label.Text = "Select the Location of Ur Preference to Pay by Cash";
        NameTextBox.Visible = false;
        NumberTextBox.Visible = false;   
        MailLabel.Visible = false;
        visaRadioButton.Visible = false;
        DinersRadioButton.Visible = false;
        AmexRadioButton.Visible = false;
        MasterRadioButton.Visible = false;
        cardtypeLabel.Visible = false;
        RequiredFieldValidator1.Enabled = false;
        RequiredFieldValidator2.Enabled = false;
        RequiredFieldValidator3.Enabled = false;
        RegularExpressionValidator1.Enabled = false;
        NumberRegularValidator.Enabled = false;
        AddressLabel.Visible = true;
        AddressLabel.Text = "Address:  Universal Book Paradise ,No 123/420/12, Road no 12, Electronic City, Bangalore, India";
        Session["modeofpayment"] = "PayCash";
    }

    protected void LocationDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM Branches", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "Branches");
        for (int i = 0; i < dt.Tables["Branches"].Rows.Count; i++)
        {
            if (LocationDropDownList.SelectedValue.Equals(dt.Tables["Branches"].Rows[i]["Location"].ToString()))
                AddressLabel.Text = dt.Tables["Branches"].Rows[i]["Address"].ToString();
        }
        con.Close();      
    }

    protected void BillButton_Click(object sender, EventArgs e)
    {
        float totalcost = 0.0f;
        int cps = 0;
        //get the books in the cart of the user and which are not yet billed i.e.., status=0
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM [CustCart] where [Status]=1", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "CustCart");
        for (int i = 0; i < dt.Tables["CustCart"].Rows.Count; i++)
        {
            if (Session["username"].Equals(dt.Tables["CustCart"].Rows[i]["UserName"].ToString()))
            {
                totalcost = totalcost + float.Parse(dt.Tables["CustCart"].Rows[i]["Total Cost"].ToString());
                cps = cps + int.Parse(dt.Tables["CustCart"].Rows[i]["noc"].ToString());
            }
        }
        con.Close();
        Session["nocp"] = cps.ToString();
        BillTextBox.Text = totalcost.ToString();
        DoneButton.Enabled = true;
        BillButton.Enabled = false;
    }
    
   
    protected void DoneButton_Click(object sender, EventArgs e)
    {
        Session["transactionid"] = Session["username"].ToString() + DateTime.Now.ToString();
        //Insert the bill and transaction data into books sold table
        SqlDataSource test1 = new SqlDataSource();
        test1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        if (ChequeRadioButton.Checked == true || DDRadioButton.Checked == true || CreditCardRadioButton.Checked == true)
        {            
            test1.InsertCommand = "INSERT INTO [BooksSold] ([TransactionID],[UserName],[Date],[Number of Copies],[Total Cost],[ModeofPay],[IssueBank],[DDorChequeorCreditCardNumber],[DrawnOnorExpiryDate]) VALUES (@tid,@unm,@dte,@nocps,@tct,@mop,@ibk,@dccc,@doed)";
            test1.InsertParameters.Add("tid", Session["transactionid"].ToString());
            test1.InsertParameters.Add("unm", Session["username"].ToString());
            test1.InsertParameters.Add("dte", DateTime.Now.ToString());
            test1.InsertParameters.Add("nocps", Session["nocp"].ToString());
            test1.InsertParameters.Add("tct", BillTextBox.Text.ToString());
            test1.InsertParameters.Add("mop", Session["modeofpayment"].ToString());
            test1.InsertParameters.Add("ibk", NameTextBox.Text.ToString());
            test1.InsertParameters.Add("dccc",NumberTextBox.Text.ToString());
            test1.InsertParameters.Add("doed",datedTextBox.Text.ToString());           
            test1.Insert(); 
        }    
        else if (PaybycashRadioButton.Checked == true)
        {            
            test1.InsertCommand = "INSERT INTO [BooksSold] ([TransactionID],[UserName],[Date],[Number of Copies],[Total Cost],[ModeofPay],[LocationMOP],[LocationAddress]) VALUES (@tid,@unm,@dte,@nocps,@tct,@mop,@lmop,@lmopa)";
            test1.InsertParameters.Add("tid", Session["transactionid"].ToString());
            test1.InsertParameters.Add("unm", Session["username"].ToString());
            test1.InsertParameters.Add("dte", DateTime.Now.ToString());
            test1.InsertParameters.Add("nocps", Session["nocp"].ToString());
            test1.InsertParameters.Add("tct", BillTextBox.Text.ToString());
            test1.InsertParameters.Add("mop", Session["modeofpayment"].ToString());
            test1.InsertParameters.Add("lmop", LocationDropDownList.SelectedValue.ToString());
            test1.InsertParameters.Add("lmopa",AddressLabel.Text.ToString());
            test1.Insert(); 
        }
        
        // set the custcart status flag to billed i.e.., 0 from 1
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        test.UpdateCommand = "UPDATE [CustCart] SET [Status]=(@ncp1),[TransactionID]=(@tsid) WHERE ([Status] = (@stat) AND [UserName] = (@un))";
        test.UpdateParameters.Add("ncp1", "0"); // billed
        test.UpdateParameters.Add("tsid", Session["transactionid"].ToString());
        test.UpdateParameters.Add("un", Session["username"].ToString());
        test.UpdateParameters.Add("stat", "1");
        test.Update();
        NameTextBox.Visible = false;
        DoneButton.Visible = false;
        BillButton.Visible = false;
        NameLabel.Visible = false;
        NumberTextBox.Visible = false;
        NumberLabel.Visible = false;
        datedTextBox.Visible = false;
        datedLabel.Visible = false;
        AddressLabel.Visible = false;
        LocationDropDownList.Visible = false;
        Button1.Visible = true;
        Label6.Visible = false;
        BillTextBox.Visible = false;
        visaRadioButton.Visible = false;
        MasterRadioButton.Visible = false;
        AmexRadioButton.Visible = false;
        DinersRadioButton.Visible = false;
        cardtypeLabel.Visible = false;        
        Note1Label.Text = "Note : Make Sure to Update the Address in Your Profile For Delivery of the Package";
        TransactionID.Visible = true; 
        TransactionID.Text = "Your Transaction ID is : \"" + Session["transactionid"].ToString() + " \"                     Use this For any correspondence";
        // to check user profile exists or not
        int yaaexists = 1;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM [CustomerDetails]", con);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "CustomerDetails");
        for (int i = 0; i < dt.Tables["CustomerDetails"].Rows.Count; i++)
        {
            if (Session["username"].Equals(dt.Tables["CustomerDetails"].Rows[i]["UserName"].ToString()))
                yaaexists = 0;
        }
        con.Close();
        if (yaaexists == 1) // profile does not exists
        {
            yaaexistsLabel.Visible = true;
        }        
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CustomerHomePage.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
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

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e){}

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button2_onclick() {
myWin= open("Helpbutton.aspx?help=16", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
    <asp:RadioButton ID="PaybycashRadioButton" runat="server" GroupName="anyone" OnCheckedChanged="PaybycashRadioButton_CheckedChanged"
        Style="z-index: 100; left: 453px; position: absolute; top: 45px" Text="Pay By Cash" Width="110px" AutoPostBack="True" />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; 
    <asp:Label ID="Label7" runat="server" Style="z-index: 101; left: 29px; position: absolute;
        top: 11px" Text="Select the Mode of payment" Width="471px"></asp:Label>
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
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="AddressLabel" runat="server" Height="72px" Style="z-index: 102; left: 170px;
        position: absolute; top: 175px" Visible="False" Width="194px"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp;
    <div style="z-index: 100; left: 57px; width: 468px; position: absolute; top: 73px;
        height: 255px">
        <asp:Label ID="NoteLabel" runat="server" Style="z-index: 100; left: -38px; position: absolute;
            top: 336px" Text="Note : Your DD or Cheque Should Reach Us in one Week else Ur Order Stands Cancelled. In Case of Credit Card Make Sure U got Sufficient balance."></asp:Label>
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        <asp:RadioButton ID="ChequeRadioButton" runat="server" GroupName="anyone" OnCheckedChanged="ChequeRadioButton_CheckedChanged"
            Style="z-index: 101; left: -28px; position: absolute; top: -27px" Text="Cheque" AutoPostBack="True" />
        <asp:RadioButton ID="DDRadioButton" runat="server" GroupName="anyone" Style="z-index: 102;
            left: 79px; position: absolute; top: -27px" Text="Demand Draft(DD)" OnCheckedChanged="DDRadioButton_CheckedChanged" AutoPostBack="True" />
        <asp:RadioButton ID="CreditCardRadioButton" runat="server" GroupName="anyone" Style="z-index: 103;
            left: 258px; position: absolute; top: -27px" Text="Credit Card" Width="115px" OnCheckedChanged="CreditCardRadioButton_CheckedChanged" AutoPostBack="True" />
        <asp:Label ID="Note1Label" runat="server" Style="z-index: 104; left: 27px; position: absolute;
            top: 11px"
            Visible="False" Width="328px"></asp:Label>
        <asp:Label ID="NameLabel" runat="server" Style="z-index: 105; left: -50px; position: absolute;
            top: 60px" Visible="False"></asp:Label>
        <asp:TextBox ID="NameTextBox" runat="server" Style="z-index: 106; left: 113px; position: absolute;
            top: 58px" Visible="False" Width="183px"></asp:TextBox>
        <asp:Label ID="NumberLabel" runat="server" Style="z-index: 107; left: -50px; position: absolute;
            top: 105px" Visible="False"></asp:Label>
        <asp:TextBox ID="NumberTextBox" runat="server" Style="z-index: 108; left: 113px;
            position: absolute; top: 103px" Visible="False" Width="183px"></asp:TextBox>
        <asp:Button ID="DoneButton" runat="server" Height="33px" Style="z-index: 109; left: 238px;
            position: absolute; top: 235px" Text="Done" Width="136px" OnClick="DoneButton_Click" Visible="False" Enabled="False" />
        <asp:Label ID="Label1" runat="server" Style="z-index: 110; left: -38px; position: absolute;
            top: 406px" Text="Any Queries Contact: "></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 111; left: 21px; position: absolute;
            top: 462px" Text="Mailing Address:  Universal Book Paradise ,"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="z-index: 112; left: 18px; position: absolute;
            top: 434px" Text="Email ID: admin@universalbookshome.com"></asp:Label>
        <asp:Label ID="Label4" runat="server" Style="z-index: 113; left: 130px; position: absolute;
            top: 490px" Text="No 123/420/12, Road no 12, Electronic City"></asp:Label>
        <asp:Label ID="Label5" runat="server" Style="z-index: 114; left: 135px; position: absolute;
            top: 520px" Text="Bangalore, India"></asp:Label>
        <asp:Label ID="MailLabel" runat="server" Style="z-index: 115; left: -38px; position: absolute;
            top: 286px" Visible="False" Width="529px"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NumberTextBox"
            ErrorMessage="Number Required" Style="z-index: 116; left: 313px; position: absolute;
            top: 105px" Width="113px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox"
            ErrorMessage="Name Required" Style="z-index: 117; left: 313px; position: absolute;
            top: 60px"></asp:RequiredFieldValidator>
        <asp:RadioButton ID="DinersRadioButton" runat="server" GroupName="cardtype" Style="z-index: 118;
            left: 454px; position: absolute; top: 180px" Text="Diners" Visible="False" Width="63px" Height="7px" />
        <asp:RadioButton ID="AmexRadioButton" runat="server" GroupName="cardtype" Style="z-index: 119;
            left: 454px; position: absolute; top: 149px" Text="Amex" Visible="False" Width="1px" Height="7px" />
        <asp:RadioButton ID="MasterRadioButton" runat="server" GroupName="cardtype" Style="z-index: 120;
            left: 454px; position: absolute; top: 120px" Text="Master" Visible="False" Width="7px" Height="7px" />
        <asp:RadioButton ID="visaRadioButton" runat="server" GroupName="cardtype" Style="z-index: 121;
            left: 454px; position: absolute; top: 91px" Text="Visa" Visible="False" Width="1px" Height="7px" />
        <asp:Label ID="cardtypeLabel" runat="server" Style="z-index: 122; left: 448px; position: absolute;
            top: 50px" Text="Card Type" Visible="False" Width="84px"></asp:Label>
        <asp:TextBox ID="datedTextBox" runat="server" Style="z-index: 123; left: 113px; position: absolute;
            top: 150px" Visible="False" Width="79px"></asp:TextBox>
        <asp:Label ID="datedLabel" runat="server" Style="z-index: 124; left: -50px; position: absolute;
            top: 152px"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="datedTextBox"
            ErrorMessage="Date Required" Style="z-index: 125; left: 214px; position: absolute;
            top: 152px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="datedTextBox"
            ErrorMessage="dd/mm/yyyy" Style="z-index: 126; left: 317px; position: absolute;
            top: 152px" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
        <asp:DropDownList ID="LocationDropDownList" runat="server" Style="z-index: 127; left: 112px;
            position: absolute; top: 58px" Visible="False" Width="149px" OnSelectedIndexChanged="LocationDropDownList_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Location" DataValueField="Location">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Location] FROM [Branches]"></asp:SqlDataSource>
        <input id="Button2" style="z-index: 136; left: 454px; position: absolute; top: -59px"
            type="button" value="Help" language="javascript" onclick="return Button2_onclick()" />
        <asp:RegularExpressionValidator ID="NumberRegularValidator" runat="server" ControlToValidate="NumberTextBox"
            Style="z-index: 129; left: 315px; position: absolute; top: 105px" Enabled="False"></asp:RegularExpressionValidator>
        &nbsp;
        <asp:Button ID="BillButton" runat="server" Height="33px" Style="z-index: 130; left: -42px;
            position: absolute; top: 235px" Text="Calculate Bill" Width="136px" OnClick="BillButton_Click" CausesValidation="False" />
        <asp:Label ID="Label6" runat="server" Style="z-index: 131; left: -50px; position: absolute;
            top: 194px" Text="Bill Amount"></asp:Label>
        <asp:TextBox ID="BillTextBox" runat="server" Style="z-index: 132; left: 113px; position: absolute;
            top: 192px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Height="75px" Style="z-index: 133; left: 94px;
            position: absolute; top: 121px" Text="Continue..." Width="195px" OnClick="Button1_Click" Visible="False" />
        <asp:Label ID="TransactionID" runat="server" Height="56px" Style="z-index: 134; left: -29px;
            position: absolute; top: 61px" Visible="False" Width="364px"></asp:Label>
        <asp:Label ID="yaaexistsLabel" runat="server" ForeColor="Red" Style="z-index: 135;
            left: -18px; position: absolute; top: 206px" Text="Alert! You haven't Submitted Your Profile. Do it from your Home Page to deliver the Package Accordingly. "
            Visible="False" Width="497px"></asp:Label>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 103;
        left: 496px; position: absolute; top: -29px" Text="Back" CausesValidation="False" />
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
        Style="z-index: 104; left: -144px; position: absolute; top: 369px" Width="123px">
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
        Style="z-index: 105; left: -94px; position: absolute; top: 256px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 106; left: -129px; position: absolute; top: 344px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 107; left: -142px; position: absolute; top: 322px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 108; left: -111px; position: absolute; top: 278px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/CustProfile.aspx?myvalue=2" Style="z-index: 109;
        left: -128px; position: absolute; top: 300px">Update My Profile</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 110; left: -109px; position: absolute; top: 212px">View Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 112;
        left: -103px; position: absolute; top: 234px">View Cart</asp:HyperLink>
    <div style="z-index: 109; left: -152px; width: 171px; position: absolute; top: -49px;
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
            left: 18px; position: absolute; top: 211px" Text="Go...Search" Width="108px" CausesValidation="False" />
        <br />
        &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search&nbsp;&nbsp;
        </span></strong>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

