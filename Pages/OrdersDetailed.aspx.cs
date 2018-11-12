using System;
using System.Collections;
using System.Net;
using System.Net.Mail;
using Entities;

namespace Pages
{
    public partial class Pages_OrdersDetailed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckIfAdministrator();
            lblTitle.Text = string.Format("<h2>Client: {0}<br />Date: {1}</h2>", Request.QueryString["client"], Request.QueryString["date"]);
        }

        protected void btnShip_Click(object sender, EventArgs e)
        {
            //Get variables from Url
            string client = Request.QueryString["client"];
            DateTime date = Convert.ToDateTime(Request.QueryString["date"]);

            //Get user info + user's placed orders
            User user = ConnectionClass.GetUserDetails(client);
            ArrayList orderList = ConnectionClass.GetDetailedOrders(client, date);

            //Update database and send confirmation e-mail. Afterwards send user back to 'Orders' Page
            ConnectionClass.UpdateOrders(client, date);
            SendEmail(user.Name, user.Email, orderList);
            Response.Redirect("~/Pages/Orders.aspx");
        }

        private void CheckIfAdministrator()
        {
            if ((string)Session["type"] != "administrator")
            {
                Response.Redirect("~/Pages/Account/Login.aspx");
            }
        }

        private void SendEmail(string client, string email, ArrayList orderList)
        {
            MailAddress to = new MailAddress(email);
			
			//TODO: Fill in your own e-mail here!
            MailAddress from = new MailAddress("your_email@gmail.com");
            string body = string.Format(
@"Dear {0},
We are happy to announce that your order placed on {1} has been completed and is ready for pickup.

Your ordered products:
{2}

You can come collect your order at your earliest convienence.

Kind regards
Michiel", client, Request.QueryString["date"], GenerateOrderedItems(orderList));

            MailMessage mail = new MailMessage(from, to);
            mail.Body = body;
            mail.Subject = "Your order has been prepared";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
			
			//TODO: Fill in your own e-mail and password here!
            smtp.Credentials = new NetworkCredential("your_email@gmail.com", "yourPassword");
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }

        private string GenerateOrderedItems(ArrayList orderList)
        {
            string result = "";
            double totalAmount = 0;

            foreach (Order order in orderList)
            {
                result += string.Format(@"
- {0} ({1} €)           X {2}                 = {3} €",
                    order.Product, order.Price, order.Amount, (order.Amount * order.Price));
                totalAmount += (order.Amount * order.Price);
            }

            result += string.Format(@"

Total Amount: {0} €", totalAmount);
            return result;
        }
    }
}