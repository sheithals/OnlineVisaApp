<%@ Page Title="" Language="C#" MasterPageFile="~/eVisa.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OnlineVisaApp.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container mt-5">
       <div class="card">
           <div class="card-header">
                    <h2 class="text-center">User Registration</h2>
               </div>
            <div class="card-body">
                 <div class="form-group row">
                           <label  class="col-sm-3 col-form-label">Name:</label>
                   <div class="col-sm-9">
                       <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" runat="server" ErrorMessage="Please Enter the Name" CssClass="text-danger"></asp:RequiredFieldValidator>
                       </div>
                     </div>
                <div class="form-group row">
    <label  class="col-sm-3 col-form-label">Phone Number:</label>
    <div class="col-sm-9">
    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvtxtPhonenumber" ControlToValidate="txtPhoneNumber" runat="server" ErrorMessage="Please Enter the Mobile Number" CssClass="text-danger"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="rgtxtPhoneNumber" ControlToValidate="txtPhoneNumber" ValidationExpression="^\d{10}$" runat="server" ErrorMessage="Please Enter the valid Mobile Number" CssClass="text-danger"></asp:RegularExpressionValidator>
 
    </div>
</div>
                <div class="form-group row">
      
    <label  class="col-sm-3 col-form-label">Email:</label>
         
    <div class="col-sm-9">
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvtxtEmail" ControlToValidate="txtEmail" runat="server" CssClass="text-danger" ErrorMessage="Please Enter the Email Id"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="rgetxtEmail" runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter valid Email Id"></asp:RegularExpressionValidator>
    </div>
          
</div>
                  <div class="form-group row">
      
      <label class="col-sm-3 col-form-label">Username:</label>
          
      <div class="col-sm-9">
      <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvtxtUsername" CssClass="text-danger" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter Username"></asp:RequiredFieldValidator>
      </div>
  </div>
                <div class="form-group row">
    
      <label  class="col-sm-3 col-form-label">Password:</label>
         
      <div class="col-sm-9">
      <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" ControlToValidate="txtPassword" runat="server" ErrorMessage="Please Enter the Password"></asp:RequiredFieldValidator>
      </div>
  </div>
                <div class="form-group row">
     
                <label for="txtSecurityQuestion" class="col-sm-3 col-form-label">Security Question:</label>
       
                <div class="col-sm-9">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" >
                <asp:ListItem Value="">Select</asp:ListItem>
                <asp:ListItem Value="What is first School Name?" Text="What is first School Name?"></asp:ListItem>
                <asp:ListItem Value="What is your pet animal?" Text="What is your pet animal?"></asp:ListItem>
                <asp:ListItem Value="What is first Maiden Name?" Text="What is first Maiden Name?"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" ControlToValidate="DropDownList1"  runat="server" ErrorMessage="Please Select the Security Question"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class="form-group row">
    
<label  class="col-sm-3 col-form-label">Answer:</label>
       
<div class="col-sm-9">
<asp:TextBox ID="txtAnswer1" runat="server"  CssClass="form-control" placeholder="Enter your Answer"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvtxtAnswer" CssClass="text-danger" ControlToValidate="txtAnswer1" runat="server" ErrorMessage="Please Enter the Answer"></asp:RequiredFieldValidator>
</div>
</div>

 </div>
           <div class="card-footer">
               <asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="Button1_Click" runat="server" Text="SignUp" style="height: 31px" />
           </div>
                </div>
           </div>
</asp:Content>
