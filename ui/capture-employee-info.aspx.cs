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
using System.Globalization;

namespace TimeTracker.ui
{
    public partial class capture_employee_info : System.Web.UI.Page
    {

        //Connection String from web.config File  
        string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection();

        SqlDataAdapter adapt;
        DataTable dt;

        public string myUser;
        public string cid;

       
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


           // string empid = txtEmpID.Value;

            string sfname = txtEmpID.Value;
            string slname = string.Empty;


            string email = string.Empty;
            string cell = string.Empty;
            string pwd = string.Empty;
            string empid = string.Empty;
            string stEmpID = string.Empty;
            
          //  int empid;

            lblSessionEmail.Text = Session["fname"].ToString() + " " + Session["lname"].ToString(); 

            if (!IsPostBack)
            {

                LoadDropDownLists();
                LoadData();

                txtHiddenID.Value = Request.QueryString["EmployeeId"];
                             
                //int intEmpId = ((int)Session["empid"]);
               // string EmpID = Session["empid"].ToString();
               // txtHiddenID.Value = EmpID;// Convert.ToInt32(EmpID).ToString();


                txtEmpID.Value = Request.QueryString["EmailAddress"];

                if (Session["fname"] != null && Session["lname"] != null)
                {

                    txtName.Text = Session["fname"].ToString();

                    slname = Session["lname"].ToString();
                    txtSurname.Text = slname;



                    cell = Session["cell"].ToString();
                    txtCell.Text = cell;

                    email = Session["email"].ToString();
                    pwd = Session["pwd"].ToString();
                    txtPwd.Text = pwd;
                    txtEmail.Text = email;

                    stEmpID = Session["empid"].ToString();
                    txtEmployeeID.Text = stEmpID;
                 //   txtHiddenID.Value = EmpID;


                        ddlRole.SelectedValue = Session["role"].ToString();

                    //if (Session["empid"] != null)
                    //{
                    //    int empid = Session["empid"].ToString();// Convert.ToInt32(Session["empid"]).ToString();
                    //    txtEmpID.Value = empid;
                    //}

                     empid = Session["empid"].ToString();
                     txtEmpID.Value = empid;

                    //   Session["empid"] = txtID.Text;

                }
               
                //if (ddlRole.SelectedValue == "Developer" )
                //{
                //    btnCreateProject.Visible = false;
                //}

                //if (ddlRole.SelectedItem.Value == "Developer")
                //{
                //    btnCreateProject.Enabled = false;
                //}

                if (ddlRole.SelectedIndex == 0 || ddlRole.SelectedItem.Value == "Developer")
                {
                    btnCreateProject.Visible = false;
                    btnExportToExcel.Visible = false;
                }

                //ShowTimeSheetData(txtEmail.Text);

                ShowData(txtEmail.Text);
            }
        }

        


        ////    DateTime currDate = DateTime.Now;

        ////    txtDateNotesUpdated.Text = currDate.ToShortDateString();

        ////    btnCreateProject.Visible = false;

        ////    lblID.Text = Session["empId"].ToString();
        ////    lblEmail.Text = Session["Email"].ToString();

        ////    if (!IsPostBack)
        ////    {
        ////        LoadDropDownLists();

        ////        LoadData();

        ////        Session["Email"] = txtEmail.Text;

        ////        if (Session["fname"] != null)
        ////        {
        ////            lblSessionEmail.Text = Session["fname"].ToString();
        ////        }


        ////    }

        ////}

        private void LoadData()
        {
            // txtClientID.Value = Request.QueryString["ClientID"];
            //  txtcID.Text = Request.QueryString["ID"];

            txtID.Text = Request.QueryString["empId"];

            txtEmail.Text = Request.QueryString["EmailAddress"];
            txtName.Text = Request.QueryString["Name"];
            txtSurname.Text = Request.QueryString["Surname"];          
            txtCell.Text = Request.QueryString["CellNumber"];
            txtPwd.Text = Request.QueryString["Password"];
            ddlRole.SelectedValue = Request.QueryString["Role"];

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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            txtSurname.Text = String.Empty;
            txtName.Text = String.Empty;
            txtEmail.Text = String.Empty;
           
            lblMsg.Text = String.Empty;

            txtCell.Text = String.Empty;
            ddlRole.SelectedValue = String.Empty;

            txtEmail.Enabled = true;

            lblRecord.Text = String.Empty;

           // ShowData(txtEmail.Text);
        }

