<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OnLeave.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userdash mt-5" style=" margin-left:20px; margin-right:20px; ">
        <div class="row">
            <center><h3>Leave Request</h3></center>
        </div>
         <div class="col mt-3">
           <asp:GridView ID="GridView1" runat="server" width="100%" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID"  OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID"  />
                    <asp:BoundField DataField="Name" HeaderText="Name"  />
                    <asp:BoundField DataField="Department" HeaderText="Department"  />
                    <asp:BoundField DataField="Request_type" HeaderText="Request_type"  />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate"  />
                    <asp:BoundField DataField="StartTime" HeaderText="StartTime"  />
                    <asp:BoundField DataField="Hours" HeaderText="Hours"  />
                    <asp:TemplateField HeaderText="Status">
                   
                    <ItemTemplate>
                        <asp:Label ID="txtbox" Text='<%# Eval("Status") %>' runat="server"></asp:Label>
                    
                        </ItemTemplate> 
                    </asp:TemplateField>

              
                    <asp:buttonfield buttontype="Button"  commandname="Update"    text="Accept">
                
           
                
                <ControlStyle BackColor="#3366FF" ForeColor="White" />
               
                </asp:buttonfield>
                
           
                
                <asp:CommandField ShowDeleteButton="true"  ButtonType="Button" DeleteText="Decline">
                
                <ControlStyle BackColor="Red" BorderColor="Red" ForeColor="White" />
                </asp:CommandField>
                <asp:TemplateField > <ItemTemplate> <asp:LinkButton ID="lnkHide" runat="server" Text="X" OnClick="LnkHide_Click" /> </ItemTemplate> </asp:TemplateField>
 
                
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
</asp:Content>
