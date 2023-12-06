<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
  <div class="container-fluid mt-5 ">
      <div class="update" style="margin-top:30px; margin-bottom:30px;">
      <center>
      <div class="row"  >
         <div class="col-md-5 mx-auto" >
            <div class="card"style="height:600px; width:600px;">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4> Employ Details</h4>
                        </center>
                     </div>
                  </div>
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
                     <div class="col-md-4">
                        <label>Member ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full_name" ></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact_No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email_ID" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
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
                     <div class="col-md-4">
                        <label>Position</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Position" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Salary</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Salary" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
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
                     <div class="col-12">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Full_Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row mt-2" >
                       <div class="col-4 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-info" runat="server" Text="Update" OnClick="Button2_Click" />
                     </div>
                     <div class="col-4 mx-auto">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button3_Click" />
                     </div>
                    
                  </div>
               </div>
            </div>
         </div>
      </div>
     
    </div>
      <br />

         <div class="row" style="margin-left:10px;margin-right:10px;margin-top:10px;">
            
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                     </div>
                  </div>
                  <div class="row">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         
                         SelectCommand="SELECT [full_name], [dob], [contact_no], [email], [department], [Salary], [Position], [state], [full_address], [member_id], [password] FROM [Employee_tbl]" ConnectionString="<%$ ConnectionStrings:PayrollDBConnectionString %>"></asp:SqlDataSource>
                     
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                           <Columns>
                              <asp:BoundField DataField="member_id" HeaderText="Employee ID" ReadOnly="True" SortExpression="member_id" />
                              <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                              <asp:BoundField DataField="contact_no" HeaderText="Phone" SortExpression="contact_no" />
                              <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                              <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />                             
                              <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                              <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                              <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                 </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#FA812A" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                     </div>
                 </div>
              
          </div>
      <hr>
</asp:Content>
