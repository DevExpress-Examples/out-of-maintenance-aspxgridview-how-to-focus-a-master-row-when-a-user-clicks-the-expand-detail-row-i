using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e) {
        Session["CategoryID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}