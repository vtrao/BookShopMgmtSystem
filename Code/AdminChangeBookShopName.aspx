<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

 
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource test = new SqlDataSource();
            test.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            test.UpdateCommand = "UPDATE [BookShopName] SET [Book Shop Name]=(@BookShop) WHERE ([Book Shop ID]=1)"; 
            test.UpdateParameters.Add("BookShop", TextBox1.Text);
            test.Update();
            Label4.Text = " Book Shop Name Updated Successfully ";
        }
        catch (Exception exp)
        {
            
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
        SqlDataSource get=new SqlDataSource();
        get.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();       
        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Book Shop Name] FROM [BookShopName]",get.ConnectionString);
        System.Data.DataSet dt = new System.Data.DataSet();
        adapter.Fill(dt, "[BookShopName]");
        TextBox1.Text = dt.Tables["[BookShopName]"].Rows[0]["Book Shop Name"].ToString();
        }
        
        /*if (IsPostBack == false)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter("SELECT [Book Shop Name] FROM [BookShopName]", con);
            System.Data.DataSet dt = new System.Data.DataSet();
            adapter.Fill(dt, "[BookShopName]");
            TextBox1.Text = dt.Tables["[BookShopName]"].Rows[0]["Book Shop Name"].ToString();
            con.Close();
        } */   
        
    }

    protected void GoBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("AdministratorHomePage.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button3_onclick() {
myWin= open("Helpbutton.aspx?help=12", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 39px; width: 321px; position: absolute; top: 32px;
        height: 243px">
        <asp:Label ID="Label1" runat="server" Height="24px" Style="z-index: 100; left: 5px;
            position: absolute; top: 101px" Text="Book Shop Name" Width="120px"></asp:Label>

        <asp:Label ID="Label2" runat="server" Style="z-index: 101; left: 73px; position: absolute;
            top: 38px" Text="Change the Name of Book Shop"></asp:Label>
        <asp:Button ID="Button1" runat="server" Height="37px" Style="z-index: 102; left: 42px;
            position: absolute; top: 158px" Text="Save" Width="81px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Height="37px" Style="z-index: 103; left: 171px;
            position: absolute; top: 158px" Text="Reset" Width="81px" />
        &nbsp; &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 105; left: 147px; position: absolute;
            top: 102px"></asp:TextBox>
    </div>
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <input id="Button3" style="z-index: 110; left: 402px; position: absolute; top: 20px"
        type="button" value="Help" language="javascript" onclick="return Button3_onclick()" />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <div style="z-index: 109; left: 602px; width: 168px; position: absolute; top: -36px;
        height: 411px">
        &nbsp; &nbsp; &nbsp;&nbsp;
    </div>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 33px; position: absolute; top: -38px" Text="Book Shop Name Changing Page" Width="305px"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 101;
        left: 421px; position: absolute; top: -42px" Text="Back" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Style="z-index: 102; left: 43px; position: absolute;
        top: 284px" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Menu ID="Menu1" runat="server" Height="14px" Style="z-index: 103; left: -157px;
        position: absolute; top: 87px">
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
    <asp:HyperLink ID="HyperLink4" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 104; left: -135px; position: absolute; top: 62px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" Height="14px" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
        Style="z-index: 105; left: -135px; position: absolute; top: -6px">Edit/Delete Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" Height="14px" NavigateUrl="~/AdminReportGenerationA.aspx"
        Style="z-index: 106; left: -136px; position: absolute; top: 39px">Report Generation</asp:HyperLink>
    <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
        Style="z-index: 108; left: -111px; position: absolute; top: -30px">Add Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 110; left: -120px; position: absolute; top: 16px">Generate Bill</asp:HyperLink>
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

