<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="timeoff.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container " style="margin-left:10px;margin-right:10px;margin-top:30px;"">
      <div class="row">
         <div class="col ">
            <div class="card  mx-auto" style="height:600px; width:600px; ">
               <div class="card-body " >
                   

                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100" src="images/user2.jpg" />
                        </center>
                     </div>
                      
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                     <div class="row " >
                     <div class="col-md-6">
                        <label>ID    :</label> <asp:Label ID="Label11" runat="server"  ></asp:Label><asp:Label ID="Label2" runat="server" ></asp:Label>
                        
                     </div>
                   
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Full Name  :</label><asp:Label ID="Label22" runat="server" ></asp:Label><asp:Label ID="Label1" runat="server" ></asp:Label>
                        <div class="col-md-6">
                            

                            </div>
                     </div>
                   
                  </div>
                 
                   <div class="row ">
                     <div class="col-md-6">
                        <label>Department :</label><asp:Label ID="Label3" runat="server" ></asp:Label>  
                              

                     </div>
                     
                    
                       </div>
                   <br />

                  <div class="row ">
                     <div class="col-md-6">
                        <label>Start Date</label><asp:Label ID="Label10" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="StartDate" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                        <label>End Date</label>
                        <div class="form-group"><asp:Label ID="Label7" runat="server" ></asp:Label>
                           <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="EndDate" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                    
                    
                  </div>
                   <div class="row ">
                        <div class="col-md-6">
                            <label>Start Time</label><asp:Label ID="Label6" runat="server" ></asp:Label>
                            <div class="form-group">
                               <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="StartTime" TextMode="Time"></asp:TextBox>
                            </div>
                         </div>
                       <div class="col-md-6">
                        <label>Leave Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Sick" Value="Sick" />
                              <asp:ListItem Text="Vacation" Value="Vacation" />
                              <asp:ListItem Text="Personal" Value="Personal" />
                              </asp:DropDownList>
                        </div>
                     </div>
                   </div>
                  <div class="row">
                     <div class="col-md-12">
                        <label>Hours </label><asp:Label ID="Label5" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Example_8" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   
                  <br />
                  <div class="row ">
                     <div class="col">
                         <div class="text-center">
                        <div class="form-group ">
                           <asp:Button class="btn btn-primary btn-block btn-lg align-lg-center"  ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </div>
                     </div>
                     </div>
                  </div>
                 
               </div>
            </div>
           
         </div>
      </div>
   </div>


</asp:Content>
