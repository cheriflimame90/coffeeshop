using System;

public partial class Pages_Account_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthenticateAdministrator();
    }

    private void AuthenticateAdministrator()
    {
        if ((string)Session["type"] != "administrator")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }
}