using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineShop
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_name")).Text = drv["name"].ToString();
                ((Label)e.Item.FindControl("lbl_email")).Text = drv["email"].ToString();
                ((Label)e.Item.FindControl("lbl_address")).Text = drv["address"].ToString();
                ((Label)e.Item.FindControl("lbl_city")).Text = drv["city"].ToString();
                ((Label)e.Item.FindControl("lbl_zipcode")).Text = drv["zipcode"].ToString();
                ((Label)e.Item.FindControl("lbl_nif")).Text = drv["nif"].ToString();
                ((Label)e.Item.FindControl("lbl_User_active")).Text = drv["User_active"].ToString();
                ((Label)e.Item.FindControl("lbl_User_Type")).Text = drv["User_Type"].ToString();
            }
        }
    }
}