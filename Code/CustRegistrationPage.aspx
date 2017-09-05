<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        Session["username1"] = CreateUserWizard1.UserName.ToString();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=19", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 108; left: 45px; width: 448px; position: absolute; top: 103px;
        height: 441px">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE"
            BorderStyle="Solid" BorderWidth="1px" CancelDestinationPageUrl="~/HomePage.aspx"
            ContinueDestinationPageUrl="~/CustProfile.aspx?myvalue=1" Font-Names="Verdana" Font-Size="0.8em"
            Height="272px" Style="z-index: 100; left: -38px; position: absolute; top: -64px"
            Width="515px" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server" Title="New Account Created Successfully">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <SideBarButtonStyle Font-Names="Verdana" ForeColor="White" BackColor="#507CD1" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <HeaderStyle BackColor="#284E98" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Size="0.9em" />
            <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
            <StepStyle Font-Size="0.8em" />
        </asp:CreateUserWizard>
        <input id="Button1" style="z-index: 101; left: 502px; position: absolute; top: -87px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
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
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 100;
        left: 6px; position: absolute; top: -47px" Text="Registration Page for a Valid User Name and Create a New User Account"
        Width="579px"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="z-index: 109; left: -275px; width: 113px; position: absolute; top: -50px;
        height: 606px">
        <img src="images/globe.JPG" style="z-index: 107; left: 38px; width: 43px; position: absolute;
            top: 11px; height: 31px" />
        <img src="images/Contact-S.jpg" style="z-index: 108; left: 41px; width: 37px; position: absolute;
            top: 90px; height: 27px" />
        <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/AboutUs.aspx" Style="z-index: 100;
            left: 41px; position: absolute; top: 58px">About</asp:HyperLink>
        <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/ContactUs.aspx" Style="z-index: 101;
            left: 26px; position: absolute; top: 133px">Contact Us</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/CustSearchBooksNor.aspx"
            Style="z-index: 102; left: 12px; position: absolute; top: 215px">Normal Search</asp:HyperLink>
        <img src="images/search.jpg" style="z-index: 110; left: 37px; width: 45px; position: absolute;
            top: 165px; height: 34px" />
        &nbsp; &nbsp;&nbsp;
        <img src="images/books.JPG" style="z-index: 112; left: 36px; width: 46px; position: absolute;
            top: 247px; height: 35px" />
        <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 105;
            left: 17px; position: absolute; top: 298px">Order a Book</asp:HyperLink>
        <img src="images/J0321179.JPG" style="z-index: 113; left: 37px; width: 44px; position: absolute;
            top: 330px; height: 31px" />
        <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
            Style="z-index: 114; left: 7px; position: absolute; top: 384px" Width="105px">Register With Us</asp:HyperLink>
    </div>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ContactUs.aspx" Style="z-index: 101;
        left: -118px; position: absolute; top: 40px">Contact Us</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Help.aspx" Style="z-index: 102;
        left: -99px; position: absolute; top: 62px">Help</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 103;
        left: -119px; position: absolute; top: 20px">User Login</asp:HyperLink>
    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 104;
        left: -103px; position: absolute; top: -2px">Home</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/AboutUs.aspx" Style="z-index: 106;
        left: -103px; position: absolute; top: -27px">About</asp:HyperLink>
    <br />
    <br />
</asp:Content>

