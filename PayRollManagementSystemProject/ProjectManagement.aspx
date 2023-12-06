<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
  <div class="container-fluid">
      <div class="update" style="margin-top:30px; margin-bottom:30px;">
      <center>
      <div class="row"  >
         <div class="col-md-5 mx-auto" >
            <div class="card" style="height:300px; width:400px;">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Project Details</h4>
                        </center>
                     </div>
                  </div>
                 
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   
                  <div class="row">
                     <div class="col-md-5 mx-auto">
                        <label>Project</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ProjectName"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" style="background: linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123)); " ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     
                     
                  </div>
                   
                  <div class="row ">
                     <div class="col-md-6 mx-auto">
                       <label>Assigned To</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Assigned_To" ></asp:TextBox>
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
     <br />
    </div>
         <div class="row" style="margin-left:10px;margin-right:10px;margin-top:10px;">
            
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Project List</h4>
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
                     </div>
                  </div>
                  <div class="row mx-auto" >
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         
                         SelectCommand="SELECT [project_name], [assignedTo] FROM [project]" ConnectionString="<%$ ConnectionStrings:PayrollDBConnectionString %>"></asp:SqlDataSource>
                      <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                          <Columns>
                              <asp:BoundField DataField="project_name" HeaderText="Project Name" SortExpression="project_name">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="assignedTo" HeaderText="Assigned To" SortExpression="assignedTo">
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                          </Columns>
                      </asp:GridView>
                     </div>
                 </div>
              
         </div>
      </div>
      <hr>


</asp:Content>
