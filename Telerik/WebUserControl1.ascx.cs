using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Telerik
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        BarcodeDBEntities1 bdent = new BarcodeDBEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Label4.Text);
            Item item = bdent.Items.FirstOrDefault(x=>x.Id==id);
            item.ItemName = txtitemname.Text;
            item.ItemStatus = txtitemstatus.Text;
            bdent.SaveChanges();
            Response.Redirect("WebForm2.aspx");
        }
    }
}