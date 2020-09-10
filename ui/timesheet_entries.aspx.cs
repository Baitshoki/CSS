using System.IO;
using System.Drawing;
using System.Collections;
using System.Configuration;
using System.Threading;
using System.Data;
//using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System;

public partial class ui_timesheet_entries : System.Web.UI.Page
{
    string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];
    SqlConnection conn = new SqlConnection();

    SqlDataAdapter adapt;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //  lblSessionEmail.Text = Request.QueryString["EmailAddress"];

            LoadTimesheet();
        }
    }

    private void LoadTimesheet()
    {

        dt = new DataTable();

        string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];

        SqlConnection conn = new SqlConnection(cnnstr);

        conn.Open();

        string Query = @"SELECT  dbo.ClientDetails.ClientID, dbo.ClientDetails.EmailAddress, dbo.Notes.UpdatedDate, dbo.Notes.SubscriberNotes
                             FROM  dbo.ClientDetails RIGHT OUTER JOIN
                            dbo.Notes ON dbo.ClientDetails.ClientID = dbo.Notes.ClientID
                            WHERE dbo.ClientDetails.EmailAddress is not null";

        adapt = new SqlDataAdapter(Query, conn);

        adapt.Fill(dt);

        if (dt.Rows.Count > 0)
        {
           GridViewTimesheet.DataSource = dt;

            GridViewTimesheet.DataBind();
        }

        else
        {

            dt.Rows.Add(dt.NewRow());

            GridViewTimesheet.DataSource = dt;

            GridViewTimesheet.DataBind();

            int TotalColumns = GridViewTimesheet.Rows[0].Cells.Count;

            GridViewTimesheet.Rows[0].Cells.Clear();

            GridViewTimesheet.Rows[0].Cells.Add(new TableCell());

            GridViewTimesheet.Rows[0].Cells[0].ColumnSpan = TotalColumns;

            GridViewTimesheet.Rows[0].Cells[0].Text = "No records Found";

        }

        conn.Close();

    }


    ////using (var conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
    ////{

    ////    string query = @"SELECT  dbo.ClientDetails.ClientID, dbo.ClientDetails.EmailAddress, dbo.Notes.UpdatedDate, dbo.Notes.SubscriberNotes
    ////                     FROM  dbo.ClientDetails RIGHT OUTER JOIN
    ////                    dbo.Notes ON dbo.ClientDetails.ClientID = dbo.Notes.ClientID
    ////                    WHERE dbo.ClientDetails.EmailAddress is not null";

    ////    SqlCommand cmd = new SqlCommand(query, conn);
    ////    DataTable dt = new DataTable();

    ////    conn.Open();

    ////    SqlDataReader sdr = cmd.ExecuteReader();

    ////    dt.Load(sdr);
    ////    GridViewCorrespondance.DataSource = dt;
    ////    GridViewCorrespondance.DataBind();
    ////}


    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("contact-list.aspx");
    }


    protected void GridViewTimesheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewTimesheet.PageIndex = e.NewPageIndex;

        LoadTimesheet();

        GridViewTimesheet.DataBind();
    }
}