using System;
using System.Collections;
using System.IO;

public partial class Pages_Coffee_Add : System.Web.UI.Page
{
    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthenticateAdministrator();
        string selectedValue = ddlImage.SelectedValue;
        ShowImages();
        ddlImage.SelectedValue = selectedValue;
    }

    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/Images/Coffee/") + filename);
            lblResult.Text = "Image " + filename + " succesfully uploaded!";
            Page_Load(sender, e);
        }
        catch (Exception)
        {
            lblResult.Text = "Upload failed!";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text;
            string type = txtType.Text;
            double price = Convert.ToDouble(txtPrice.Text);
            price = price / 100;
            string roast = txtRoast.Text;
            string country = txtCountry.Text;
            string image = "../Images/Coffee/" + ddlImage.SelectedValue;
            string review = txtReview.Text;

            Coffee coffee = new Coffee(name, type, price, roast, country, image, review);
            ConnectionClass.AddCoffee(coffee);
            lblResult.Text = "Upload succesful!";
            ClearTextFields();
        }
        catch (Exception)
        {
            lblResult.Text = "Upload failed!";
        }
    }
    #endregion

    #region Methods
    private void ShowImages()
    {
        //Get all filepaths
        string[] images = Directory.GetFiles(Server.MapPath("~/Images/Coffee/"));

        //Get all filenames and add them to an arraylist
        ArrayList imageList = new ArrayList();

        foreach (string image in images)
        {
            string imageName = image.Substring(image.LastIndexOf(@"\") + 1);
            imageList.Add(imageName);
        }

        //Set the arrayList as the dropdownview's datasource and refresh
        ddlImage.DataSource = imageList;
        ddlImage.DataBind();
    }

    private void ClearTextFields()
    {
        txtCountry.Text = "";
        txtName.Text = "";
        txtPrice.Text = "";
        txtReview.Text = "";
        txtRoast.Text = "";
        txtType.Text = "";
    }

    private void AuthenticateAdministrator()
    {
        if ((string)Session["type"] != "administrator")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }
    #endregion
}