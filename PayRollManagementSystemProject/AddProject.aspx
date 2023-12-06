<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="register mt-4" >
      <div class="row ">
         <div class="col mx-auto ">
            <div class="card mx-auto" style="height:300px; width:300px;">
               <div class="card-body">                 
                  <div class="row">
                     <div class="col">
                        <hr/>
                     </div>
                  </div>
                  <div class="row  ">
                     <div class="col-8 m-4">
                        
                         <label>ProjectName</label><asp:Label ID="Label1" runat="server" ></asp:Label>
                            &nbsp;<div class="form-group">                                                                                                                
                          <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ProjectName"></asp:TextBox>
                        </div>

                         <label>Assigned To</label><asp:Label ID="Label2" runat="server" ></asp:Label>
                            &nbsp;<div class="form-group">                                                                                                                
                          <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Assigned_To" ></asp:TextBox>
                        </div>
                         <br />
                        <div class="form-group text-center">                             
                           <asp:LinkButton ID="LinkButton" runat="server" OnClick="LinkButton_Click" ><input class="btn btn-primary gap-4" id="Button2" type="button" value="ADD" /></asp:LinkButton>
                        </div>         
                        
                      </div>                      
                  </div>
               </div>
            </div>            
         </div>
     </div>
     </div>

</asp:Content>
