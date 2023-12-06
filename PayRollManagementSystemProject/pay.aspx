<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pay.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm14" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
  
    <div class="row mt-5" style="margin-left:20px;margin-right:20px;">
        <div class="col">
         <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" BorderlineColor="Transparent" Palette="Pastel" RightToLeft="Yes" BackSecondaryColor="White" BackColor="Transparent" BackImageTransparentColor="White">
             <Series>
               <asp:Series Name="Series" ChartType="Pie"></asp:Series>
             </Series>
             <ChartAreas>
             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
             </ChartAreas>
             </asp:Chart>
          </div>
        <div class="col " style="margin-right:350px;">
            <div class="row" style="height:100px;"></div>
             <div class="row" style="height:200px;">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         
                         SelectCommand="SELECT [tax], [benefit], [retirement], [take_home], [member_id] FROM [payroll] " ConnectionString="<%$ ConnectionStrings:PayrollDBConnectionString %>"></asp:SqlDataSource>
                      <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server"  AutoGenerateColumns="False">
                         <Columns><asp:BoundField DataField="member_id" HeaderText="ID"  >
                              <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tax" HeaderText="Tax"  >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="benefit" HeaderText="Benefit"  >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>

                            <asp:BoundField DataField="retirement" HeaderText="Retirement"  >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                             <asp:BoundField DataField="take_home" HeaderText="Monthly salary"  >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            </columns>
                      </asp:GridView></div>
            <div class="col-4"></div>
                         
                     
        </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Take Home<br /> 
                           </h4>
                            
                            

                        </center>
                     </div>

                  </div>
                  <div class="row">
                   <div class="col">
                       <hr />
                   </div>  
                      
                  <div class="row mt-3">
                    
                    
                      <table class="table">
                          <thead>
                              <tr style="background:#FA812A; color:white;">
                                  <th scope="col">Type</th>
                                  <th scope="col">Percentage</th>
                                  <th scope="col">Total</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <th scope="row">Gross </th>
                                  <th scope="row">---</th>
                                   <th scope="row"><asp:Label ID="Label1" runat="server" ></asp:Label></th>  
                              </tr>

                              <tr>
                                  
                                  <th scope="row">Tax   </th>
                                  <th scope="row">13% </th>
                                  <th scope="row"> <asp:Label ID="Label2" runat="server"></asp:Label>  </th>          
                              </tr>
                               <tr>  
                                  <th scope="row">Benefit   </th>
                                  <th scope="row">3% </th>
                                  <th scope="row"> <asp:Label ID="Label3" runat="server"></asp:Label>  </th>          
                              </tr>
                               <tr>
                                  <th scope="row">Retirement   </th>
                                  <th scope="row">3% </th>
                                  <th scope="row"> <asp:Label ID="Label4" runat="server"></asp:Label>  </th>          
                              </tr>
                              <tr>
                                  <th scope="row">Take Home   </th>
                                  <th scope="row">--- </th>
                                  <th scope="row"> <asp:Label ID="Label6" runat="server"></asp:Label>  </th>          
                              </tr>

                          </tbody>
                      </table>
                     
                      </div>
                       
              </div>
          </div>

            
       

</asp:Content>
