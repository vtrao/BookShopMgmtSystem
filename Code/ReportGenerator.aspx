<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void GoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminReportGenerationA.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // call norm..............
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=23", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <br />
    <br />
    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 100;
        left: 562px; position: absolute; top: -52px" Text="Back" />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Style="z-index: 101;
        left: 66px; position: absolute; top: -37px" Text="Label" Width="332px"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" Style="z-index: 102; left: 8px;
        position: absolute; top: 51px" Width="602px">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <input id="Button1" style="z-index: 100; left: 543px; position: absolute; top: 18px"
        type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Style="z-index: 104;
        left: 404px; position: absolute; top: 8px" Text="Print" />
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

