<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRUser.aspx.cs" Inherits="PROGFINAL.HRUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR User - Manage Claims</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .table-container {
            margin: auto;
            width: 80%;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .gridview th {
            background-color: orange;
            color: #333;
        }
        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .gridview tr:hover {
            background-color: #f1f1f1;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>HR User - Manage Claims</h1>
            <div class="table-container">
                <asp:GridView ID="gvClaims" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    OnRowEditing="gvClaims_RowEditing" OnRowUpdating="gvClaims_RowUpdating" 
                    OnRowCancelingEdit="gvClaims_RowCancelingEdit">
                    <Columns>
                        <asp:TemplateField HeaderText="Claim No">
                            <ItemTemplate>
                                <asp:Label ID="lblClaimNo" runat="server" Text='<%# Eval("ClaimNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Lecturer Name">
                            <ItemTemplate>
                                <asp:Label ID="lblLecturerName" runat="server" Text='<%# Eval("LecturerName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLecturerName" runat="server" Text='<%# Bind("LecturerName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Program Code">
                            <ItemTemplate>
                                <asp:Label ID="lblProgramCode" runat="server" Text='<%# Eval("ProgramCode") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProgramCode" runat="server" Text='<%# Bind("ProgramCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Module Code">
                            <ItemTemplate>
                                <asp:Label ID="lblModuleCode" runat="server" Text='<%# Eval("ModuleCode") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtModuleCode" runat="server" Text='<%# Bind("ModuleCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rate">
                            <ItemTemplate>
                                <asp:Label ID="lblRate" runat="server" Text='<%# Eval("Rate") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRate" runat="server" Text='<%# Bind("Rate") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hours">
                            <ItemTemplate>
                                <asp:Label ID="lblHours" runat="server" Text='<%# Eval("Hours") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHours" runat="server" Text='<%# Bind("Hours") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Claim Amount">
                            <ItemTemplate>
                                <asp:Label ID="lblClaimAmount" runat="server" Text='<%# Eval("ClaimAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attached Documents">
                            <ItemTemplate>
                                <asp:Label ID="lblAttachedDocuments" runat="server" Text='<%# Eval("AttachedDocuments") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAttachedDocuments" runat="server" Text='<%# Bind("AttachedDocuments") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="button-container">
                <asp:Button ID="btnDownloadInvoice" runat="server" Text="Download Invoice" OnClick="btnDownloadInvoice_Click" />
            </div>
        </div>
    </form>
</body>
</html>
