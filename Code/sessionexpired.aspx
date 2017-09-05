<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("HomePage.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button2_onclick() {
myWin= open("Helpbutton.aspx?help=24", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <br />
    <input id="Button2" style="z-index: 100; left: 508px; position: absolute; top: 18px"
        type="button" value="Help" language="javascript" onclick="return Button2_onclick()" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Height="35px"
        Style="z-index: 100; left: 83px; position: absolute; top: 98px" Text="Sorry ! Your Session Expired"
        Width="354px"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Style="z-index: 101; left: 155px; position: absolute;
        top: 166px" Text="Click here to Continue with User Login"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 103;
        left: 213px; position: absolute; top: 210px" Text="Continue..." />
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
    <br />
</asp:Content>

