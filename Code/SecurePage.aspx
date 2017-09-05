<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Page_Load(Object sender, EventArgs e)
    {
        //Session["username"] = Request["Login1.LayoutTemplate.UserName"].ToString();
        
        if (User.Identity.IsAuthenticated == false)
        {
            Server.Transfer("HomePage.aspx");
        }
        if (Roles.IsUserInRole("Administrator") == true)
        {
            //Server.Transfer("AdministratorHomePage.aspx");
            Response.Redirect("AdministratorHomePage.aspx");
        }
       else if(Roles.IsUserInRole("clerk") == true)
        {
            Server.Transfer("ClerkHomePage.aspx");   
        }
        else if(Roles.IsUserInRole("cashier") == true)
        {
            Server.Transfer("CashierHomePage.aspx");
        }
        else
        {
            Server.Transfer("CustomerHomePage.aspx");
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
    
    </div>
    </form>
</body>
</html>
