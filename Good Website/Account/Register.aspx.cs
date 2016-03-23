using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Desktop;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
        IdentityResult result = manager.Create(user, Password.Text);

        if (result.Succeeded)
        {
            // get the connection string and create a sqlCommand object
            string strConnection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myConnection = new SqlConnection(strConnection);

            // create the sql statement
            string strSql = "INSERT INTO Users (Email, Phone, FirstName, LastName, Address) VALUES (@Email, @Phone, @FirstName, @LastName, @Address)";

            // create a sqlCommand
            SqlCommand myCommand = new SqlCommand(strSql, myConnection);
            myCommand.Parameters.Add("@Phone", System.Data.SqlDbType.NVarChar, 50).Value = txtPhone.Text;
            myCommand.Parameters.Add("@FirstName", System.Data.SqlDbType.NVarChar, 50).Value = txtFirstName.Text;
            myCommand.Parameters.Add("@LastName", System.Data.SqlDbType.NVarChar, 50).Value = txtLastName.Text;
            myCommand.Parameters.Add("@Address", System.Data.SqlDbType.NVarChar, 50).Value = txtAddress.Text;
            myCommand.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar, 50).Value = Email.Text;

            // executing
            myConnection.Open();
            myCommand.ExecuteNonQuery();

            // close up
            myConnection.Close();

            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}