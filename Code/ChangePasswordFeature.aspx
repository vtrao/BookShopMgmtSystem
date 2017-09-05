<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void GoBack_Click(object sender, EventArgs e)
    {
        if (Session["username"].Equals("administrator"))
        {
            Server.Transfer("AdministratorHomePage.aspx");
        }
        else if (Session["username"].Equals("cashier"))
        {
            Server.Transfer("CashierHomePage.aspx");
        }
        else if (Session["username"].Equals("clerk"))
        {
            Server.Transfer("ClerkHomePage.aspx");
        }
        else
        {
            Server.Transfer("CustomerHomePage.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Password Changing Feature of " + Session["username"].ToString();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=14", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 59px; position: absolute; top: -45px" Text="Change password" Width="305px"></asp:Label>
    &nbsp;&nbsp;
    <input id="Button1" style="z-index: 101; left: 466px; position: absolute; top: 139px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; 
    <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE"
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="0.8em" Height="171px" Style="z-index: 104; left: 31px; position: absolute;
        top: 74px" Width="394px">
        <CancelButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <PasswordHintStyle Font-Italic="True" ForeColor="#507CD1" />
        <ChangePasswordButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        <TextBoxStyle Font-Size="0.8em" />
    </asp:ChangePassword>
    &nbsp; &nbsp;&nbsp;<br />
    <br />
    <img src="images/connected_data_big.jpg" style="z-index: 100; left: 488px; position: absolute;
        top: -12px" />
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
    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 102;
        left: 461px; position: absolute; top: -50px" Text="Back" />
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Style="z-index: 103; left: 31px; position: absolute;
        top: -23px" Text="r " Width="390px"></asp:Label>
    <br />
    <br />
</asp:Content>

