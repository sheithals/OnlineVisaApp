﻿<%@ Page Title="" Language="C#" MasterPageFile="~/eVisa.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="OnlineVisaApp.AdminLogin" %>
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
                        <img width="150px" src="imgs/adminuser.png"/>
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <h3>Admin Login</h3>
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
                     <label>Admin ID</label>
                     <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtadminusername" runat="server" placeholder="Admin ID"></asp:TextBox>
                     </div>
                     <label>Password</label>
                     <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtadminpassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="form-group">
                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btnadminLogin" OnClick="btnadminLogin_Click" runat="server" Text="Login" />
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <a href="homepage.aspx"><< Back to Home</a><br><br>
      </div>
   </div>
</div>
</asp:Content>
