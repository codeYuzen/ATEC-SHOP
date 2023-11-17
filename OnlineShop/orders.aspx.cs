using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineShop
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["accountType"] == null || Session["accountType"].Equals(0))
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dataRow = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_id")).Text = dataRow["orderID"].ToString();
                ((TextBox)e.Item.FindControl("tb_clientName")).Text = dataRow["clientName"].ToString();
                ((TextBox)e.Item.FindControl("tb_productName")).Text = dataRow["productName"].ToString();
                ((TextBox)e.Item.FindControl("tb_amount")).Text = dataRow["amount"].ToString();
                ((TextBox)e.Item.FindControl("tb_date")).Text = dataRow["date"].ToString();
                ((TextBox)e.Item.FindControl("tb_zipcode")).Text = dataRow["Order_Status"].ToString();
            }
        }

        protected void btn_saveAll_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
            string query = "";
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "update orders set ";
                query += "clientName = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_clientName")).Text + "', ";
                query += "productName = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_productName")).Text + "', ";
                query += "amount = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_amount")).Text + "', ";
                query += "date = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_date")).Text + "', ";
                query += "zipcode = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_zipcode")).Text + "', ";
                query += "where orderID = " + ((Label)Repeater1.Items[i].FindControl("lbl_id")).Text + ";";
            }

            myConn.Open();
            SqlCommand myCommand = new SqlCommand(query, myConn);

            myCommand.ExecuteNonQuery();
            myConn.Close();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btn_save"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
                string query = "update Orders set ";
                query += "clientName = '" + ((TextBox)e.Item.FindControl("tb_clientName")).Text + "', ";
                query += "productName = '" + ((TextBox)e.Item.FindControl("tb_productName")).Text + "', ";
                query += "amount = '" + ((TextBox)e.Item.FindControl("tb_amount")).Text + "', ";
                query += "date = '" + ((TextBox)e.Item.FindControl("tb_date")).Text + "', ";
                query += "zipcode = '" + ((TextBox)e.Item.FindControl("tb_zipcode")).Text + "' ";
                query += "where orderID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);

                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
            if (e.CommandName.Equals("btn_delete"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
                string query = "delete from Orders where orderID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);

                myCommand.ExecuteNonQuery();
                myConn.Close();

                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}