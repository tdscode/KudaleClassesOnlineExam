<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="assets/js/jquery.min.js"></script> 
    <title>Register - Online exam sytem</title>
    <!-- Bootstrap core CSS-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this register-->
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="assets/js/bootstrap-multiselect.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=drp_subjectexam]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
</head>

<body class="bg-dark">
    <div class="container">
        <div class="card card-register mx-auto mt-5">
            <div class="card-header">Register an Account</div>
            <div class="card-body">
                <form runat="server" id="formregister">
                    <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                        <div class="form-group card-header text-center">
                            <div class="alert-danger">
                                <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputName">First name</label>
                                <asp:TextBox ID="txt_fname" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_name" runat="server" ErrorMessage="Enter first name" ControlToValidate="txt_fname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleInputLastName">Last name</label>
                                <asp:TextBox ID="txt_lname" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_lname" runat="server" ErrorMessage="Enter last name" ControlToValidate="txt_lname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputEmail1">Email address</label>
                                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Enter email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_emil" runat="server" ErrorMessage="Enter email" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rqrexpre_email" runat="server" ErrorMessage="Enter validate email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleInputMobile">Mobile No.</label>
                                <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_number" runat="server" ErrorMessage="Mobile Number" ControlToValidate="txtMobileNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rqrexpre_mobile" runat="server" ErrorMessage="Enter Mobile Number" ValidationExpression="^([0-9]{10})$" ControlToValidate="txtMobileNo" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label>Select Standard</label>
                                <asp:DropDownList ID="drp_categoryexam" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_stdChange" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_categoryexam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-6">
                                <label>Select Subject</label>
                                <asp:CheckBoxList ID="chkSubjects" runat="server" AutoPostBack="true" Width="450px" DataTextField="subject_name" DataValueField="subject_id">   
                                </asp:CheckBoxList>
                                <%--<asp:ListBox  ID="drp_subjectexam" SelectionMode="Multiple"  runat="server" CssClass="form-control" DataTextField="subject_name" DataValueField="subject_id">
                                </asp:ListBox>
                                <asp:RequiredFieldValidator ID="require_subjecexam" runat="server" ErrorMessage="You must select a subject" ControlToValidate="drp_subjectexam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                           --%>
                                <%--<select class="select2" id="drp_subjectexam"  name="states[]" multiple="multiple"></select>--%>
                                    
                                <%--<select CssClass="form-control" class="select2" ID="drp_subjectexam" runat="server" name="drp_subjectexam[]" multiple="multiple" DataTextField="subject_name" DataValueField="subject_id">
                                </select>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputPassword1">Password</label>
                                <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Enter password" ControlToValidate="txt_pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleConfirmPassword">Confirm password</label>
                                <asp:TextBox ID="txt_repass" runat="server" CssClass="form-control" placeholder="Re-type password" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="rqrcopm_pass" runat="server" ErrorMessage="Password do not match" ControlToValidate="txt_repass" Display="Dynamic" ForeColor="Red" ControlToCompare="txt_pass"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btn_register" runat="server" Text="Register" CssClass="btn btn-primary btn-block" OnClick="btn_register_Click" />
                    <div class="text-center">
                        <a class="d-block small mt-3" href="login.aspx">Login Page</a>
                        <a class="d-block small" href="forgotpassword.aspx">Forgot Password?</a>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>

</html>

