<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void GoBack_Click(object sender, EventArgs e)
    {
        if (Session["username"].ToString().Equals("administrator"))
            Server.Transfer("AdminCashierGenerateBill.aspx");
        else
            Server.Transfer("AdminCashierGenerateBill.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].Equals("administrator"))
        {
            Menu1.Visible = false;
        }
        else
        {
            Menu2.Visible = false;
            HyperLink5.Visible = false;
            HyperLink3.Visible = false;
            HyperLink4.Visible = false;
            HyperLink2.Visible = false;
        }        
    }

    protected void orderedRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        BillingRadioButton.Visible = false;
        orderedRadioButton.Visible = false;
        Label1.Visible = true;
        tidTextBox.Visible = true;
        GetButton.Visible = true;
        RequiredFieldValidator1.Visible = true;
        RequiredFieldValidator1.Enabled = true;
        Label4.Visible = true;
    }

    protected void BillingRadioButton_CheckedChanged(object sender, EventArgs e)
    {
     Server.Transfer("AdminCashierViewBookstosale.aspx");   
    }

    protected void GetButton_Click(object sender, EventArgs e)
    {
        getsaledetails(); 
    }
    void getsaledetails()
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        con.Open();
        String query = "SELECT [UserName],[Date],[Number of Copies],[Total Cost],[LocationMOP] FROM [BooksSold] where [TransactionID]='" + tidTextBox.Text + "' ";
        System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet ds = new System.Data.DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        Label2.Visible = true;
        query = "SELECT  [Book Name],[Publisher],[noc],[Total Cost] FROM [CustCart] where [TransactionID]='" + tidTextBox.Text + "' ";
        System.Data.SqlClient.SqlDataAdapter newda = new System.Data.SqlClient.SqlDataAdapter(query, con);
        System.Data.DataSet newds = new System.Data.DataSet();
        newda.Fill(newds);
        Session["tid"] = tidTextBox.Text;        
        GridView2.DataSource = newds;
        GridView2.DataBind();
        Label3.Visible = true;
        BillButton.Visible = true;
    }

    protected void BillButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("NormalBillorReport.aspx?val1=1");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--



function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=8", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 14px; width: 374px; position: absolute; top: -4px;
        height: 458px" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="orderedRadioButton" runat="server" AutoPostBack="True" GroupName="type"
            OnCheckedChanged="orderedRadioButton_CheckedChanged" Style="z-index: 100; left: 119px;
            position: absolute; top: 178px" Text="Pay By Cash" />
        <asp:RadioButton ID="BillingRadioButton" runat="server" AutoPostBack="True" GroupName="type"
            Style="z-index: 101; left: 119px; position: absolute; top: 209px" Text="Billing" OnCheckedChanged="BillingRadioButton_CheckedChanged" />
        <asp:TextBox ID="tidTextBox" runat="server" Style="z-index: 102; left: 59px; position: absolute;
            top: 95px" Visible="False"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 103; left: 59px; position: absolute;
            top: 61px" Text="Enter Transaction ID" Visible="False"></asp:Label>
        <asp:Button ID="GetButton" runat="server" Style="z-index: 104; left: 272px; position: absolute;
            top: 94px" Text="Get Details" Visible="False" OnClick="GetButton_Click" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tidTextBox"
            ErrorMessage="Transaction ID Required to get details" Style="z-index: 105; left: 62px;
            position: absolute; top: 119px" Enabled="False" Visible="False"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="72px" Style="z-index: 106;
            left: -10px; position: absolute; top: 174px" Width="583px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Style="z-index: 107; left: -7px; position: absolute;
            top: 147px" Text="Transaction Details" Visible="False"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" Style="z-index: 108; left: -10px;
            position: absolute; top: 336px" Width="579px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:Label ID="Label3" runat="server" Style="z-index: 109; left: -8px; position: absolute;
            top: 310px" Text="Bookwise Details" Visible="False"></asp:Label>
        <asp:Button ID="BillButton" runat="server" OnClick="BillButton_Click" Style="z-index: 110;
            left: 86px; position: absolute; top: 264px" Text="Generate Bill" Visible="False" />
        <asp:Label ID="Label4" runat="server" Style="z-index: 112; left: 32px; position: absolute;
            top: 13px" Text="Pay By Cash Feature" Visible="False"></asp:Label>
    </div>
    <br />
    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 67px; position: absolute; top: -48px" Text="Bill Generation Page" Width="305px"></asp:Label>
    &nbsp;&nbsp;<br />
    <input id="Button1" style="z-index: 109; left: 513px; position: absolute; top: 15px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 101;
        left: 565px; position: absolute; top: -53px" Text="Back" CausesValidation="False" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Menu ID="Menu2" runat="server" Height="14px" Style="z-index: 102; left: -148px;
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
                <asp:MenuItem NavigateUrl="~/AdminChangeBookShopName.aspx" Text="Change name of Book Shop"
                    Value="Change name of Book Shop"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/AdminCashierGenerateBill.aspx" Text="Generate Bill"
                    Value="Generate Bill"></asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:HyperLink ID="HyperLink1" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 103; left: -124px; position: absolute; top: 85px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" Height="14px" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
        Style="z-index: 104; left: -122px; position: absolute; top: 16px">Edit/Delete Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" Height="14px" NavigateUrl="~/AdminReportGenerationA.aspx"
        Style="z-index: 105; left: -125px; position: absolute; top: 39px">Report Generation</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" Height="14px" NavigateUrl="~/AdminChangeBookShopName.aspx"
        Style="z-index: 106; left: -159px; position: absolute; top: 62px" Width="184px">Change Book Shop Name</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
        Style="z-index: 107; left: -100px; position: absolute; top: -7px">Add Books</asp:HyperLink>
    <br />
    <br />
    <asp:Menu ID="Menu1" runat="server" Style="z-index: 109; left: -133px; position: absolute;
        top: 106px">
        <Items>
            <asp:MenuItem Text="Cashier Features" Value="Cashier Features">
                <asp:MenuItem NavigateUrl="~/ChangePasswordFeature.aspx" Text="Change Password" Value="Change Password">
                </asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
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
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
</asp:Content>

