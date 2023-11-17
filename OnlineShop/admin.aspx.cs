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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["accountType"] == null || Session["accountType"].Equals(0))
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btn_saveAll_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
            string query = "";
            for(int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "update Users set ";
                query += "email = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_email")).Text + "', ";
                query += "name = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_name")).Text + "', ";
                query += "address = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_address")).Text + "', ";
                query += "city = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_city")).Text + "', ";
                query += "zipcode = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_zipcode")).Text + "', ";
                query += "nif = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_nif")).Text + "', ";
                query += "User_active = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_active")).Text + "', ";
                query += "User_Type = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_type")).Text + "' ";
                query += "where userID = " + ((Label)Repeater1.Items[i].FindControl("lbl_id")).Text + ";";
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
                string query = "update Users set ";
                query += "email = '" + ((TextBox)e.Item.FindControl("tb_email")).Text + "', ";
                query += "name = '" + ((TextBox)e.Item.FindControl("tb_name")).Text + "', ";
                query += "address = '" + ((TextBox)e.Item.FindControl("tb_address")).Text + "', ";
                query += "city = '" + ((TextBox)e.Item.FindControl("tb_city")).Text + "', ";
                query += "zipcode = '" + ((TextBox)e.Item.FindControl("tb_zipcode")).Text + "', ";
                query += "nif = '" + ((TextBox)e.Item.FindControl("tb_nif")).Text + "', ";
                query += "User_active = '" + ((TextBox)e.Item.FindControl("tb_active")).Text + "', ";
                query += "User_Type = '" + ((TextBox)e.Item.FindControl("tb_type")).Text + "' ";
                query += "where userID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);

                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
            if (e.CommandName.Equals("btn_delete"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
                string query = "delete from Users where userID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);

                myCommand.ExecuteNonQuery();
                myConn.Close();

                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dataRow = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_id")).Text = dataRow["userID"].ToString();
                ((TextBox)e.Item.FindControl("tb_name")).Text = dataRow["name"].ToString();
                ((TextBox)e.Item.FindControl("tb_email")).Text = dataRow["email"].ToString();
                ((TextBox)e.Item.FindControl("tb_address")).Text = dataRow["address"].ToString();
                ((TextBox)e.Item.FindControl("tb_city")).Text = dataRow["city"].ToString();
                ((TextBox)e.Item.FindControl("tb_zipcode")).Text = dataRow["zipcode"].ToString();
                ((TextBox)e.Item.FindControl("tb_nif")).Text = dataRow["nif"].ToString();
                ((TextBox)e.Item.FindControl("tb_active")).Text = dataRow["User_active"].ToString();
                ((TextBox)e.Item.FindControl("tb_type")).Text = dataRow["User_Type"].ToString();
                ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument = dataRow["userID"].ToString();
                ((ImageButton)e.Item.FindControl("btn_delete")).CommandArgument = dataRow["userID"].ToString();
            }
        }
    }
}