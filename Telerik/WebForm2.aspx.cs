using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace Telerik
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        BarcodeDBEntities1 bdent = new BarcodeDBEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void fillGrid()
        {
            RadGrid1.DataSource = bdent.Items.ToList();
            RadGrid1.DataBind();
        }

        protected void RadGrid1_NeedDataSource(object sender, Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = bdent.Items.ToList();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button Button1 = sender as Button;
            GridDataItem item = Button1.NamingContainer as GridDataItem;
            string strID = item["ID"].Text;
            string itemname= item["ItemName"].Text;
            string itemstatus = item["ItemStatus"].Text;

            (usercontrol1.FindControl("Label4") as Label).Text = strID;
            (usercontrol1.FindControl("txtitemname") as TextBox).Text = itemname;
            (usercontrol1.FindControl("txtitemstatus") as TextBox).Text = itemstatus;
            RadWindow1.VisibleOnPageLoad = true;
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button Button2 = sender as Button;
            GridDataItem item = Button2.NamingContainer as GridDataItem;
            int id= Convert.ToInt32(item["ID"].Text);
            Item item1 = bdent.Items.FirstOrDefault(x => x.Id == id);
            bdent.Items.Remove(item1);
            bdent.SaveChanges();
            fillGrid();
        }

        protected void RadGrid1_DetailTableDataBind(object sender, GridDetailTableDataBindEventArgs e)
        {
            GridDataItem item = e.DetailTableView.ParentItem as GridDataItem;
            object idObj = item.GetDataKeyValue("Id");
            int id = Convert.ToInt32(idObj);
            e.DetailTableView.DataSource = bdent.Items.Where(x => x.Id == id).ToList();
        }
    }
}