<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PROGFINAL" Inherits="PROGFINAL.AddClaims" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Claims</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: black;
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        .form-container {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #007bff;
            padding: 20px;
            background-color: darkorange;
            border-radius: 10px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .form-row label {
            width: 30%;
        }
        .form-row input, .form-row select {
            width: 60%;
            padding: 5px;
        }
        .button-container {
            text-align: center;
        }
        .submit-button {
            background-color: green;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: yellow;
        }
        .view-button {
            background-color: #28a745; /* Green for View Claims */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px; /* Space between buttons */
        }
        .view-button:hover {
            background-color: #218838; /* Darker green on hover */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #007bff;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .action-button {
            background-color: #28a745; /* Green for Approve */
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .action-button.reject {
            background-color: #dc3545; /* Red for Reject */
        }
    </style>
</head>
<body>
    <ul>
    <li><a href="AddClaims.aspx">Add Claims</a></li>
    <li><a href="ProgrammeCoordinator.aspx">Programme Coordinator</a></li>
    <li><a href="AcademicManager.aspx">Academic Manager</a></li>
    <li><a href="HRUsers.aspx">HR</a></li>
</ul>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Add Claims</h2>
            <div class="form-row">
                <label for="txtClaimNo">Claim No:</label>
                <asp:TextBox ID="txtClaimNo" runat="server"></asp:TextBox>
            </div>
            
            <div class="form-row">
                <label for="txtLectureName">Lecturer Name:</label>
                <asp:TextBox ID="txtLectureName" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
                <label for="txtEmployeeNumber">Employee Number:</label>
                <asp:TextBox ID="txtEmployeeNumber" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
                <label for="txtLectureNumber">Lecture Number:</label>
                <asp:TextBox ID="txtLectureNumber" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
               <label for="txtClaimAmount">Claim Amount:</label>
               <asp:TextBox ID="txtClaimAmount" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
                <label for="ddlMonth">Month:</label>
                <asp:DropDownList ID="ddlMonth" runat="server">
                    <asp:ListItem>January</asp:ListItem>
                    <asp:ListItem>February</asp:ListItem>
                    <asp:ListItem>March</asp:ListItem>
                    <asp:ListItem>April</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>June</asp:ListItem>
                    <asp:ListItem>July</asp:ListItem>
                    <asp:ListItem>August</asp:ListItem>
                    <asp:ListItem>September</asp:ListItem>
                    <asp:ListItem>October</asp:ListItem>
                    <asp:ListItem>November</asp:ListItem>
                    <asp:ListItem>December</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-row">
                <label for="ddlYear">Year:</label>
                <asp:DropDownList ID="ddlYear" runat="server">
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-row">
                <label for="ddlProgramCode">Program Code:</label>
                <asp:DropDownList ID="ddlProgramCode" runat="server">
                    <asp:ListItem>PROG6212</asp:ListItem>
                    <asp:ListItem>HCIN6212</asp:ListItem>
                    <asp:ListItem>IPMA6212</asp:ListItem>
                    <asp:ListItem>DATA6222</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-row">
                <label for="ddlModule">Module:</label>
                <asp:DropDownList ID="ddlModule" runat="server">
                    <asp:ListItem>Human Computer Interaction</asp:ListItem>
                    <asp:ListItem>Programming 2A</asp:ListItem>
                    <asp:ListItem>IT Project Management</asp:ListItem>
                    <asp:ListItem>Database (Intermediate)</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-row">
                <label for="txtRate">Rate per Hour:</label>
                <asp:TextBox ID="txtRate" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
                <label for="txtHours">Hours Worked:</label>
                <asp:TextBox ID="txtHours" runat="server"></asp:TextBox>
            </div>
            <div class="form-row">
                <label for="fileUploadSupportDoc">Upload Supporting Documents:</label>
                <asp:FileUpload ID="fileUploadSupportDoc" runat="server" />
            </div>
            <div class="button-container">
                <asp:Button ID="btnAddClaim" runat="server" CssClass="submit-button" Text="Add Claim" OnClick="btnAddClaim_Click" />
                <asp:Button ID="btnViewClaims" runat="server" CssClass="view-button" Text="View Claims" OnClick="btnViewClaims_Click" />
            </div>
            <table>
                <tr>
                    <th>Claim No.</th>
                    <th>Lecturer Name</th>
                    <th>Program Code</th>
                    <th>Module Code</th>
                    <th>Rate/hr</th>
                    <th>Hours</th>
                    <th>Claim Amount</th>
                    <th>Attached Documents</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <asp:GridView ID="gvClaims" runat="server" AutoGenerateColumns="False" OnRowCommand="gvClaims_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ClaimNo" HeaderText="Claim No." />
                        <asp:BoundField DataField="LecturerName" HeaderText="Lecturer Name" />
                        <asp:BoundField DataField="ProgramCode" HeaderText="Program Code" />
                        <asp:BoundField DataField="ModuleCode" HeaderText="Module Code" />
                        <asp:BoundField DataField="Rate" HeaderText="Rate/hr" />
                        <asp:BoundField DataField="Hours" HeaderText="Hours" />
                        <asp:BoundField DataField="ClaimAmount" HeaderText="Claim Amount" />
                        <asp:BoundField DataField="AttachedDocuments" HeaderText="Attached Documents" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="action-button" CommandName="Approve" CommandArgument='<%# Eval("ClaimNo") %>' />
                                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="action-button reject" CommandName="Reject" CommandArgument='<%# Eval("ClaimNo") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </table>
        </div>
    </form>
</body>
</html>