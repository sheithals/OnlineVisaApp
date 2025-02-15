<%@ Page Title="" Language="C#" MasterPageFile="~/eVisa.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineVisaApp.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="title-section inner-banner">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-padding-y">
                <div class="title-section-text">
                    <h1 id="idnDashboardHeader">Dashboard</h1>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="dashboard-section module">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div id="dashboard-frame" class="dashboard-frame">
                            <div class="dashboard-frame-head">
                                My Dashboard
                            </div>
                        </div>
                <div id="idnUserProfileDetails">
                    <div class="dashboard-frame">
    <div class="dashboard-frame-head">
        <%= Session["Username"].ToString() %> - Applied Visa
    </div>
    <div class="dashboard-frame-body">
        <div class="dash_data_box">
            <div class="dash_data_search">
            </div>
            <div class="dash_data_table">
            <asp:GridView ID="GridView1" width="100%"  DataKeyNames="ApplicationId" AutoGenerateColumns="false" runat="server"  OnRowDataBound="GridView1_RowDataBound">
            <HeaderStyle CssClass="evisa" />
                <Columns>
                      <asp:BoundField DataField="Applicationid" HeaderText="Application Id" />
                    <asp:BoundField HeaderText="Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Phone No" DataField="Phoneno" />
                    <asp:BoundField HeaderText="Email Id" DataField="EmailID" />
                    <asp:BoundField HeaderText="Visa Type" DataField="VisaTypeName" />
                    <asp:BoundField HeaderText="Visa Status" DataField="StatusName" />
                     <asp:TemplateField HeaderText="Passport Photo">
            <ItemTemplate>
                <asp:Image ID="PassportPhoto" runat="server" Height="100" Width="100" />
            </ItemTemplate>
        </asp:TemplateField>
                   </Columns>
            </asp:GridView>
            </div>
        </div>
    </div>
</div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
