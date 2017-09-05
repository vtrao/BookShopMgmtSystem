<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <div style="z-index: 100; left: 15px; width: 480px; position: absolute; top: 70px;
            height: 333px">
            <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 174px; position: absolute;
                top: 4px" Text="Advanced Search"></asp:Label>
            <asp:TextBox ID="AuthorNameTextBox" runat="server" Height="22px" Style="z-index: 101;
                left: 220px; position: absolute; top: 89px" Width="155px"></asp:TextBox>
            <asp:TextBox ID="BookNameTextBox" runat="server" Height="22px" Style="z-index: 102;
                left: 220px; position: absolute; top: 44px" Width="155px"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Style="z-index: 103; left: 88px; position: absolute;
                top: 179px" Text="ISBN Number"></asp:Label>
            <asp:Label ID="Label3" runat="server" Style="z-index: 105; left: 88px; position: absolute;
                top: 136px" Text="Category"></asp:Label>
            <asp:Label ID="Label5" runat="server" Style="z-index: 106; left: 88px; position: absolute;
                top: 49px" Text="Book Name"></asp:Label>
            <asp:Label ID="Label6" runat="server" Style="z-index: 107; left: 88px; position: absolute;
                top: 94px" Text="Author Name"></asp:Label>
            <asp:DropDownList ID="CategoryDropDownList" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="Category" DataValueField="Category" Height="22px" Style="z-index: 108;
                left: 220px; position: absolute; top: 134px" Width="155px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [Category] FROM [BooksAvailable] ORDER BY [Category]">
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Height="35px" Style="z-index: 110; left: 117px;
                position: absolute; top: 228px" Text="Search" Width="224px" />
            <asp:DropDownList ID="ISBNDropDownList" runat="server" DataSourceID="SqlDataSource2"
                DataTextField="ISBN" DataValueField="ISBN" Height="22px" Style="z-index: 112;
                left: 220px; position: absolute; top: 179px" Width="155px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [ISBN] FROM [BooksAvailable]"></asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource3" Height="166px" Style="z-index: 101; left: 326px;
            position: absolute; top: 214px" Width="587px">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT DISTINCT [Title], [Edition], [Price], [Discount], [Category], [Publisher], [ISBN] FROM [BooksAvailable] WHERE (([Category] = @Category) OR ([Author] = @Author) OR ([Title] = @Title) OR ([ISBN] = @ISBN) OR ([Author2] = @Author2) OR ([Author3] = @Author3))">
            <SelectParameters>
                <asp:ControlParameter ControlID="CategoryDropDownList" Name="Category" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="AuthorNameTextBox" DefaultValue=" " Name="Author"
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="BookNameTextBox" DefaultValue="  " Name="Title"
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ISBNDropDownList" DefaultValue="" Name="ISBN" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="AuthorNameTextBox" DefaultValue=" " Name="Author2"
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="AuthorNameTextBox" DefaultValue=" " Name="Author3"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4"
            BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/SecurePage.aspx"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="162px" Style="z-index: 103;
            left: 26px; position: absolute; top: 97px" Width="404px">
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        </asp:Login>
    
    </div>
    </form>
</body>
</html>
