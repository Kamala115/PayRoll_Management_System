<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="timecard1.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
   <asp:Label ID="Label5" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
   <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>

    
    <div class="row" style="margin-left:10px;margin-right:10px;margin-top:30px;">
        <div class="col mx-auto">
             <div class="row">
                     <div class="col ">
                        <center>
                           <h4>Time Card<br /> 
                           </h4>
                            </center>
                            
                         <div class="row">
                         <div class="col">
                            <hr>
                         </div>
                    </div>
                        
                 </div>
                  </div>
                  <div class="row">
                     <div class="col">
                          
                     </div>
                      
                  <div class="row mt-4" >
                      <asp:GridView ID="GridView1" class="table table-striped table-bordered" Width="100%" runat="server"  AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
                       <Columns>
                            
                            <asp:BoundField DataField="Date" HeaderText="Date"  >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StartTime" HeaderText="Start Time"  >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EndTime" HeaderText="End Time"  >
                            
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            
                             <asp:BoundField DataField="Salary" HeaderText="Salary(per hour)"  >

                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Total Hours">

                                <ItemTemplate>
                                    <asp:Label ID="lblHour" runat="server" Text="0"></asp:Label>
                                </ItemTemplate>

                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                            </asp:TemplateField>
                          
                            
                             <asp:TemplateField HeaderText="Total Earned" FooterText="Grand Total">
                                 
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate >
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                 </FooterTemplate>
                               
                                 <FooterStyle HorizontalAlign="Center" />
                               
                                 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />


                            </asp:TemplateField>
                           
                            
                       </Columns>  
                    
                           <FooterStyle BackColor="White" ForeColor="#000066" />
                    
                           <HeaderStyle BackColor="#FA812A" Font-Bold="True" ForeColor="white" />
                    
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
             </div>
       


</asp:Content>
