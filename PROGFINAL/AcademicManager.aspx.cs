using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PROGFINAL
{
    public partial class AcademicManager : System.Web.UI.Page
    {
        private DataTable claimsTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["Claims"] == null)
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

                    // Add some sample claims
                    AddSampleClaims();

                    // Store in ViewState to persist the data across postbacks
                    ViewState["Claims"] = claimsTable;
                }
                else
                {
                    // Retrieve the table from ViewState
                    claimsTable = (DataTable)ViewState["Claims"];
                }

                // Bind data to the GridView
                BindClaimsGrid();
            }
        }

        private void AddSampleClaims()
        {
            // Add sample rows for testing
            claimsTable.Rows.Add("C001", "Rachel", "HCIN6212", "Human Computer Interaction", 100, 10, 1000, "doc1.pdf", "Pending");
            claimsTable.Rows.Add("C002", "Amile", "PROG6212", "Programming 2B", 150, 5, 750, "doc2.pdf", "Pending");
            claimsTable.Rows.Add("C003", "Nothando", "DATA622", "Database (Intermediate)", 120, 8, 960, "doc3.pdf", "Pending");
            claimsTable.Rows.Add("C004", "Siya", "IPMA6212", "IT Project Management", 110, 12, 1320, "doc4.pdf", "Pending");
        }

        private void BindClaimsGrid()
        {
            if (claimsTable != null)
            {
                gvClaims.DataSource = claimsTable;
                gvClaims.DataBind();
            }
        }

        protected void gvClaims_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                // Ensure claimsTable is not null
                if (claimsTable != null)
                {
                    // Find the ClaimNo from CommandArgument
                    string claimNo = e.CommandArgument.ToString();

                    // Find the rows matching the ClaimNo (returns an array of DataRows)
                    DataRow[] rows = claimsTable.Select($"ClaimNo = '{claimNo}'");

                    // Ensure that a matching row is found
                    if (rows.Length > 0)
                    {
                        // Get the first matching row
                        DataRow row = rows[0];

                        // Update the status based on the command
                        if (e.CommandName == "Approve")
                        {
                            row["Status"] = "Approved";
                        }
                        else if (e.CommandName == "Reject")
                        {
                            row["Status"] = "Rejected";
                        }

                        // Update the ViewState with the modified table
                        ViewState["Claims"] = claimsTable;

                        // Rebind the GridView to reflect the changes
                        BindClaimsGrid();
                    }
                    else
                    {
                        // Handle case where no row was found (Optional)
                        // Log an error or display a message
                        Console.WriteLine("ClaimNo not found: " + claimNo);
                    }
                }
                else
                {
                    // Handle case where claimsTable is null (should not happen if properly initialized)
                    Console.WriteLine("Claims table is not initialized.");
                }
            }
        }
    }
}
