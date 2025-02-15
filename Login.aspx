<%@ Page Title="" Language="C#" MasterPageFile="~/eVisa.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineVisaApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container">
   <div class="row">
      <div class="col-md-6 mx-auto">
         <div class="card">
            <div class="card-body">
               <div class="row">
                  <div class="col">
                     <center>
                         <img  width="150px" src="Content/Images/defaultuser.png" />
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <h3>User Login</h3>
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <hr>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <label>User Name</label>
                     <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server" AutoCompleteType="None" autocomplete="off" placeholder="Member ID"></asp:TextBox>
                     </div>
                     <label>Password</label>
                     <div class="form-group">
                        <asp:TextBox CssClass="form-control"  ID="txtPassword" runat="server" AutoCompleteType="None" autocomplete="off" placeholder="Password" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="form-group">
                         <asp:Button ID="btnLogin" OnClick="btnLogin_Click" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" />
                     </div>
                     <div class="form-group">
                        <a href="Signup.aspx"><input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
           <a href="AdminLogin.aspx">AdminLogin</a><br><br>
         <a href="Home.aspx"><< Back to Home</a><br><br>
      </div>
   </div>
</div>
</asp:Content>
