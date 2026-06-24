using System;
using System.Collections.Generic;
using System.Web.UI;

namespace StudentApp
{
    public partial class StudentRegistration : Page
    {
        // In-memory list simulating a database (replace with real DB / DataTable)
        private static List<StudentRecord> _students = new List<StudentRecord>();
        private static int _nextSNo = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        // ── Submit ────────────────────────────────────────────────
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Determine selected gender
            string gender = rbFemale.Checked ? "Female" : rbMale.Checked ? "Male" : "";

            // Parse DOB
            DateTime dob = DateTime.MinValue;
            DateTime.TryParse(txtDOB.Text, out dob);

            // Build record
            var record = new StudentRecord
            {
                SNo         = _nextSNo++,
                StudentName = txtStudentName.Text.Trim(),
                FatherName  = txtFatherName.Text.Trim(),
                DOB         = dob == DateTime.MinValue ? (DateTime?)null : dob,
                Gender      = gender,
                Course      = ddlCourse.SelectedValue,
                MobileNo    = txtMobile.Text.Trim(),
                EmailID     = txtEmail.Text.Trim(),
                Address     = txtAddress.Text.Trim()
            };

            _students.Add(record);
            BindGrid();
            ClearForm();
        }

        // ── Reset ─────────────────────────────────────────────────
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        // ── Edit ──────────────────────────────────────────────────
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (gvStudents.SelectedIndex < 0) return;

            int sno = (int)gvStudents.SelectedDataKey.Value;
            var rec = _students.Find(r => r.SNo == sno);
            if (rec == null) return;

            txtStudentName.Text    = rec.StudentName;
            txtFatherName.Text     = rec.FatherName;
            txtDOB.Text            = rec.DOB.HasValue ? rec.DOB.Value.ToString("yyyy-MM-dd") : "";
            rbFemale.Checked       = rec.Gender == "Female";
            rbMale.Checked         = rec.Gender == "Male";
            ddlCourse.SelectedValue = rec.Course;
            txtMobile.Text         = rec.MobileNo;
            txtEmail.Text          = rec.EmailID;
            txtAddress.Text        = rec.Address;

            // Remove so Submit re-adds (simple edit-by-replace)
            _students.Remove(rec);
            _nextSNo = sno; // reuse same serial number
            BindGrid();
        }

        // ── Delete ────────────────────────────────────────────────
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (gvStudents.SelectedIndex < 0) return;

            int sno = (int)gvStudents.SelectedDataKey.Value;
            _students.RemoveAll(r => r.SNo == sno);
            BindGrid();
        }

        // ── GridView row selection ────────────────────────────────
        protected void gvStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            // handled by Edit / Delete buttons
        }

        // ── Helpers ───────────────────────────────────────────────
        private void BindGrid()
        {
            gvStudents.DataSource = _students;
            gvStudents.DataBind();
        }

        private void ClearForm()
        {
            txtStudentName.Text  = "";
            txtFatherName.Text   = "";
            txtDOB.Text          = "";
            rbFemale.Checked     = false;
            rbMale.Checked       = false;
            ddlCourse.SelectedIndex = 0;
            txtMobile.Text       = "";
            txtEmail.Text        = "";
            txtAddress.Text      = "";
        }
    }

    // ── Simple DTO ────────────────────────────────────────────────
    public class StudentRecord
    {
        public int       SNo         { get; set; }
        public string    StudentName { get; set; }
        public string    FatherName  { get; set; }
        public DateTime? DOB         { get; set; }
        public string    Gender      { get; set; }
        public string    Course      { get; set; }
        public string    MobileNo    { get; set; }
        public string    EmailID     { get; set; }
        public string    Address     { get; set; }
    }
}
