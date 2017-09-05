<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>OnLine Book Shop Management System</title>
    <link rel=stylesheet type="text/css" href="style.css">
<script language="javascript" type="text/javascript">
<!--
function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=1", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>
</head>
<body bgcolor="white" background="images/The backGround12.JPG">
    <form id="form1" runat="server">
    <div>
        &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp;
        &nbsp; &nbsp;&nbsp;
        <div style="z-index: 103; left: 265px; width: 88px; position: absolute; top: 124px;
            height: 46px">
            <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 189px; position: absolute;
                top: 50px" Text="Existing Users" Width="86px"></asp:Label>
            &nbsp; &nbsp;
            <asp:Label ID="Label2" runat="server" Style="z-index: 105; left: 501px; position: absolute;
                top: 62px" Text="New User" Width="72px"></asp:Label>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
                Style="z-index: 102; left: 513px; position: absolute; top: 227px" Width="51px">Sign Up</asp:HyperLink>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <img src="images/connected_multiple_big.jpg" style="z-index: 104; left: 507px; position: absolute;
                top: 147px; height: 64px; width: 61px;" />
        </div>
        &nbsp;
        <div style="z-index: 104; left: 0px; width: 113px; position: absolute; top: 121px;
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
            <img src="images/books.JPG" style="z-index: 112; left: 36px; position: absolute;
                top: 247px; height: 35px; width: 46px;" />
            <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 105;
                left: 17px; position: absolute; top: 298px">Order a Book</asp:HyperLink>
            <img src="images/J0321179.JPG" style="z-index: 113; left: 37px; width: 44px; position: absolute;
                top: 330px; height: 31px" />
            <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
                Style="z-index: 114; left: 7px; position: absolute; top: 384px" Width="105px">Register With Us</asp:HyperLink>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div style="z-index: 105; left: 183px; width: 43px; position: absolute; top: 367px;
            height: 20px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustRegistrationPage.aspx"
                Style="z-index: 100; left: -40px; position: absolute; top: 73px">New User</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ContactUs.aspx" Style="z-index: 101;
                left: -40px; position: absolute; top: 97px">Contact Us</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Help.aspx" Style="z-index: 102;
                left: -40px; position: absolute; top: 118px">Help</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 103;
                left: -40px; position: absolute; top: 52px">User Login</asp:HyperLink>
            &nbsp;
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/HomePage.aspx" Style="z-index: 104;
                left: -40px; position: absolute; top: 8px">Home</asp:HyperLink>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/AboutUs.aspx" Style="z-index: 106;
                left: -40px; position: absolute; top: 30px">About</asp:HyperLink>
        </div>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Overline="True" Font-Size="XX-Large"
            Font-Underline="True" Height="41px" Style="z-index: 100; left: 321px; position: absolute;
            top: 53px" Text="OnLine Book Shop" Width="273px"></asp:Label>
        &nbsp;&nbsp;
        <div style="z-index: 106; left: 120px; width: 171px; position: absolute; top: 118px;
            height: 215px">
            <asp:RadioButton ID="TitleRadioButton" runat="server" GroupName="search"
                OnCheckedChanged="TitleRadioButton_CheckedChanged" Style="z-index: 100; left: 17px;
                position: absolute; top: 73px" Text="Title" />
            <asp:RadioButton ID="AuthorRadioButton" runat="server" GroupName="search"
                OnCheckedChanged="AuthorRadioButton_CheckedChanged" Style="z-index: 101; left: 17px;
                position: absolute; top: 99px" Text="Author" />
            <strong><span style="text-decoration: underline"></span></strong>
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
                left: 18px; position: absolute; top: 211px" Text="Go...Search" Width="108px" />
            <br />
            &nbsp; &nbsp;&nbsp; <strong><span style="text-decoration: underline">Quick Search&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SearchTextBox"
                    ErrorMessage="Search Key Required" Style="z-index: 108; left: 103px; position: absolute;
                    top: 70px" Width="35px"></asp:RequiredFieldValidator>
            </span></strong>
        </div>
            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/SecurePage.aspx" Style="z-index: 101;
                left: 306px; position: absolute; top: 237px" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="140px" Width="245px" BorderPadding="4" ForeColor="#333333">
                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="0.9em" />
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <TextBoxStyle Font-Size="0.8em" />
                <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                    Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                <LayoutTemplate>
                    <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" style="width: 245px; height: 140px">
                                    <tr>
                                        <td align="center" colspan="2" style="font-weight: bold; font-size: 0.9em; color: white;
                                            background-color: #507cd1">
                                            Log In</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1"
                                                BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                                Font-Size="0.8em" ForeColor="#284E98" OnClick="LoginButton_Click" Text="Log In"
                                                ValidationGroup="Login1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        <input id="Button1" style="z-index: 107; left: 652px; position: absolute; top: 222px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    
    </div>
    </form>
</body>
</html>
