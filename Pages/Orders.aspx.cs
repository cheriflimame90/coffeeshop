using System;
using System.Collections;
using System.Data;
using System.Globalization;
using System.Text;
using Entities;

public partial class Pages_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckIfAdministrator();

        if(IsPostBack)
        {
            Session["date1Open"] = null;
            Session["date2Open"] = null;
        }

        if (Session["date1Open"] != null && Session["date2Open"] != null)
        {
            txtDateOpen1.Text = Session["date1Open"].ToString();
            txtDateOpen2.Text = Session["date2Open"].ToString();
        }

        if (txtDateOpen1.Text != "" && txtDateOpen2.Text != "")
        {
            GenerateOrders(false, txtDateOpen1.Text, txtDateOpen2.Text);
            Session["date1Open"] = txtDateOpen1.Text;
            Session["date2Open"] = txtDateOpen2.Text;
        }

        if (txtDateClosed1.Text != "" && txtDateClosed2.Text != "")
        {
            GenerateOrders(true, txtDateClosed1.Text, txtDateClosed2.Text);
        }

        //GenerateLineChart("SELECT SUM(amount), DATENAME(month, date) + ' ' + DATENAME(YEAR, date) FROM orders GROUP BY DATENAME(month, date) + ' ' + DATENAME(YEAR, date)",
        //    "Units sold per month", LineChart1);
        GenerateLineChart("amount","client", "Orders per customer",LineChart2);
    }

    private void CheckIfAdministrator()
    {
        if ((string) Session["type"] != "administrator")
            Response.Redirect("~/Pages/Account/Login.aspx");
    }

    private void GenerateOrders(bool shipped, string beginDate, string endDate)
    {
        StringBuilder sb = new StringBuilder();
        DateTimeFormatInfo info = new CultureInfo("en-US", false).DateTimeFormat;
        string shippedString = shipped ? "Completed" : "Open";

        //Get Dates and convert to Unites States Format(en-US)
        DateTime date1 = Convert.ToDateTime(beginDate, info);
        DateTime date2 = Convert.ToDateTime(endDate, info);
        DateTime incrementalDate = date1;

        //Get grouped Orders
        while (incrementalDate <= date2)
        {
            sb.Append(string.Format(@"<b>{0} orders for {1} {2}</b><br />", shippedString, info.GetMonthName(incrementalDate.Month), incrementalDate.Year));
            ArrayList orderList = ConnectionClass.GetGroupedOrders(incrementalDate, date2, shipped);

            if (orderList.Count == 0)
            {
                sb.Append("No orders for this period<br/><br/>");
            }
            else
            {
                sb.Append(@"<table class='orderTable'>
                                <tr><th>Date</th><th>Client</th><th>Total</th></tr>");

                foreach (GroupedOrder groupedOrder in orderList)
                {
                    sb.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>$ {2}</td><td>{3}</td></tr>",
                                            groupedOrder.Date, groupedOrder.Client, groupedOrder.Total,
                                            string.Format("<a href='OrdersDetailed.aspx?client={0}&date={1}'>View Detail</a>", groupedOrder.Client, groupedOrder.Date)));
                }
                sb.Append("</table>");
            }

            //Increment Date to next month and set first day of new month to 1
            incrementalDate = incrementalDate.AddMonths(1);
            incrementalDate = new DateTime(incrementalDate.Year, incrementalDate.Month, 1);
        }

        if (shipped == false)
            lblOpenOrders.Text = sb.ToString();
        else
            lblClosedOrders.Text = sb.ToString();
    }

    //private void GeneratePieChart(string value, AjaxControlToolkit.PieChart chart)
    //{
    //    string query = string.Format("SELECT {0}, COUNT(id) AS total FROM orders GROUP BY {0}", value);
    //    DataTable dt = ConnectionClass.GetChartData(query);

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        chart.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
    //        {
    //            Category = row[value].ToString(),
    //            Data = Convert.ToDecimal(row["total"])
    //        });
    //    }
    //}

    private void GenerateLineChart(string sumObject, string groupByObject, string title, AjaxControlToolkit.LineChart chart)
    {
        string query = string.Format("SELECT SUM({0}), {1} FROM orders GROUP BY {1}", sumObject,groupByObject);
        DataTable dt = ConnectionClass.GetChartData(query);

        decimal[] x = new decimal[dt.Rows.Count];
        string[] y = new string[dt.Rows.Count];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            x[i] = Convert.ToInt32(dt.Rows[i][0].ToString());
            y[i] = (dt.Rows[i][1].ToString());
        }

        chart.Series.Add(new AjaxControlToolkit.LineChartSeries { Data = x });
        chart.CategoriesAxis = string.Join(",", y);
        chart.ChartTitle = title;

        if (x.Length > 3)
            chart.ChartWidth = (x.Length*75).ToString();
    }
}