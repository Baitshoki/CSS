using System;
using System.IO;
using System.Drawing;
using System.Collections;
using System.Configuration;
using System.Threading;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class ui_register : System.Web.UI.Page
{
    string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];
    SqlConnection conn = new SqlConnection();

    SqlDataAdapter adapt;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            LoadDropDownLists();
        }
        }

    private void LoadDropDownLists()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        string cmdRolee = "Select * from Role";
        SqlDataAdapter adptRole = new SqlDataAdapter(cmdRolee, conn);
        DataTable dtRole = new DataTable();

        adptRole.Fill(dtRole);
        ddlRole.DataSource = dtRole;
        ddlRole.DataBind();
        ddlRole.DataTextField = "Description";
        ddlRole.DataValueField = "RoleId";
        ddlRole.DataBind();
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        conn.Open();

        DateTime DateNotesUpdated = DateTime.Now;
      //  string hiddenEmpID = txtEmpID.Value;
        int isActive = 1;
        string name = txtFName.Text;
        string sname = txtSName.Text;
        string email = txtEmailAddress.Text;
        string cell = txtCell.Text;
        string pwd = txtPassword.Text;

        SqlCommand cmdInsertEmployee = new SqlCommand("Insert into  Employee  Values (@Name ,@Surname ,@EmailAddress ,@CellNumber, @Password, '" + ddlRole.SelectedValue + "', 1 )", conn);
              
        cmdInsertEmployee.Parameters.Add("@Name", SqlDbType.NVarChar, 25).Value = name;
        cmdInsertEmployee.Parameters.Add("@Surname", SqlDbType.NVarChar, 25).Value = sname;
        cmdInsertEmployee.Parameters.Add("@EmailAddress", SqlDbType.NVarChar, 30).Value = email;
        cmdInsertEmployee.Parameters.Add("@CellNumber", SqlDbType.NVarChar, 15).Value = cell;
        cmdInsertEmployee.Parameters.Add("@RoleId", SqlDbType.Int).Value = ddlRole.SelectedValue;
        cmdInsertEmployee.Parameters.Add("@Password", SqlDbType.NVarChar, 25).Value = pwd;
        cmdInsertEmployee.Parameters.Add("@IsActive", SqlDbType.Bit).Value = isActive;


        try
        {
            if (cmdInsertEmployee.ExecuteNonQuery() > 0)
            {

               lblResponse.Font.Bold = true;
                lblResponse.ForeColor = Color.Green;
                lblResponse.Text = "User Registered Successfully.";

                Response.Redirect("login.aspx");

            }
            else
            {
                lblResponse.Font.Bold = true;
                lblResponse.ForeColor = Color.Red;
                lblResponse.Text = "User NOT Registered!!!";
            }


        }
        catch (Exception ex)
        {
            lblResponse.Font.Bold = true;
            lblResponse.ForeColor = Color.Salmon;
            lblResponse.Text = ex.Message;
        }
        finally
        {
            conn.Close();

        }

    }
}