        protected void btnInsertUpdateInfo_Click(object sender, EventArgs e)
        {


            conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            conn.Open();

            DateTime DateNotesUpdated = DateTime.Now;
            string hiddenCientID = txtEmpID.Value;// txtHidden.Value;

             SqlCommand updateEmployee = new SqlCommand("update Employee set Name='" + txtName.Text + "',Surname='" + txtSurname.Text + "',CellNumber='" + txtCell.Text + "', Password='" + txtPwd.Text + "' ,RoleId='" + ddlRole.SelectedValue + "'  where EmailAddress='" + txtEmail.Text + "'", conn);

           // SqlCommand cmdInsertTimeSheet = new SqlCommand("Insert into  TimeSheet (ProjectId,EmployeeId,StartDate,EndDate)  Values('" + hiddenCientID + "',  @StartDate , @EndDate)", conn);


            try
            {
                if (updateEmployee.ExecuteNonQuery() > 0)
                {

                    lblRecord.Font.Bold = true;
                    lblRecord.ForeColor = Color.Green;
                    lblMsg.Text = "Employee Details Updated..";
                }
                else
                {
                    lblRecord.Font.Bold = true;
                    lblRecord.ForeColor = Color.Red;
                    lblMsg.Text = "Employee Details Not Updated!!!";
                }             
            }
            catch (Exception ex)
            {
                lblRecord.Font.Bold = true;
                lblRecord.ForeColor = Color.Salmon;
                lblMsg.Text = ex.Message;
            }
            finally
            {
                conn.Close();

            }

        }

        private void ShowData(string strEmailAddress)
        {
            dt = new DataTable();

            string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];

            SqlConnection conn = new SqlConnection(cnnstr);

            conn.Open();


            string Query = @"SELECT   dbo.Employee.EmployeeId, dbo.Employee.Name, dbo.Employee.Surname, dbo.Role.Description, 
                                      dbo.Project.ProjectName, dbo.TimeSheet.StartTime, dbo.TimeSheet.EndTime 
                           FROM       dbo.TimeSheet INNER JOIN
                                      dbo.Employee ON dbo.TimeSheet.EmployeeId = dbo.Employee.EmployeeId INNER JOIN
                                      dbo.Project ON dbo.TimeSheet.ProjectId = dbo.Project.ProjectId INNER JOIN
                                      dbo.Role ON dbo.Employee.RoleId = dbo.Role.RoleId
                           WHERE      dbo.Employee.EmailAddress = '" + txtEmail.Text + "'";

            adapt = new SqlDataAdapter(Query, conn);

            adapt.Fill(dt);

            if (dt.Rows.Count > 0)
            {
               GridViewTimeSheet.DataSource = dt;

                GridViewTimeSheet.DataBind();
            }

            else
            {

                dt.Rows.Add(dt.NewRow());

                GridViewTimeSheet.DataSource = dt;

                GridViewTimeSheet.DataBind();

                int TotalColumns = GridViewTimeSheet.Rows[0].Cells.Count;

                GridViewTimeSheet.Rows[0].Cells.Clear();

                GridViewTimeSheet.Rows[0].Cells.Add(new TableCell());

                GridViewTimeSheet.Rows[0].Cells[0].ColumnSpan = TotalColumns;

                GridViewTimeSheet.Rows[0].Cells[0].Text = "No records Found";

            }

