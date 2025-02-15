<%@ Page Title="" Language="C#" MasterPageFile="~/eVisa.Master" AutoEventWireup="true" CodeBehind="Applyforvisa.aspx.cs" Inherits="OnlineVisaApp.Applyforvisa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript">
      function CheckDeclaration() {
          var checkBox = document.getElementById("idnApplicationdeclaration");
          if (!checkBox.checked) {
              alert("Please check the declaration checkbox.");
              return false;
          }
          return true;
      }
  </script>

   
    <%--Title Section--%>
    <div>
  <div class="title-section inner-banner">
      <div class="container">
      <div class="row">
      <div class="col-sm-12 col-padding-y">
      <div class="title-section-text">
      <h1>Apply for eVisa</h1>
      </div>
      </div>
      </div>
      </div>
  </div>

    <div class="container">
        <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12 col-padding-y">
                <div class="gen-info-box">
                    <div class="gen-info-box-head">
                        VISA Details
                        </div>
                     <div class="gen-info-box-body">
                        <div class="form-wrap-new">
                     <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 mb-10">
                    <label for="drpvisacountry">Choose your Country / Nationality<span class="man-data">*</span></label>
                    <div class="input-group">                                    
                        <asp:DropDownList ID="drpvisacountry" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">                                
                    <label for="drpvisatype">Visa Type<span class="man-data">*</span></label>
                            <div class="input-group">                                    
                        <asp:DropDownList ID="drpvisatype" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <label>Visa Duration<span class="man-data">*</span></label>
                        <div class="input-group">        
                    <asp:DropDownList ID="drpvisaduration" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    </div>

                            
                        </div>
                     </div>

                </div>

                    <div class="gen-info-box">
        <div class="gen-info-box-head">
        Personal/General Details
        </div>

        <div class="gen-info-box-body">
        <div class="form-wrap">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntxtName">Name</span></label>
            <div class="input-group">
        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntxtphonenumber">Phone Number</span></label>
            <div class="input-group">
        <asp:TextBox ID="txtPhonenumber" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <span id="spntxtEmailID">Email ID</span>
            <div class="input-group">
        <asp:TextBox ID="txtEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
        </div>

           
        </div>
        <div class="form-wrap">
        <div class="row">
        
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spndtGDDateOfBirth">Date of Birth</span></label>
        <div class="input-group">
          <input type="date" id="dtdob" class="form-control" runat="server" />
 </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnddGDGender">Gender</span></label>
        <div class="input-group">
        <asp:DropDownList ID="drpGender" CssClass="form-control" runat="server">
        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
        </asp:DropDownList>
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnddPEMaritalStatus">Marital Status</span></label>
        <div class="input-group">
        <asp:DropDownList ID="drpMaritalStatus" CssClass="form-control" runat="server">
            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
            <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
            <asp:ListItem Text="UnMarried" Value="UnMarried"></asp:ListItem>
        </asp:DropDownList>
        </div>
        </div>
        </div>
        </div>
        <div class="form-wrap-new">
        <div class="row">
        
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnfathername">Father's Name</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtFatherName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnmothername">Mother'S Name</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtMotherName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="SpnStreet Addres">Street Address 1</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtStreetAddress" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        </div>
        </div>
        </div>
        <div class=form-wrap-new">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <span id="spntxtPECity">City</span>
        <div class="input-group">
        <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntxtPEMilitaryPost">State, Territory, Region, Military Post</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox></div>
        </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
<label><span id="spncountryoforigin">Country Of Origin</span></label>
<div class="input-group">
    <asp:DropDownList ID="drpcountryoforigin"  CssClass="form-control" runat="server"></asp:DropDownList>
</div>

        </div>

        </div>
            </div>
            <div class=form-wrap-new">
            <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntxtPEZipCode">Zip Code</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtZipCode" CssClass="form-control" runat="server"></asp:TextBox></div>
        <div>
      </div>
         
        </div>
        </div>
        </div>
        </div>
            </div>
                <div class="gen-info-box">
        <div class="gen-info-box-head">
        Passport Details
        </div>

        <div class="gen-info-box-body">
        <div class="form-wrap">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnPassportNumber">Passport Number</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtPassportNumber" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnPassplaceofissue">Place of Issue</span></label>
        <div class="input-group">
        <asp:TextBox ID="txtPlaceofIssue" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <span id="spntxtdateofissue">Date of Issue</span>
        <div class="input-group">
       <input type="date" id="dtdateofissue" class="form-control" runat="server" />

        </div>
        </div>
        </div>
        </div>
   
        <div class="form-wrap">
        <div class="row">
    
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
     <span id="spnPassExpirydate">Passport Expiry Date</span>
        <div class="input-group">
        <input type="date" id="dtPassportExpirydate" class="form-control" runat="server" />

        </div>
        </div>
        
        </div>
        </div>
          

        </div>
                    </div>
        <div class="gen-info-box">
        <div class="gen-info-box-head">
        Travel Details
        </div>

        <div class="gen-info-box-body">
        <div class="form-wrap">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntrvlfromdate">Travel From Date</span></label>
        <div class="input-group">
        <input type="date" runat="server" class="form-control " id="dtPtravelfromdate" />
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <span id="spntrvltodate">To Date</span>
        <div class="input-group">
        <input type="date" runat="server"  class="form-control " id="dtPtraveltodate" />
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spntravelcomments">Comments</span></label>
        <div class="input-group">
        <asp:TextBox ID="txttravelcomments" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        </div>
        </div>
        </div>
   
          

        </div>

                            
                </div>
        <div class="gen-info-box">
        <div class="gen-info-box-head">
        Documents to upload
        </div>

        <div class="gen-info-box-body">
        <div class="form-wrap">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnpassportphoto">Passport size photo</span></label>
        <div class="input-group">
        <asp:FileUpload ID="filephoto" CssClass="form-control" runat="server" />
         
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <span id="spnPassportfronpage">Passport front page</span>
        <div class="input-group">
            <asp:FileUpload ID="filepassportfronpage" CssClass="form-control" runat="server" />
         
        </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnPassportLastPAge">Passport Last Page</span></label>
        <div class="input-group">
        <asp:FileUpload ID="filepassportlastpage" CssClass="form-control" runat="server" />
                
          
        </div>
        </div>
        </div>
        </div>
   
        <div class="form-wrap">
        <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <label><span id="spnpoliceclearance">Police Clearance</span></label>
        <div class="input-group">
        <asp:FileUpload ID="filePoliceclearance" CssClass="form-control" runat="server" />
              
        </div>
        </div>
        </div>
        </div>

        </div>

                            
                </div>

              <div class="gen-info-box">
            <div class="form-box">
            <div class="cmn-form-wrap paddingright">
            <div class="title"><b>Immigration Department Declaration</b></div>
            <div class="declaration-container">
            <div class="i_agree_checkbox">
            <input type="checkbox" id="idnApplicationdeclaration">
            <div class="paragraph">
            <span id="declarationText">
            I , [First Name] hereby declare that the Information provided in my application for Permit/Visa is true, complete and accurate to the best of my knowledge and belief.I understand that any false or misleading information may result in the rejection of my application or the termination of my Permit / Visa.
            </span></div>
            </div>
                </div>
         
     </div>

    </div>
    </div>
  <asp:Button ID="Button1" class="btn btn-primary" OnClientClick="return CheckDeclaration();" OnClick="Button1_Click" runat="server" Text="Submit" />

  <asp:Button ID="btnCancel" class="btn btn-primary" OnClick="btnCancel_Click" runat="server" Text="Cancel" />



                     
    </div>

        </div>
        </div>
    </div>

</div>
</asp:Content>
