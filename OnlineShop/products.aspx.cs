using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineShop
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_serial")).Text = drv["serial"].ToString();
                ((Label)e.Item.FindControl("lbl_price")).Text = drv["price"].ToString();
                ((Label)e.Item.FindControl("lbl_category")).Text = drv["category"].ToString();
                ((Label)e.Item.FindControl("lbl_manufacturer")).Text = drv["manufacturer"].ToString();
                ((Label)e.Item.FindControl("lbl_model")).Text = drv["model"].ToString();
                ((Label)e.Item.FindControl("lbl_color")).Text = drv["color"].ToString();
                ((Label)e.Item.FindControl("lbl_photo")).Text = drv["photo"].ToString();
                ((Label)e.Item.FindControl("lbl_stock")).Text = drv["stock"].ToString();
                ((Label)e.Item.FindControl("lbl_description")).Text = drv["description"].ToString();
            }
        }
    }
}