            conn.Close();
        }

        //private void ShowTimeSheetData(string strEmailAddress)
        //{

        //    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        //    SqlDataReader rGetEmpTimeSheet = null;


        //    try
        //    {
        //        conn.Open();

        //        SqlCommand cmdGetEmpTimeSheet = new SqlCommand("[sp_getTimeSheetEntries]", conn);

        //        cmdGetEmpTimeSheet.CommandType = CommandType.StoredProcedure;

        //        cmdGetEmpTimeSheet.Parameters.AddWithValue("@EmailAddress", strEmailAddress);



        //        using (rGetEmpTimeSheet = cmdGetEmpTimeSheet.ExecuteReader())
        //        {

        //            while (rGetEmpTimeSheet.Read())
        //            {

        //                if (rGetEmpTimeSheet.Read())
        //                {

        //                    lblRecord.Font.Bold = true;
        //                    lblRecord.ForeColor = Color.Green;
        //                    lblRecord.Text = "Entry(s) found";

        //                    GridViewTimeSheet.DataSource = rGetEmpTimeSheet;
        //                    GridViewTimeSheet.DataBind();

        //                    rGetEmpTimeSheet.Close();
        //                }
        //                else
        //                {
        //                    lblRecord.Font.Bold = true;
        //                    lblRecord.ForeColor = Color.Red;
        //                    lblRecord.Text = "No Timesheet Entry(s) for  " + txtEmail.Text;
        //                    //GridViewTimeSheet.DataBind();
        //                }

        //            }

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Print error message
        //        lblRecord.Text = ex.Message;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //        rGetEmpTimeSheet.Close();
        //    }
           
        //}







        protected void btnCreateProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateProject.aspx?username=" + txtEmail.Text + "&empid=" + txtEmpID.Value);
        }

        protected void btnListTimeSheet_Click(object sender, EventArgs e)
        {

        }

        protected void btnInsertAddUpdateTimeSheet_Click(object sender, EventArgs e)
        {
            Response.Redirect("capture-timesheet.aspx?username=" + txtEmail.Text + "&empid=" + txtHiddenID.Value);// txtEmpID.Value);
        }

        protected void GridViewTimeSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           // string StartTime = string.Empty;
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridViewTimeSheet.Rows[e.RowIndex].FindControl("lbl_EmployeeId") as Label;
            TextBox Name = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
            TextBox Surname = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_Surname") as TextBox;
            TextBox Role = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_Role") as TextBox;
            TextBox ProjectName = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_ProjectName") as TextBox;
            //  TextBox StartTime = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_StartTime") as  TextBox;

           // TextBox StartDate = (TextBox)e.RowIndex.FindControl("txt_StartTime");

            TextBox StartTime = (TextBox)GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_StartTime");
            TextBox EndTime = (TextBox)GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_StartTime");
            // DateTime StartTime = Convert.ToDateTime(((TextBox)GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_StartTime")).Text);
            // DateTime EndTime = Convert.ToDateTime(((TextBox)GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_EndTime")).Text);


            // DateTime st = DateTime.tr.Parse(StartTime.ToString());
            // DateTime st = DateTime.Parse(StartTime.ToString(), CultureInfo.InvariantCulture);

            // TextBox EndTime = GridViewTimeSheet.Rows[e.RowIndex].FindControl("txt_EndTime") as TextBox;

            //   DateTime et = DateTime.Parse(EndTime.ToString());
            // DateTime et = DateTime.Parse(EndTime.ToString(), CultureInfo.InvariantCulture);

            string cnnstr = ConfigurationManager.AppSettings["ConnectionString"];

            SqlConnection conn = new SqlConnection(cnnstr);

          //  DateTime st = new DateTime();
         //   st = DateTime.Parse(StartTime.ToString());
          //  st = Convert.ToDateTime(StartTime);

         //   DateTime et = new DateTime();
          // et = Convert.ToDateTime(EndTime);

          ////   st = Convert.ToDateTime(StartTime.Text);// ng("yyyy-MM-dd"));
          ////   et = Convert.ToDateTime(EndTime.Text);
            conn.Open();
            //updating the record  
            // Convert.ToDateTime(StartTime).ToString("dd-mm-yyyy")

            //DateTime st = (DateTime)e.NewValues["txt_StartTime"];
            //DateTime et = (DateTime)e.NewValues["txt_EndTime"];
            //st = Convert.ToDateTime(StartTime.ToString());

            SqlCommand cmd = new SqlCommand("Update TimeSheet set StartTime='" + Convert.ToDateTime(StartTime.ToString()) + "',EndTime='" + Convert.ToDateTime(EndTime.ToString()) + "' where EmployeeId=" + Convert.ToInt32(id.Text), conn);

            cmd.ExecuteNonQuery();  


            conn.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridViewTimeSheet.EditIndex = -1;
            // GridViewComp.PageIndex = e.
            //Call ShowData method for displaying updated data  
            ShowData(txtEmail.Text);
        }
        
        protected void GridViewTimeSheet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTimeSheet.EditIndex = e.NewEditIndex;
            ShowData(txtEmail.Text);
        }

        protected void GridViewTimeSheet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTimeSheet.EditIndex = -1;
            ShowData(txtEmail.Text);
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridViewTimeSheet.AllowPaging = false;
              
                this.ShowData(txtEmail.Text);

                GridViewTimeSheet.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridViewTimeSheet.HeaderRow.Cells)
                {
                    cell.BackColor = GridViewTimeSheet.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridViewTimeSheet.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridViewTimeSheet.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridViewTimeSheet.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridViewTimeSheet.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }


    }

}