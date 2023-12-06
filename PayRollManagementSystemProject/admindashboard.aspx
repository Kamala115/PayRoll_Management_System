<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admindashboard.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
			  <div class="recomand mb-5" >
           <div class="row" style="margin-top:10px; margin-bottom:10px">
              <div class="col-md-4">
                  <div class="card bg-success" style="height:150px;width:400px;color:white">
                       <div class="card-body">
                           <center>
                          <div class="row " style="margin-bottom:15px; font-size:30px;">
                              
                            <i class="fa fa-solid fa-users fa-2x"></i>
                          </div>

                              <div class="row" >
                            <asp:Label ID="Label3" runat="server" ></asp:Label>
                                </div>

                           <div class="row">
                           <span class="ms-3 d-none d-sm-inline" style="font-size:20px;"> Total Employee</span>
                            </div>
                              
                             
                               </center> 
                            </div>
                        </div>
                  
              </div>
               <div class="col-md-4">
                   <div class="card bg-danger" style="height:150px;width:400px;color:white;">
                        <div class="card-body">
                        <center>
                        <div class="row" style="margin-bottom:15px; font-size:30px;" >
                       <i class="fa-regular fa-calendar-check fa-2x"></i>
                        </div>
                         <div class="row" >
                        <asp:Label ID="Label1" runat="server" ></asp:Label>
                              <span class="ms-3 d-none d-sm-inline" style="font-size:20px;"> Employee on leave</span>
                           
                            </div>
                         
                           
                         </center>
                        </div>
                  </div>
               </div>
               <div class="col-md-4">
                   <div class="card bg-info" style="height:150px;width:400px; color:white;">
                       <div class="card-body">
                        <center>
                        <div class="row" style="margin-bottom:15px; font-size:30px;">
                           <i class="fa-solid fa-briefcase fa-2x"></i>
                        </div>
                        <div class="row">
                        <asp:Label ID="Label2" runat="server" ></asp:Label>
                         </div>
                        <div class="row">
                        <span class="ms-3 d-none d-sm-inline" style="font-size:20px;"> Total projects</span>
                        </div>
                        </center> 
                        </div>
                  </div>
               </div>
            </div>
          </div>
           <div class="displaydata">
              <div class="row">
               <div class="col">
                    
                   
                 <asp:Chart ID="Chart1" runat="server" BorderlineColor="Transparent" Palette="Pastel" RightToLeft="Yes" BackSecondaryColor="White" BackColor="Transparent" BackImageTransparentColor="White" Height="600px">
             <Series>
               <asp:Series Name="Series" YValuesPerPoint="2"></asp:Series>
             </Series>
             <ChartAreas>
             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
             </ChartAreas>
             </asp:Chart>
                   </div>
                   <div class="col">
                      <span class="ms-3 d-none d-sm-inline" style="font-size:20px;">Employee on Leave</span>
                          
    
                <asp:GridView ID="GridView1" Height="350px" Width="90%" runat ="server" CssClass="mydatagrid" PagerStyle-CssClass="pagination-ys"
                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="project_name" HeaderText="Project name" SortExpression="project_name" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="assignedTo" HeaderText="Assigned To" SortExpression="assignedTo" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle CssClass="header" BackColor="#FA812A" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle CssClass="pagination-ys" BackColor="White" ForeColor="#000066" HorizontalAlign="Left"></PagerStyle>

                    <RowStyle CssClass="rows" ForeColor="#000066"></RowStyle>
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                   </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PayrollDBConnectionString %>" SelectCommand="SELECT [project_name], [assignedTo] FROM [project]"></asp:SqlDataSource>
                 
              </div>     
             </div>   
           </div>
        </div>


</asp:Content>
