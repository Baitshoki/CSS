using System;
using System.IO;
using System.Drawing;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Threading;

public partial class ui_CreateProject : System.Web.UI.Page
{
    //Connection String from web.config File  
    string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];
    SqlConnection conn = new SqlConnection();


    protected void Page_Load(object sender, EventArgs e)
    {
        lblSessionEmail.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();
    }

    protected void btnInsertProjectName_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        conn.Open();

        DateTime DateNotesUpdated = DateTime.Now;
        string hiddenEmpID = txtEmpID.Value;
        string strPN = txtProjectName.Text;

        SqlCommand cmdInsertProject = new SqlCommand("Insert into  Project  Values (@ProjectName)", conn);

        cmdInsertProject.Parameters.Add("@ProjectName", SqlDbType.NVarChar, 50).Value = strPN.ToString();


        try
        {
            if (cmdInsertProject.ExecuteNonQuery() > 0)
            {

                lblMessage.Font.Bold = true;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Project Name Saved.";

            }
            else
            {
                lblMessage.Font.Bold = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Project NOT Saved!!!";
            }


        }
        catch (Exception ex)
        {
            lblMessage.Font.Bold = true;
            lblMessage.ForeColor = Color.Salmon;
            lblMessage.Text = ex.Message;
        }
        finally
        {
            conn.Close();         

        }

    }
}
