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

        }

        protected void btn_saveAll_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
            string query = "";
            for(int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "update Users set ";
                query += "User_Email = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_email")).Text + "', ";
                query += "User_PW = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_password")).Text + "', ";
                query += "User_FirstName = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_firstName")).Text + "', ";
                query += "User_LastName = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_lastName")).Text + "', ";
                query += "User_Address = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_address")).Text + "', ";
                query += "User_PostalCode = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_postalCode")).Text + "', ";
                query += "User_Region = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_region")).Text + "', ";
                query += "User_active = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_active")).Text + "', ";
                query += "User_Type = '" + ((TextBox)Repeater1.Items[i].FindControl("tb_type")).Text + "' ";
                query += "where User_ID = " + ((Label)Repeater1.Items[i].FindControl("lbl_id")).Text + ";";
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
                query += "User_Email = '" + ((TextBox)e.Item.FindControl("tb_email")).Text + "', ";
                query += "User_PW = '" + ((TextBox)e.Item.FindControl("tb_password")).Text + "', ";
                query += "User_FirstName = '" + ((TextBox)e.Item.FindControl("tb_firstName")).Text + "', ";
                query += "User_LastName = '" + ((TextBox)e.Item.FindControl("tb_lastName")).Text + "', ";
                query += "User_Address = '" + ((TextBox)e.Item.FindControl("tb_address")).Text + "', ";
                query += "User_PostalCode = '" + ((TextBox)e.Item.FindControl("tb_postalCode")).Text + "', ";
                query += "User_Region = '" + ((TextBox)e.Item.FindControl("tb_region")).Text + "', ";
                query += "User_active = '" + ((TextBox)e.Item.FindControl("tb_active")).Text + "', ";
                query += "User_Type = '" + ((TextBox)e.Item.FindControl("tb_type")).Text + "' ";
                query += "where User_ID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);

                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
            if (e.CommandName.Equals("btn_delete"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
                string query = "delete from Users where User_ID = " + ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument;

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
                ((Label)e.Item.FindControl("lbl_id")).Text = dataRow["User_ID"].ToString();
                ((TextBox)e.Item.FindControl("tb_email")).Text = dataRow["User_Email"].ToString();
                ((TextBox)e.Item.FindControl("tb_password")).Text = dataRow["User_PW"].ToString();
                ((TextBox)e.Item.FindControl("tb_firstName")).Text = dataRow["User_FirstName"].ToString();
                ((TextBox)e.Item.FindControl("tb_lastName")).Text = dataRow["User_LastName"].ToString();
                ((TextBox)e.Item.FindControl("tb_address")).Text = dataRow["User_Address"].ToString();
                ((TextBox)e.Item.FindControl("tb_postalCode")).Text = dataRow["User_PostalCode"].ToString();
                ((TextBox)e.Item.FindControl("tb_region")).Text = dataRow["User_Region"].ToString();
                ((TextBox)e.Item.FindControl("tb_active")).Text = dataRow["User_active"].ToString();
                ((TextBox)e.Item.FindControl("tb_type")).Text = dataRow["User_Type"].ToString();
                ((ImageButton)e.Item.FindControl("btn_save")).CommandArgument = dataRow["User_ID"].ToString();
                ((ImageButton)e.Item.FindControl("btn_delete")).CommandArgument = dataRow["User_ID"].ToString();
            }
        }
    }
}