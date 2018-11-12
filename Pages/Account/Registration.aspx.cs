using System;

public partial class Pages_Account_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        //Create a new user
        User user = new User(txtName.Text, txtPassword.Text, txtEmail.Text, "user");

        //Register the user and return a result message
        lblResult.Text = ConnectionClass.RegisterUser(user);
    }
}