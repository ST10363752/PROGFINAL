using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PROGFINAL
{
    public partial class AddClaims : System.Web.UI.Page
    {
        private DataTable claimsTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the DataTable for storing claims
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

                // Store the DataTable in the ViewState
                ViewState["Claims"] = claimsTable;
                BindClaimsGrid();
            }
            else
            {
                claimsTable = (DataTable)ViewState["Claims"];
            }
        }

        protected void btnAddClaim_Click(object sender, EventArgs e)
        {
            // Initialize rate and hours
            decimal rate;
            decimal hours;

            // Validate and parse rate
            if (!decimal.TryParse(txtRate.Text, out rate))
            {
                // Display an error message for invalid rate
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid number for Rate.');", true);
                return; // Exit the method
            }

            // Validate and parse hours
            if (!decimal.TryParse(txtHours.Text, out hours))
            {
                // Display an error message for invalid hours
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid number for Hours.');", true);
                return; // Exit the method
            }

            // Calculate claim amount
            decimal claimAmount = rate * hours;

            // Create a new claim row
            DataRow newRow = claimsTable.NewRow();
            newRow["ClaimNo"] = txtClaimNo.Text;
            newRow["LecturerName"] = txtLectureName.Text;
            newRow["ProgramCode"] = ddlProgramCode.SelectedValue;
            newRow["ModuleCode"] = ddlModule.SelectedValue;
            newRow["Rate"] = rate;
            newRow["Hours"] = hours;
            newRow["ClaimAmount"] = claimAmount;
            newRow["AttachedDocuments"] = fileUploadSupportDoc.FileName; // Update with actual file upload handling
            newRow["Status"] = "Pending";

            // Add the new row to the DataTable
            claimsTable.Rows.Add(newRow);
            ViewState["Claims"] = claimsTable; // Update ViewState
            BindClaimsGrid();

            // Clear input fields
            ClearFields();
        }

        private void BindClaimsGrid()
        {
            gvClaims.DataSource = claimsTable;
            gvClaims.DataBind();
        }

        protected void gvClaims_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                // Find the row index from CommandArgument
                string claimNo = e.CommandArgument.ToString();
                DataRow row = claimsTable.Select($"ClaimNo = '{claimNo}'")[0];
                row["Status"] = "Approved";
                ViewState["Claims"] = claimsTable;
                BindClaimsGrid();
            }
            else if (e.CommandName == "Reject")
            {
                // Find the row index from CommandArgument
                string claimNo = e.CommandArgument.ToString();
                DataRow row = claimsTable.Select($"ClaimNo = '{claimNo}'")[0];
                row["Status"] = "Rejected";
                ViewState["Claims"] = claimsTable;
                BindClaimsGrid();
            }
        }
        protected void btnViewClaims_Click(object sender, EventArgs e)
        {
            Response.Redirect("AcademicManager.aspx");
        }

        private void ClearFields()
        {
            txtClaimNo.Text = "";
            txtLectureName.Text = "";
            txtEmployeeNumber.Text = "";
            txtLectureNumber.Text = "";
            txtRate.Text = "";
            txtHours.Text = "";
            txtClaimAmount.Text = ""; // Optionally clear this field
            fileUploadSupportDoc.Attributes.Clear(); // Clear file upload
        }
    }
}
   