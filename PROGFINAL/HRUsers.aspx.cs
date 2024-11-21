using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace PROGFINAL
{
    public partial class HRUser : System.Web.UI.Page
    {
        private DataTable claimsTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the claims table and store it in ViewState
                claimsTable = new DataTable();
                claimsTable.Columns.Add("ClaimNo");
                claimsTable.Columns.Add("LecturerName");
                claimsTable.Columns.Add("ProgramCode");
                claimsTable.Columns.Add("ModuleCode");
                claimsTable.Columns.Add("Rate");
                claimsTable.Columns.Add("Hours");
                claimsTable.Columns.Add("ClaimAmount");
                claimsTable.Columns.Add("AttachedDocuments");
                claimsTable.Columns.Add("Status");

                AddSampleClaims();
                ViewState["Claims"] = claimsTable;
                BindClaimsGrid();
            }
            else
            {
                // Retrieve the claims table from ViewState on postback
                claimsTable = ViewState["Claims"] as DataTable;
            }
        }

        private void AddSampleClaims()
        {
            claimsTable.Rows.Add("C001", "Rachel", "HCIN6212", "Human Computer Interaction", 100, 10, 1000, "doc1.pdf", "Pending");
            claimsTable.Rows.Add("C002", "Amile", "PROG6212", "Programming 2B", 150, 5, 750, "doc2.pdf", "Pending");
            claimsTable.Rows.Add("C003", "Nothando", "DATA622", "Database (Intermediate)", 120, 8, 960, "doc3.pdf", "Pending");
            claimsTable.Rows.Add("C004", "Siya", "IPMA6212", "IT Project Management", 110, 12, 1320, "doc4.pdf", "Pending");
        }

        private void BindClaimsGrid()
        {
            gvClaims.DataSource = claimsTable;
            gvClaims.DataBind();
        }

        protected void gvClaims_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClaims.EditIndex = e.NewEditIndex;
            BindClaimsGrid();
        }

        protected void gvClaims_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvClaims.Rows[e.RowIndex];

            // Find the controls in the EditItemTemplate
            TextBox txtLecturerName = (TextBox)row.FindControl("txtLecturerName");
            TextBox txtProgramCode = (TextBox)row.FindControl("txtProgramCode");
            TextBox txtModuleCode = (TextBox)row.FindControl("txtModuleCode");
            TextBox txtRate = (TextBox)row.FindControl("txtRate");
            TextBox txtHours = (TextBox)row.FindControl("txtHours");
            TextBox txtAttachedDocuments = (TextBox)row.FindControl("txtAttachedDocuments");

            // Update the data table with new values
            claimsTable.Rows[row.DataItemIndex]["LecturerName"] = txtLecturerName.Text;
            claimsTable.Rows[row.DataItemIndex]["ProgramCode"] = txtProgramCode.Text;
            claimsTable.Rows[row.DataItemIndex]["ModuleCode"] = txtModuleCode.Text;
            claimsTable.Rows[row.DataItemIndex]["Rate"] = txtRate.Text;
            claimsTable.Rows[row.DataItemIndex]["Hours"] = txtHours.Text;
            claimsTable.Rows[row.DataItemIndex]["AttachedDocuments"] = txtAttachedDocuments.Text;
            claimsTable.Rows[row.DataItemIndex]["ClaimAmount"] = (Convert.ToDouble(txtRate.Text) * Convert.ToDouble(txtHours.Text)).ToString();

            // Exit edit mode and refresh grid
            gvClaims.EditIndex = -1;
            ViewState["Claims"] = claimsTable;
            BindClaimsGrid();
        }

        protected void gvClaims_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClaims.EditIndex = -1;
            BindClaimsGrid();
        }

        protected void btnDownloadInvoice_Click(object sender, EventArgs e)
        {
            // Generate and download invoice as text file
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("ClaimNo,LecturerName,ProgramCode,ModuleCode,Rate,Hours,ClaimAmount,AttachedDocuments");
            foreach (DataRow row in claimsTable.Rows)
            {
                sb.AppendLine($"{row["ClaimNo"]},{row["LecturerName"]},{row["ProgramCode"]},{row["ModuleCode"]},{row["Rate"]},{row["Hours"]},{row["ClaimAmount"]},{row["AttachedDocuments"]}");
            }

            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment; filename=ClaimsInvoice.csv");
            Response.Write(sb.ToString());
            Response.End();
        }
    }
}
