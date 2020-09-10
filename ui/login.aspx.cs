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

namespace TimeTracker.ui
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {

                var intEmpID = txtHidenEmpID.Value;
                string strUsername = txtEmailAddress.Text;
                string strPassword = txtPassword.Text;

                bool LoginVal = false;

                LoginVal = ProcessLogin(strUsername, strPassword);


                if (LoginVal == true)
                {
                    //User successfully loggedon
                    FormsAuthentication.SetAuthCookie(strUsername, false);


                    lblResponse.Font.Bold = true;
                    lblResponse.ForeColor = Color.Green;
                    lblResponse.Text = "User successfully loggedon";
                    Response.Redirect("~/ui/capture-employee-info.aspx");

                    Session["usermane"] = txtEmailAddress.Text;
                    // Response.Redirect("~/ui/update_client_company_info.aspx");//? Username= " + myEmail);

                }
                else
                {
                    lblResponse.Font.Bold = true;
                    lblResponse.ForeColor = Color.Red;
                    lblResponse.Text = "Username/Password NOT found!!!";
                }
            }
            catch
            { }

        }



        private bool ProcessLogin(string strUsername, string strPassword)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            SqlCommand cmdGetUserDetails = new SqlCommand("SELECT EmployeeId, Name, Surname,EmailAddress,CellNumber, Password,RoleId  from Employee where EmailAddress='" + strUsername + "' and Password ='" + strPassword + "'", conn);

          //  string strEmpID = string.Empty;
            string strFirstName = string.Empty;
            string strEmail = string.Empty;
            string strLastName = string.Empty;

            string strRole = string.Empty;
            string strCell = string.Empty;
            string strPwd = string.Empty;

            string strError = string.Empty;

            bool ilogin = false;

            try
            {
                conn.Open();
                SqlDataReader rGetUserDetails = cmdGetUserDetails.ExecuteReader();

                if (rGetUserDetails.HasRows)
                {
                    rGetUserDetails.Read();

                    strFirstName = (string)rGetUserDetails["Name"].ToString();
                    strEmail = (string)rGetUserDetails["EmailAddress"].ToString();
                    strLastName = (string)rGetUserDetails["Surname"].ToString();
                    strRole = (string)rGetUserDetails["RoleId"].ToString();

                    strCell = (string)rGetUserDetails["CellNumber"].ToString();
                    strPwd = (string)rGetUserDetails["Password"].ToString();

                    txtHidenEmpID.Value = (string)rGetUserDetails["EmployeeId"].ToString();
                    Session["empid"] = txtHidenEmpID;

                    Session["fname"] = strFirstName;
                    Session["lname"] = strLastName;


                    Session["email"] = strEmail;
                    Session["cell"] = strCell;
                    Session["pwd"] = strPwd;

                    Session["role"] = strRole;

                    rGetUserDetails.Dispose();
                    ilogin = true;
                }
                else
                {
                    //
                }

            }
            catch (Exception ex)
            {
                strError = ex.Message;
                //  IsError = false;
                ilogin = false;
            }
            finally
            {

                conn.Close();
            }

            // return true;
            return ilogin;
        }

        protected void submit(object sender, EventArgs e)
        {
            Response.Redirect("~/ui/capture-employee-info.aspx");
            //  Response.Redirect("~/ui/update_client_company_info.aspx");
        }

    }
}