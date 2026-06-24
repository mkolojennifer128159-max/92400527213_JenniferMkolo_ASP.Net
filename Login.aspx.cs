using System;
using System.Web.UI;

namespace MyApp
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email    = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // TODO: Replace with real DB authentication
            if (email == "student@example.com" && password == "password123")
            {
                Session["UserEmail"] = email;
                Response.Redirect("StudentRegistration.aspx");
            }
            else
            {
                vsSummary.HeaderText = "Invalid email or password. Please try again.";
            }
        }
    }
}
