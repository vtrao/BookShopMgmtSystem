using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (IsPostBack == false)
        {
            TitleRadioButton.Checked = true;
            if(Request["val"]!=null)
                if (Request["val"].Equals("1"))
                {
                    Session["username"] = "";
                   // Label2.Text = Session["username"].ToString();
                }
        }
    }

    protected void GoButton_Click(object sender, EventArgs e)
    {
        String searchkeyword = "";
        if (TitleRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Title] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (AuthorRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                  "[Author3] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (CategoryRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Category] LIKE '%" + SearchTextBox.Text + "%'";
           
        }
        else if (ISBNRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [ISBN] LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        else if (KeywordRadioButton.Checked == true)
        {
            searchkeyword = "WHERE [Title]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author]  LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author2] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Author3] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[Category] LIKE '%" + SearchTextBox.Text + "%' OR " +
                                 "[ISBN]     LIKE '%" + SearchTextBox.Text + "%'";
            
        }
        Session["searchkey"] = SearchTextBox.Text;
        Server.Transfer("CustSearchBooksNor.aspx?value="+ searchkeyword);
    }
    protected void TitleRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void AuthorRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void CategoryRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void ISBNRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void KeywordRadioButton_CheckedChanged(object sender, EventArgs e){}
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Session["username"] = Login1.UserName.ToString();
    }
}
