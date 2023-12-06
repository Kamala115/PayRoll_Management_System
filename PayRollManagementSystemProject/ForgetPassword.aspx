<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="loginid mt-5">
      <div class="row ">
         <div class="col-md-4 mx-auto ">
            <div class="card" style="width:500px; height:500px;  ">
               <div class="card-body" >
                  <div class="row">
                     <div class="col d-grid align-items-center">
                        <center>
                            <img width="80" src="images/user2.jpg" />
                       </center>
                     </div>
                  </div><br />  
                   <div class="row">
                     <div class="col">
                        <hr />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr/>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">

                        <label>email</label>
                        <div class="form-group">                                                                                                     
                         <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
                        </div><br />
                           
                        

                        <div class="form-group text-center">                            
                           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><input class="btn btn-primary gap-4" id="Button2" type="button" value="LOGIN" /></asp:LinkButton>
                        </div>         
                       
                                            
                     </div>
                  </div>
               </div>
            </div>            
         </div>
     </div>
     </div>
</asp:Content>
