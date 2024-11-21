<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcademicManager.aspx.cs" Inherits="PROGFINAL.AcademicManager" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Academic Manager</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid orange;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: blue;
            color: white;
        }
        .action-button {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        .action-button.reject {
            background-color: #dc3545;
        }
        .navigation-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
        <div>
            <h2>Academic Manager</h2>
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
                    <th>Action</th>
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
            <!-- View Claims Button -->
            <asp:Button ID="btnViewClaims" runat="server" Text="Go to Programme Coordinator" CssClass="navigation-button" PostBackUrl="~/ProgrammeCoordinator.aspx" />
        </div>
    </form>
</body>
</html>