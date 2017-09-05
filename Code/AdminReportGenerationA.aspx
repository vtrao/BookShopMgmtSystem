<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

   // private System.Drawing.Printing.PrintDocument docToPrint =
     //   new System.Drawing.Printing.PrintDocument();
    //System.
    protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
    protected void GoBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("AdministratorHomePage.aspx");
    }

    /*protected void Button1_Click(object sender, EventArgs e)
    {
        // Allow the user to choose the page range he or she would
        // like to print.
        PrintDialog1.AllowSomePages = true;

        // Show the help button.
        PrintDialog1.ShowHelp = true;

        // Set the Document property to the PrintDocument for 
        // which the PrintPage Event has been handled. To display the
        // dialog, either this property or the PrinterSettings property 
        // must be set 
        PrintDialog1.Document = docToPrint;

        DialogResult result = PrintDialog1.ShowDialog();

        // If the result is OK then print the document.
        if (result == DialogResult.OK)
        {
            docToPrint.Print();
        }               
    }
    private void document_PrintPage(object sender,
        System.Drawing.Printing.PrintPageEventArgs e)
    {

        // Insert code to render the page here.
        // This code will be called when the control is drawn.

        // The following code will render a simple
        // message on the printed document.
        string text = "In document_PrintPage method.";
        System.Drawing.Font printFont = new System.Drawing.Font
            ("Arial", 35, System.Drawing.FontStyle.Regular);

        // Draw the content.
        e.Graphics.DrawString(text, printFont,
            System.Drawing.Brushes.Black, 10, 10);
    }*/

    protected void OrdersRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=1");        
    }

    protected void CartRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=2");
    }

    protected void SalesRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=3");
    }

    protected void InventoryRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=6");
    }

    protected void OutRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=7");
    }

    protected void UsersRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=8");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void PurchaseRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=4");
    }

    protected void BranchesRadioButton8_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=9");
    }

    protected void SalesURadioButton_CheckedChanged(object sender, EventArgs e)
    {
        Server.Transfer("ReportGenerator.aspx?value=5");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
<!--

function Button1_onclick() {
myWin= open("Helpbutton.aspx?help=13", "displayWindow",
    "width=400,height=300,status=no,toolbar=no,menubar=no");
}

// -->
</script>

    <div style="z-index: 105; left: -35px; width: 282px; position: absolute; top: 7px;
        height: 239px">
        <asp:RadioButton ID="OrdersRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 100; left: 69px; position: absolute; top: 12px" Text="Orders Report" OnCheckedChanged="OrdersRadioButton_CheckedChanged" />
        <asp:RadioButton ID="CartRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 101; left: 69px; position: absolute; top: 67px" Text="Cart Report " OnCheckedChanged="CartRadioButton_CheckedChanged" />
        <asp:RadioButton ID="SalesRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 102; left: 69px; position: absolute; top: 122px" Text="Sales Report" OnCheckedChanged="SalesRadioButton_CheckedChanged" />
        <asp:RadioButton ID="InventoryRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 103; left: 68px; position: absolute; top: 287px" Text="Stock of Books Report" OnCheckedChanged="InventoryRadioButton_CheckedChanged" />
        <asp:RadioButton ID="OutRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 104; left: 68px; position: absolute; top: 342px" Text="Out of Stock Books Report" OnCheckedChanged="OutRadioButton_CheckedChanged" />
        <asp:RadioButton ID="UsersRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 105; left: 68px; position: absolute; top: 397px" Text="Current Users Report" OnCheckedChanged="UsersRadioButton_CheckedChanged" />
        <asp:RadioButton ID="PurchaseRadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 106; left: 68px; position: absolute; top: 177px" Text="Sales Report(Delivered)" OnCheckedChanged="PurchaseRadioButton_CheckedChanged" />
        <asp:RadioButton ID="BranchesRadioButton8" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 107; left: 68px; position: absolute; top: 459px" Text="Current Branches Report" OnCheckedChanged="BranchesRadioButton8_CheckedChanged" />
        <asp:Label ID="Label1" runat="server" Style="z-index: 108; left: 54px; position: absolute;
            top: -24px" Text="Select the Report to generate"></asp:Label>
        <asp:Label ID="Label3" runat="server" Style="z-index: 109; left: 277px; position: absolute;
            top: 1px" Text="Genrates a report on the current orders pending, on both the books that our book store has and on query for those that we dont have" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label4" runat="server" Style="z-index: 110; left: 277px; position: absolute;
            top: 63px" Text="Generates a Report on those Books that are not yet purchased and still in the cart for a long time more than a week" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label5" runat="server" Style="z-index: 111; left: 277px; position: absolute;
            top: 124px" Text="Generates a Report on OverAll Sales of Books" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label6" runat="server" Style="z-index: 112; left: 277px; position: absolute;
            top: 289px" Text="Gives the List of Books Available along with their Count" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label7" runat="server" Style="z-index: 113; left: 277px; position: absolute;
            top: 344px" Text="Generates a Report on the Books that are Out of Stock " ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label8" runat="server" Style="z-index: 114; left: 277px; position: absolute;
            top: 393px" Text="Generates a Report on Current Users of System and their Last Usage i.e.., Login" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label9" runat="server" Style="z-index: 115; left: 277px; position: absolute;
            top: 179px" Text="Generates a Report on Sales that are delivered" ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:Label ID="Label10" runat="server" Style="z-index: 116; left: 277px; position: absolute;
            top: 461px" Text="Generats a Report on the Current Outlets " ForeColor="ControlText" Height="16px" Width="395px"></asp:Label>
        <asp:RadioButton ID="SalesURadioButton" runat="server" AutoPostBack="True" GroupName="report"
            Style="z-index: 117; left: 67px; position: absolute; top: 232px" Text="Sales Report (UnDelivered)" OnCheckedChanged="SalesURadioButton_CheckedChanged" />
        <asp:Label ID="Label11" runat="server" ForeColor="ControlText" Height="16px" Style="z-index: 118;
            left: 277px; position: absolute; top: 234px" Text="Generates a Report on Sales of Books that are not yet Delivered"
            Width="395px"></asp:Label>
        <input id="Button1" style="z-index: 119; left: 475px; position: absolute; top: -29px"
            type="button" value="Help" language="javascript" onclick="return Button1_onclick()" />
    </div>
    <br />
    <div style="z-index: 109; left: 599px; width: 168px; position: absolute; top: -36px;
        height: 411px">
        &nbsp; &nbsp; &nbsp;&nbsp;
    </div>
    <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 100;
        left: 536px; position: absolute; top: -52px" Text="Back" />
    &nbsp;<br />
    &nbsp;<br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Style="z-index: 101;
        left: 65px; position: absolute; top: -51px" Text="Administrator Report Generator page"
        Width="305px"></asp:Label>
    &nbsp;<br />
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
    <asp:Menu ID="Menu1" runat="server" Height="14px" Style="z-index: 103; left: -147px;
        position: absolute; top: 111px">
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
    <asp:HyperLink ID="HyperLink3" runat="server" Height="14px" NavigateUrl="~/ChangePasswordFeature.aspx"
        Style="z-index: 104; left: -125px; position: absolute; top: 88px">Change Password</asp:HyperLink>
    <asp:HyperLink ID="HyperLink6" runat="server" Height="14px" NavigateUrl="~/AdminClerkDeleteorEditBooks.aspx"
        Style="z-index: 105; left: -123px; position: absolute; top: 19px">Edit/Delete Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink8" runat="server" Height="14px" NavigateUrl="~/AdminChangeBookShopName.aspx"
        Style="z-index: 106; left: -160px; position: absolute; top: 65px" Width="184px">Change Book Shop Name</asp:HyperLink>
    <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/AdminClerkAddBooks.aspx"
        Style="z-index: 107; left: -101px; position: absolute; top: -4px">Add Books</asp:HyperLink>
    <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/AdminCashierGenerateBill.aspx"
        Style="z-index: 108; left: -110px; position: absolute; top: 42px">Generate Bill</asp:HyperLink>
    <br />
</asp:Content>

