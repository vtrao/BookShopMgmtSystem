<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    //int profileexistsornotflag = 0; // set to 1 if profile doesnotexist
    String fname, mname, lname, dobstr;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["myvalue"].ToString().Equals("1"))
        {
            Label28.Text = Session["username1"].ToString(); // directly from registration page not through login thing
            Label28.Visible = false;
            TitleRadioButton.Visible = false;
            AuthorRadioButton.Visible = false;
            KeywordRadioButton.Visible = false;
            ISBNRadioButton.Visible = false;
            CategoryRadioButton.Visible = false;
            Label34.Visible = false;
            GoButton.Visible = false;
            SearchTextBox.Visible = false;
            HyperLink1.Visible = false;
            HyperLink2.Visible = false;
            HyperLink3.Visible = false;
            HyperLink4.Visible = false;
            HyperLink5.Visible = false;
            HyperLink7.Visible = false;
            Menu1.Visible = false;
        }
        else
        {
            BackButton.Visible = true;      
            Label28.Text = Session["username"].ToString();
            Label28.Visible = false;
            if (IsPostBack == false)
            {
                getandfilldata();                
                TitleRadioButton.Checked = true;
            }
        }
    }
    
    protected void Button2_Click(object sender, EventArgs e)// reset button
    {
       if (Request["myvalue"].ToString().Equals("1"))
            {
                FirstNameTextBox.Text = " ";
                LastNameTextBox.Text = " ";
                MiddleNameTextBox.Text = " ";
                Address1TextBox.Text = " ";
                Address2TextBox.Text = " ";
                EmailIDTextBox.Text = " ";
                AEmailIDTextBox.Text = " ";
                PinCodeTextBox.Text = " ";
                FaxTextBox.Text = " ";
                MobileTextBox.Text = " ";
                ResiTextBox.Text = " ";
                OfficeTextBox.Text = " ";
            }
            else
                getandfilldata();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        fname = FirstNameTextBox.Text;
        mname = MiddleNameTextBox.Text;
        lname = LastNameTextBox.Text;
        dobstr = DateDropDownList.SelectedValue + "/" + MonthDropDownList.SelectedValue + "/" + YearDropDownList.SelectedValue;
            if (Request["myvalue"].ToString().Equals("1"))
            {
                insertdata();
            }
            else
            {
                
                if (Profile.MyNewProperty.ToString().Equals("1")) // profile doesnot exists
                {
                    Label33.Text = "Profile to be Created yet! Create it now";
                    insertdata();
                }
                else // profile exists so update it
                {
                    try
                    {
                        SqlDataSource test = new SqlDataSource();
                        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                        test.UpdateCommand = "UPDATE [CustomerDetails] SET [FName]=(@fname1),[MName]=(@mname1),[LName]=(@lname1),[Address Line1]=(@al1),[Address Line2]=(@al2),[Phone Number Resi]=(@pnr),[Phone Number Office]=(@pno),[Mobile Number]=(@mon),[Fax Number]=(@fn),[Email ID]=(@emid),[AEmail ID]=(@aemid),[DOB]=(@dob1),[Pin Code]=(@pc),[Occupation]=(@occ),[Country]=(@cou),[State]=(@st),[City]=(@ct),[AOI1]=(@aoi11),[AOI2]=(@aoi21) WHERE ([UserName]=(@uname))";
                        test.UpdateParameters.Add("uname", Label28.Text.ToString());
                        test.UpdateParameters.Add("fname1", fname);
                        test.UpdateParameters.Add("mname1", mname.ToString());
                        test.UpdateParameters.Add("lname1", lname.ToString());
                        test.UpdateParameters.Add("al1", Address1TextBox.Text.ToString());
                        test.UpdateParameters.Add("al2", Address2TextBox.Text.ToString());
                        test.UpdateParameters.Add("pnr", ResiTextBox.Text.ToString());
                        test.UpdateParameters.Add("pno", OfficeTextBox.Text.ToString());
                        test.UpdateParameters.Add("mon", MobileTextBox.Text.ToString());
                        test.UpdateParameters.Add("fn", FaxTextBox.Text.ToString());
                        test.UpdateParameters.Add("emid", EmailIDTextBox.Text.ToString());
                        test.UpdateParameters.Add("aemid", AEmailIDTextBox.Text.ToString());
                        test.UpdateParameters.Add("dob1", dobstr.ToString());
                        test.UpdateParameters.Add("pc", PinCodeTextBox.Text.ToString());
                        test.UpdateParameters.Add("occ", OccupationDropDownList.SelectedValue.ToString());
                        test.UpdateParameters.Add("cou", CountryDropDownList.SelectedValue.ToString());
                        test.UpdateParameters.Add("st", StateDropDownList.SelectedValue.ToString());
                        test.UpdateParameters.Add("ct", CityDropDownList.SelectedValue.ToString());
                        test.UpdateParameters.Add("aoi11", AOI1DropDownList.SelectedValue.ToString());
                        test.UpdateParameters.Add("aoi21", AOI2DropDownList.SelectedValue.ToString());
                        test.Update();
                        //getandfilldata();
                        Label33.Text = "Profile Successfully Updated";
                    }
                    catch (Exception exp)
                    {
                        Label33.Text = exp.StackTrace.ToString();
                    }
                }               
            }   
        
    }
    
    void insertdata()
    {        
        SqlDataSource test = new SqlDataSource();
        test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        test.InsertCommand = "INSERT INTO [CustomerDetails] ([UserName],[FName],[MName],[LName],[Address Line1],[Address Line2],[Phone Number Resi],[Phone Number Office],[Mobile Number],[Fax Number],[Email ID],[AEmail ID],[DOB],[Pin Code],[Occupation],[Country],[State],[City],[AOI1],[AOI2]) VALUES (@un,@fname2,@mname2,@lname2,@addressline1,@addressline2,@phonenumberresi,@phonenumberoffice,@mobilenumber,@faxnumber,@emailid,@aemailid,@dob,@pincode,@occupation,@country,@state,@city,@aoi1,@aoi2)";
        test.InsertParameters.Add("un", Label28.Text.ToString());
        test.InsertParameters.Add("fname2", fname);
        test.InsertParameters.Add("mname2", mname);
        test.InsertParameters.Add("lname2", lname);
        test.InsertParameters.Add("addressline1", Address1TextBox.Text);
        test.InsertParameters.Add("addressline2", Address2TextBox.Text);
        test.InsertParameters.Add("phonenumberresi", ResiTextBox.Text);
        test.InsertParameters.Add("phonenumberoffice", OfficeTextBox.Text);
        test.InsertParameters.Add("mobilenumber", MobileTextBox.Text);
        test.InsertParameters.Add("faxnumber", FaxTextBox.Text);
        test.InsertParameters.Add("emailid", EmailIDTextBox.Text);
        test.InsertParameters.Add("aemailid", AEmailIDTextBox.Text);
        test.InsertParameters.Add("dob", dobstr);
        test.InsertParameters.Add("pincode", PinCodeTextBox.Text);
        test.InsertParameters.Add("occupation", OccupationDropDownList.SelectedValue);
        test.InsertParameters.Add("country", CountryDropDownList.SelectedValue);
        test.InsertParameters.Add("state", StateDropDownList.SelectedValue);
        test.InsertParameters.Add("city", CityDropDownList.SelectedValue);
        test.InsertParameters.Add("aoi1", AOI1DropDownList.SelectedValue.ToString());
        test.InsertParameters.Add("aoi2", AOI2DropDownList.SelectedValue.ToString());               
        test.Insert();
        Label33.Text = " Profile Successfully Created ";
        Profile.MyNewProperty = "0";
        if (Request["myvalue"].ToString().Equals("1"))
            Server.Transfer("HomePage.aspx");
    }

    void getandfilldata()
    {
        int flag = 0;
        try
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            //System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [UserName],[FName],[MName],[LName],[Address Line1],[Address Line2],[Phone Number Resi],[Phone Number Office],[Mobile Number],[Fax Number],[Email ID],[AEmail ID],[DOB],[Pin Code],[Occupation],[Country],[State],[City],[AOI1],[AOI2] FROM [CustomerDetails]", con);
            System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT * FROM [CustomerDetails]",con);
            System.Data.DataSet dt = new System.Data.DataSet();
            adapter.Fill(dt, "CustomerDetails");
            for (int i = 0; i < dt.Tables["CustomerDetails"].Rows.Count; i++)
            {
                if (Label28.Text.Equals(dt.Tables["CustomerDetails"].Rows[i]["UserName"].ToString()))
                {
                    FirstNameTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["FName"].ToString();
                    MiddleNameTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["MName"].ToString();
                    LastNameTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["LName"].ToString();
                    Address1TextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Address Line1"].ToString();
                    Address2TextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Address Line2"].ToString();
                    ResiTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Phone Number Resi"].ToString();
                    OfficeTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Phone Number Office"].ToString();
                    MobileTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Mobile Number"].ToString();
                    FaxTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Fax Number"].ToString();
                    PinCodeTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Pin Code"].ToString();
                    EmailIDTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["Email ID"].ToString();
                    AEmailIDTextBox.Text = dt.Tables["CustomerDetails"].Rows[i]["AEmail ID"].ToString();
                    Label33.Text="Profile Data : Date of Birth is " +dt.Tables["CustomerDetails"].Rows[i]["DOB"].ToString()+ 
                                 " , Occupation is "+dt.Tables["CustomerDetails"].Rows[i]["Occupation"].ToString()+
                                 "City :"+dt.Tables["CustomerDetails"].Rows[i]["City"].ToString()+
                                 " , State : "+dt.Tables["CustomerDetails"].Rows[i]["State"].ToString()+
                                 " , Country : "+dt.Tables["CustomerDetails"].Rows[i]["Country"].ToString()+
                                 " , Area of Interest 1 : "+dt.Tables["CustomerDetails"].Rows[i]["AOI1"].ToString()+
                                 " , Area of Interest 2 : "+dt.Tables["CustomerDetails"].Rows[i]["AOI2"].ToString();       
                    flag = 1;
                }                 
            }
            con.Close();
            if (flag == 0)
                Profile.MyNewProperty = "1";
        }
        catch (Exception exp)
        {
            Label33.Text = exp.StackTrace.ToString();
            Profile.MyNewProperty = "1";
        }
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

    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e) {  }
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e) { }
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e) { }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button3_onclick() {
myWin= open("Helpbutton.aspx?help=18", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Height="17px" StaticSubMenuIndent="10px"
        Style="z-index: 100; left: -144px; position: absolute; top: 351px" Width="123px">
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
                <asp:MenuItem NavigateUrl="~/CustFeedBackandRating.aspx" Text="Feed back and Rating"
                    Value="Feed back and Rating"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="Log out" Value="Log out"></asp:MenuItem>
            </asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
    </asp:Menu>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CustSearchBooksNor.aspx"
        Style="z-index: 101; left: -94px; position: absolute; top: 255px">Search</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 102; left: -129px; position: absolute; top: 327px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CustFeedBackandRating.aspx"
        Style="z-index: 103; left: -142px; position: absolute; top: 303px">Feed Back and Rating</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustOrderBook.aspx"
        Style="z-index: 104; left: -111px; position: absolute; top: 279px">Order Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/CustViewBooks.aspx"
        Style="z-index: 106; left: -109px; position: absolute; top: 207px">View Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustViewCart.aspx" Style="z-index: 108;
        left: -103px; position: absolute; top: 231px">View Cart</asp:HyperLink>
    <div style="z-index: 109; left: -150px; width: 171px; position: absolute; top: -48px;
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
        &nbsp;<br />
        &nbsp; &nbsp;&nbsp;<strong><span style="text-decoration: underline">
            <asp:Label ID="Label34" runat="server" Style="z-index: 108; left: 33px; position: absolute;
                top: 11px" Text="Quick Search"></asp:Label>
        </span></strong>
    </div>
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <div style="z-index: 100; left: 8px; width: 615px; position: absolute; top: 5px;
        height: 580px">
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 12px; position: absolute;
            top: 14px" Text="Name"></asp:Label>
        <asp:TextBox ID="FirstNameTextBox" runat="server" Style="z-index: 101; left: 114px; position: absolute;
            top: 12px" Width="131px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Style="z-index: 102; left: 12px; position: absolute;
            top: 121px" Text="Address"></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 103; left: 12px; position: absolute;
            top: 212px" Text="City"></asp:Label>
        <asp:Label ID="Label4" runat="server" Style="z-index: 104; left: 12px; position: absolute;
            top: 283px" Text="Country"></asp:Label>
        <asp:Label ID="Label5" runat="server" Style="z-index: 105; left: 12px; position: absolute;
            top: 247px" Text="State"></asp:Label>
        <asp:Label ID="Label6" runat="server" Style="z-index: 106; left: 226px; position: absolute;
            top: 279px" Text="EMail ID"></asp:Label>
        &nbsp;
        <asp:Label ID="Label8" runat="server" Style="z-index: 107; left: 275px; position: absolute;
            top: 60px" Text="Phone Number"></asp:Label>
        <asp:TextBox ID="MiddleNameTextBox" runat="server" Style="z-index: 108; left: 272px; position: absolute;
            top: 12px" Width="136px"></asp:TextBox>
        <asp:TextBox ID="LastNameTextBox" runat="server" Style="z-index: 109; left: 434px; position: absolute;
            top: 12px"></asp:TextBox>
        <asp:TextBox ID="Address1TextBox" runat="server" Style="z-index: 110; left: 75px; position: absolute;
            top: 120px"></asp:TextBox>
        <asp:TextBox ID="Address2TextBox" runat="server" Style="z-index: 111; left: 76px; position: absolute;
            top: 170px"></asp:TextBox>
        <asp:TextBox ID="FaxTextBox" runat="server" Style="z-index: 112; left: 393px; position: absolute;
            top: 172px" Width="98px" Height="13px"></asp:TextBox>
        <asp:TextBox ID="PinCodeTextBox" runat="server" Height="17px" Style="z-index: 113; left: 316px;
            position: absolute; top: 214px" Width="101px"></asp:TextBox>
        <asp:TextBox ID="EmailIDTextBox" runat="server" Style="z-index: 114; left: 313px; position: absolute;
            top: 276px"></asp:TextBox>
        <asp:DropDownList ID="MMMDropDownList" runat="server" Style="z-index: 115; left: 56px;
            position: absolute; top: 12px" Width="46px">
            <asp:ListItem>Mr.</asp:ListItem>
            <asp:ListItem>Mrs.</asp:ListItem>
            <asp:ListItem>Ms</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label9" runat="server" Style="z-index: 116; left: 226px; position: absolute;
            top: 214px" Text="Pin Code"></asp:Label>
        <asp:Label ID="Label10" runat="server" Style="z-index: 117; left: 226px; position: absolute;
            top: 310px" Text="Alternative EMail ID" Height="40px" Width="66px"></asp:Label>
        <asp:Label ID="Label11" runat="server" Style="z-index: 118; left: 12px; position: absolute;
            top: 328px" Text="Occupation"></asp:Label>
        <asp:Label ID="Label12" runat="server" Style="z-index: 119; left: 226px; position: absolute;
            top: 246px" Text="Date of Birth"></asp:Label>
        <asp:DropDownList ID="CountryDropDownList" runat="server" Height="22px" Style="z-index: 120;
            left: 79px; position: absolute; top: 281px" Width="118px">
            <asp:ListItem>India</asp:ListItem>
            <asp:ListItem>United States</asp:ListItem>
            <asp:ListItem>United Kingdom</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="StateDropDownList" runat="server" Height="22px" Style="z-index: 121;
            left: 79px; position: absolute; top: 245px" Width="118px">
            <asp:ListItem>Andhra Pradesh</asp:ListItem>
            <asp:ListItem>Karnataka</asp:ListItem>
            <asp:ListItem>Tamil nadu</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="CityDropDownList" runat="server" Style="z-index: 122; left: 79px;
            position: absolute; top: 210px" Width="118px">
            <asp:ListItem>Chennai</asp:ListItem>
            <asp:ListItem>bangalore</asp:ListItem>
            <asp:ListItem>Hyderabad</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label13" runat="server" Style="z-index: 123; left: 332px; position: absolute;
            top: 119px" Text="Office" Height="18px"></asp:Label>
        <asp:Label ID="Label14" runat="server" Style="z-index: 124; left: 332px; position: absolute;
            top: 88px" Text="Resi" Height="18px"></asp:Label>
        <asp:Label ID="Label15" runat="server" Style="z-index: 125; left: 332px; position: absolute;
            top: 146px" Text="Mobile" Height="18px"></asp:Label>
        <asp:Label ID="Label16" runat="server" Style="z-index: 126; left: 332px; position: absolute;
            top: 172px" Text="Fax" Height="18px"></asp:Label>
        <asp:TextBox ID="MobileTextBox" runat="server" Style="z-index: 127; left: 393px; position: absolute;
            top: 143px" Width="98px" Height="13px"></asp:TextBox>
        <asp:TextBox ID="ResiTextBox" runat="server"   Style="z-index: 128; left: 393px; position: absolute; top: 87px" Width="98px" Height="13px"></asp:TextBox>
        <asp:TextBox ID="OfficeTextBox" runat="server" Style="z-index: 129; left: 393px; position: absolute;
            top: 115px" Width="98px" Height="13px"></asp:TextBox>
        <asp:TextBox ID="AEmailIDTextBox" runat="server" Style="z-index: 130; left: 313px; position: absolute;
            top: 319px"></asp:TextBox>
        <asp:DropDownList ID="OccupationDropDownList" runat="server" Style="z-index: 131; left: 99px;
            position: absolute; top: 326px">
            <asp:ListItem>Student</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label17" runat="server" Height="18px" Style="z-index: 132; left: 503px;
            position: absolute; top: 88px" Text="*"></asp:Label>
        <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Style="z-index: 133;
            left: 525px; position: absolute; top: -61px" Text="Back" Visible="False" CausesValidation="False" />
        <br />
        <asp:Button ID="Button1" runat="server" Height="39px" Style="z-index: 134; left: 139px;
            position: absolute; top: 479px" Text="Submit" Width="90px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Height="39px" OnClick="Button2_Click" Style="z-index: 135;
            left: 303px; position: absolute; top: 479px" Text="Reset" Width="100px" />
        <asp:Label ID="Label18" runat="server" Height="18px" Style="z-index: 136; left: 503px;
            position: absolute; top: 147px" Text="*"></asp:Label>
        <asp:Label ID="Label22" runat="server" Style="z-index: 137; left: 205px; position: absolute;
            top: 282px" Text="*"></asp:Label>
        <asp:Label ID="Label26" runat="server" Style="z-index: 138; left: 448px; position: absolute;
            top: 246px" Text="/"></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" Height="7px" Style="z-index: 139; left: 255px;
            position: absolute; top: 15px" Text="*" Width="1px"></asp:Label>
        <asp:Label ID="Label19" runat="server" Style="z-index: 140; left: 236px; position: absolute;
            top: 123px" Text="*"></asp:Label>
        <asp:Label ID="Label20" runat="server" Style="z-index: 141; left: 202px; position: absolute;
            top: 214px" Text="*"></asp:Label>
        <asp:Label ID="Label21" runat="server" Style="z-index: 142; left: 202px; position: absolute;
            top: 248px" Text="*"></asp:Label>
        <asp:Label ID="Label23" runat="server" Style="z-index: 143; left: 178px; position: absolute;
            top: 328px" Text="*"></asp:Label>
        <asp:Label ID="Label24" runat="server" Style="z-index: 144; left: 430px; position: absolute;
            top: 215px" Text="*"></asp:Label>
        <asp:Label ID="Label25" runat="server" Style="z-index: 145; left: 473px; position: absolute;
            top: 279px" Text="*"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTextBox"
            ErrorMessage="First Name Required" Style="z-index: 146; left: 115px; position: absolute;
            top: 42px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Address1TextBox"
            ErrorMessage="Address Line1 Required" Height="15px" Style="z-index: 147; left: 256px;
            position: absolute; top: 118px" Width="52px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ResiTextBox"
            ErrorMessage="Phone Number Required" Height="56px" Style="z-index: 148; left: 526px;
            position: absolute; top: 87px" Width="56px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="MobileTextBox"
            ErrorMessage="Mobile Number Required" Height="56px" Style="z-index: 149; left: 529px;
            position: absolute; top: 146px" Width="45px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PinCodeTextBox"
            ErrorMessage="Pin Code Required" Style="z-index: 150; left: 449px; position: absolute;
            top: 215px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="EmailIDTextBox"
            ErrorMessage="Email ID Required" Style="z-index: 151; left: 493px; position: absolute;
            top: 280px" Width="55px"></asp:RequiredFieldValidator>
        <asp:DropDownList ID="DateDropDownList" runat="server" Style="z-index: 152; left: 320px;
            position: absolute; top: 244px" Width="52px">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem Value="23"></asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem Value="25"></asp:ListItem>
            <asp:ListItem Value="26"></asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="MonthDropDownList" runat="server" Style="z-index: 153; left: 396px;
            position: absolute; top: 244px" Width="48px">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem Value="4"></asp:ListItem>
            <asp:ListItem Value="5"></asp:ListItem>
            <asp:ListItem Value="6"></asp:ListItem>
            <asp:ListItem Value="7"></asp:ListItem>
            <asp:ListItem Value="8"></asp:ListItem>
            <asp:ListItem Value="9"></asp:ListItem>
            <asp:ListItem Value="10"></asp:ListItem>
            <asp:ListItem Value="11"></asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="YearDropDownList" runat="server" Style="z-index: 154; left: 469px;
            position: absolute; top: 244px" Width="67px">
            <asp:ListItem>1920</asp:ListItem>
            <asp:ListItem>1921</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label27" runat="server" Style="z-index: 155; left: 376px; position: absolute;
            top: 246px" Text="/"></asp:Label>
        <asp:Label ID="Label28" runat="server" Style="z-index: 156; left: 17px; position: absolute;
            top: 468px" Text="Label"></asp:Label>
        <asp:Label ID="Label29" runat="server" Height="20px" Style="z-index: 157; left: 12px;
            position: absolute; top: 374px" Text="Area of Interest 1" Width="109px"></asp:Label>
        <asp:Label ID="Label30" runat="server" Style="z-index: 158; left: 12px; position: absolute;
            top: 416px" Text="Area of Interest 2" Width="114px"></asp:Label>
        <asp:DropDownList ID="AOI1DropDownList" runat="server" Style="z-index: 159; left: 150px;
            position: absolute; top: 373px" Width="257px">
            <asp:ListItem>Biology</asp:ListItem>
            <asp:ListItem>Science</asp:ListItem>
            <asp:ListItem>Microsoft Windows</asp:ListItem>
            <asp:ListItem>DataBase Administration</asp:ListItem>
            <asp:ListItem>Programming</asp:ListItem>
            <asp:ListItem>Linux and Unix</asp:ListItem>
            <asp:ListItem>Mathematics</asp:ListItem>
            <asp:ListItem>Computer Networks</asp:ListItem>
            <asp:ListItem>Fiction</asp:ListItem>
            <asp:ListItem>Vocabulary</asp:ListItem>
            <asp:ListItem>Languages</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="AOI2DropDownList" runat="server" Height="22px" Style="z-index: 160;
            left: 150px; position: absolute; top: 414px" Width="257px">
            <asp:ListItem>Computer Networks</asp:ListItem>
            <asp:ListItem>DataBase Administration</asp:ListItem>
            <asp:ListItem>Programming</asp:ListItem>
            <asp:ListItem>Microsoft Windows</asp:ListItem>
            <asp:ListItem>Linux and Unix</asp:ListItem>
            <asp:ListItem>Mathematics</asp:ListItem>
            <asp:ListItem>Science</asp:ListItem>
            <asp:ListItem>Fiction</asp:ListItem>
            <asp:ListItem>Biology</asp:ListItem>
            <asp:ListItem>Vocabulary</asp:ListItem>
            <asp:ListItem>Languages</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label31" runat="server" Style="z-index: 161; left: 416px; position: absolute;
            top: 415px" Text="*"></asp:Label>
        <asp:Label ID="Label32" runat="server" Style="z-index: 162; left: 414px; position: absolute;
            top: 374px" Text="*"></asp:Label>
        <asp:Label ID="Label33" runat="server" Height="50px" Style="z-index: 163; left: 2px;
            position: absolute; top: 530px" Width="589px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 164;
            left: 32px; position: absolute; top: -56px" Text="User Profile Page Fill in Your Details for Better Service"
            Width="579px"></asp:Label>
        <input id="Button3" style="z-index: 165; left: 404px; position: absolute; top: -33px"
            type="button" value="Help" language="javascript" onclick="return Button3_onclick()" />
    </div>
    <br />
    &nbsp;<br />
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
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp;&nbsp;
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

