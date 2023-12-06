<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payroll.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5"  style="margin-left:20px; margin-right:20px;">
      
      
      
      <div class="row"  >
         <div class="col-md-5 mx-auto" >
            
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee's Payment Details</h4>
                        </center>
                     </div>
                  </div>
                 
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
           
         
      </div>
     <br />
    </div>
         <div class="row" style="margin-left:10px;margin-right:10px;margin-top:10px;">
           <div class="col-md col-8 col-md-offset-2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         
                         SelectCommand="SELECT [member_id], [full_name], [total_earned] FROM [payroll]" ConnectionString="<%$ ConnectionStrings:PayrollDBConnectionString %>"></asp:SqlDataSource>
                      <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server"  AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="member_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" Width="100%" BorderWidth="1px" CellPadding="3">
                          <Columns>
                              <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id">
                              </asp:BoundField>
                              <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name">
                              </asp:BoundField>
                              <asp:BoundField DataField="total_earned" HeaderText="TotalEarned" SortExpression="total_earned"  >
                                

                               
                               <HeaderStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                                

                               
                               <asp:buttonfield buttontype="Button"  commandname="Update"    text="Pay">
                
           
                
                                <ControlStyle BackColor="#3366FF" ForeColor="White" />
               
                                <ItemStyle HorizontalAlign="Center" />
               
                                </asp:buttonfield>
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
