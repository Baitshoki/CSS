using System;
using System.Globalization;
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

public partial class ui_capture_timesheet : System.Web.UI.Page
{

    //Connection String from web.config File  
    string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];
    SqlConnection conn = new SqlConnection();


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            string email = string.Empty;

            LoadDropDownLists();

            lblSessionEmail.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();

            lblMessage.Text = Session["empid"].ToString();

       
            email = Session["email"].ToString();
            txteID.Text = email;
         

        }

        if (txtStartDate.Text == string.Empty)
        {
            Calendar1.Visible = true;
        }

        if (txtEndDate.Text == string.Empty)
        {
            Calendar2.Visible = true;
        }

    }

   
    private void LoadDropDownLists()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        string cmdProjectName = "Select * from Project";
        SqlDataAdapter adptPN = new SqlDataAdapter(cmdProjectName, conn);
        DataTable dtPN = new DataTable();

        adptPN.Fill(dtPN);
        ddlProjectName.DataSource = dtPN;
        ddlProjectName.DataBind();
        ddlProjectName.DataTextField = "ProjectName";
        ddlProjectName.DataValueField = "ProjectId";
        ddlProjectName.DataBind();

    }


protected void btnRefresh_Click(object sender, EventArgs e)
    {
        ddlProjectName.SelectedIndex = 1;

    }

    protected void btnFillTimeSheet_Click(object sender, EventArgs e)
    {

        conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);



        //   string hiddenCientID = Int32.Parse(txtEmpID.Value).ToString();// txtHidden.Value;

        //var projID = ddlProjectName.SelectedIndex;
        //   int projID = Int32.Parse(ddlProjectName.SelectedValue);
        //  int projID = ddlProjectName.SelectedIndex;

        // string hiddenCientID = txtEmpID.Value;// txtHidden.Value;


        DateTime stDate = new DateTime();
        txtStartDate.Text = Convert.ToDateTime(stDate).ToShortDateString();
        
        DateTime enDate = new DateTime();
        txtEndDate.Text = Convert.ToDateTime(enDate).ToShortDateString();

        conn.Open();
        //int myID = 0;

        ////   SqlCommand updateEmployee = new SqlCommand("update Employee set Name='" + txtName.Text + "',Surname='" + txtSurname.Text + "',CellNumber='" + txtCell.Text + "' ,Role='" + ddlRole.SelectedValue + "'  where EmailAddress='" + txtEmail.Text + "'", conn);

        //SqlCommand cmdGetEmpID = new SqlCommand("Select EmployeeId from Employee where EmailAddress='" + txteID.Text + "'", conn);

        //cmdGetEmpID.Parameters.Add("@EmployeeId", SqlDbType.Int).Value = myID;
        //// cmdGetEmpID.Parameters.AddWithValue("@EmployeeId", propertyData.ID);

        ////int id = Convert.ToInt32(cmdGetEmpID.ExecuteScalar());

        //cmdGetEmpID.ExecuteNonQuery();



        //SqlCommand cmdInsertTimeSheet = new SqlCommand("Insert into  TimeSheet (EmployeeId,ProjectId,StartTime,EndTime)  Values('" + myID + "','" +  ddlProjectName.SelectedValue + "',  @StartTime , @EndTime)", conn);

        //// SqlCommand cmdInsertTimeSheet = new SqlCommand("Insert into  TimeSheet (EmployeeId,ProjectId,StartDate,EndDate)  Values('" + myID + "','" + ddlProjectName.SelectedValue + "',  @StartDate , @EndDate)", conn);

        ////   SqlCommand cmdInsertTimeSheet = new SqlCommand("[sp_TIMESHEETENTRY]", conn);

        ////   cmdInsertTimeSheet.CommandType = CommandType.StoredProcedure;

        //try
        //{
        //    // cmdInsertTimeSheet.Parameters.Add("@TimeSheetId", SqlDbType.Int).Direction = ParameterDirection.Output;
        //    // cmdInsertTimeSheet.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ddlProjectName.SelectedValue;// ddlProjectName.SelectedIndex; 


        //    cmdInsertTimeSheet.Parameters.Add("@EmployeeId", SqlDbType.Int).Value = myID;

        //    //  cmdInsertTimeSheet.Parameters.Add("@EmployeeId", SqlDbType.Int).Direction = ParameterDirection.Output;

        //    // cmdInsertTimeSheet.Parameters.Add("@StartDate", SqlDbType.Date).Value = txtStartDate.Text;
        //    //  cmdInsertTimeSheet.Parameters.Add("@EndDate", SqlDbType.Date).Value = txtEndDate.ToString();


        //    //   cmdInsertTimeSheet.Parameters.Add("@EmployeeId", SqlDbType.Int).Direction = ParameterDirection.Output;


        SqlCommand cmdInsertTimeSheet = new SqlCommand("[sp_TIMESHEETENTRY]", conn);

        cmdInsertTimeSheet.CommandType = CommandType.StoredProcedure;

        try
        { 

            cmdInsertTimeSheet.Parameters.Add("@EmployeeId", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmdInsertTimeSheet.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ddlProjectName.SelectedValue;
            cmdInsertTimeSheet.Parameters.Add("@StartTime", SqlDbType.Date).Value = stDate.ToShortDateString();
            cmdInsertTimeSheet.Parameters.Add("@EndTime", SqlDbType.Date).Value = enDate.ToShortDateString();



            if (cmdInsertTimeSheet.ExecuteNonQuery() < 0)
            {

                lblMessage.Font.Bold = true;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Timesheet entry saved.";

            }
            else
            {
                lblMessage.Font.Bold = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Entry NOT saved!!!";
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

            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;

        }

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //txtStartDate.Text = Calendar1.TodaysDate.ToShortDateString();
        txtStartDate.Text = Convert.ToDateTime(Calendar1.SelectedDate).ToShortDateString();
        // txtStartDate.Text = Convert.ToDateTime(Calendar1.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("dd/mm/yyyy");
        Calendar1.Visible = false;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
    
        txtEndDate.Text = Convert.ToDateTime(Calendar2.SelectedDate).ToShortDateString();
        Calendar2.Visible = false;
    }
}