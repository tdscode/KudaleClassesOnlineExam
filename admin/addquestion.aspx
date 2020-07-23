<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="addquestion.aspx.cs" Inherits="admin_addquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select add question for exam--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelquestion" runat="server" Text="Add Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-12">
                        <asp:Image class="btmspace-15" ID="Image1" runat="server" Height="50px" Width="500px"></asp:Image>
                        <asp:FileUpload ID="FileUpload1" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>
                    </div>
                </div>

                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Qusetion Name</label>
                    <div class="col-md-9">
                        <asp:Image class="btmspace-15" ID="Image2" runat="server" Height="150px" Width="750px"></asp:Image>
                        <asp:FileUpload ID="FileUpload2" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>
                        
                        <%--<asp:TextBox ID="txt_questionname" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="require_questionname" runat="server" ErrorMessage="Enter exam name" ControlToValidate="Image2" ForeColor="red"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option A</label>
                    <div class="col-md-9">
                        <asp:Image class="btmspace-15" ID="Image3" runat="server" Height="50px" Width="750px"></asp:Image>
                        <asp:FileUpload ID="FileUpload3" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>

                        <%--<asp:TextBox ID="txt_optionone" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="require_op1" runat="server" ErrorMessage="Enter option one" ControlToValidate="txt_optionone" ForeColor="red"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option B</label>
                    <div class="col-md-9">
                        <asp:Image class="btmspace-15" ID="Image4" runat="server" Height="50px" Width="750px"></asp:Image>
                        <asp:FileUpload ID="FileUpload4" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>

                        <%--<asp:TextBox ID="txt_optiontwo" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="require_op2" runat="server" ErrorMessage="Enter option two" ControlToValidate="txt_optiontwo" ForeColor="red"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option C</label>
                    <div class="col-md-9">
                        <asp:Image class="btmspace-15" ID="Image5" runat="server" Height="50px" Width="750px"></asp:Image>
                        <asp:FileUpload ID="FileUpload5" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>

                        <%--<asp:TextBox ID="txt_optionthree" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="require_op3" runat="server" ErrorMessage="Enter option three" ControlToValidate="txt_optionthree" ForeColor="red"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option D</label>
                    <div class="col-md-9">
                        <asp:Image class="btmspace-15" ID="Image6" runat="server" Height="50px" Width="750px"></asp:Image>
                        <asp:FileUpload ID="FileUpload6" runat="server" class="btmspace-15" Style="padding-bottom: 10px;" onchange="this.form.submit();"></asp:FileUpload>
                        
                        <%--<asp:TextBox ID="txt_optionfour" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="require_op4" runat="server" ErrorMessage="Enter option four" ControlToValidate="txt_optionfour" ForeColor="red"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label text-center">Correct Answer</label>
                    <div class="col-md-4">
                        <asp:RadioButtonList ID="rdo_correctanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                            <asp:ListItem Text="A" Value="1"></asp:ListItem>
                            <asp:ListItem Text="B" Value="2"></asp:ListItem>
                            <asp:ListItem Text="C" Value="3"></asp:ListItem>
                            <asp:ListItem Text="D" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="req_rdo_correctanswer" runat="server" ErrorMessage="Select a correct answer" ControlToValidate="rdo_correctanswer" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_addquestion" runat="server" Text="Add Question" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addquestion_Click" />
                    </div>
                    <asp:Panel ID="panel_addquestion_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_addquestionwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

