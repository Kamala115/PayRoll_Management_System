<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card" style="height:700px; width:600px; ">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100" src="images/user2.jpg" />
                        </center>
                     </div>
                  </div>
                  
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label><asp:Label ID="Label1" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="full_name"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label><asp:Label ID="Label2" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="dob" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label><asp:Label ID="Label3" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="contact_no"  ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Email ID</label><asp:Label ID="Label4" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="email" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                 
                   <div class="row">
                     <div class="col-md-6">
                        <label>Department</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Sales" Value="Sales"></asp:ListItem>
                             <asp:ListItem Text="Management" Value="Management"></asp:ListItem>
                             <asp:ListItem Text="Marketing" Value="Marketing"></asp:ListItem>
                             <asp:ListItem Text="Finance" Value="Finance"></asp:ListItem>
                             <asp:ListItem Text="Operation" Value="Operation"></asp:ListItem>   
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Position</label><asp:Label ID="Label10" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Position"></asp:TextBox>
                        </div>
                     </div>
                       
                       </div>


                  <div class="row">
                       <div class="col-md-6">
                        <label>Salary</label>
                        <div class="form-group"><asp:Label ID="Label7" runat="server" ></asp:Label>
                           <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Salary" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>State</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Province No 1" Value="Province No 1" />
                              <asp:ListItem Text="Madesh Pradesh" Value="Madesh Pradesh" />
                              <asp:ListItem Text="Bagmati Pradesh" Value="Bagmati Pradesh" />
                              <asp:ListItem Text="Gandaki Pradesh" Value="Gandaki Pradesh" />
                              <asp:ListItem Text="Lumbini Pradesh" Value="Lumbini Pradesh" />
                              <asp:ListItem Text="Karnali Pradesh" Value="Karnali Pradesh" />
                              <asp:ListItem Text="Sudur Pashchim Pradesh" Value="Sudur Pashchim Pradesh" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     
                    
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Full Address</label><asp:Label ID="Label5" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="full_address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                 
                  <div class="row">
                     <div class="col-md-6">
                        <label>Member ID</label><asp:Label ID="Label8" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="member_id"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Password</label><asp:Label ID="Label9" runat="server" ></asp:Label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="password" TextMode="Password"></asp:TextBox>
                        <br /></div>
                     </div>
                  </div>
                   
                  <div class="row">
                     <div class="col ">
                        <div class="text-center">
                        <div class="form-group">
                           <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
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
