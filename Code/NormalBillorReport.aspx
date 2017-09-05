<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void GoBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("AdminCashierGenerateBill.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["val1"].Equals("1"))
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            con.Open();
            String query = "SELECT [UserName],[Date],[Number of Copies],[Total Cost],[LocationMOP] FROM [BooksSold] where [TransactionID]='" + Session["tid"].ToString() + "' ";
            System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, con);
            System.Data.DataSet ds = new System.Data.DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            query = "SELECT  [Book Name],[Publisher],[noc],[Total Cost] FROM [CustCart] where [TransactionID]='" + Session["tid"].ToString() + "' ";
            System.Data.SqlClient.SqlDataAdapter newda = new System.Data.SqlClient.SqlDataAdapter(query, con);
            System.Data.DataSet newds = new System.Data.DataSet();
            newda.Fill(newds);
            GridView2.DataSource = newds;
            GridView2.DataBind();             
        }
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Style="z-index: 100; left: 342px; position: absolute;
            top: 83px" Text="Universal Books Paradise"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="z-index: 101; left: 162px; position: absolute;
            top: 81px" Text="Logo here" Width="77px"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" Style="z-index: 102; left: 82px; position: absolute;
            top: 158px" Width="676px">
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" Style="z-index: 103; left: 82px; position: absolute;
            top: 293px" Width="677px">
        </asp:GridView>
        <asp:Button ID="GoBack" runat="server" OnClick="GoBack_Click" Style="z-index: 105;
            left: 833px; position: absolute; top: 49px" Text="Back" />
    
    </div>
    </form>
</body>
</html>
