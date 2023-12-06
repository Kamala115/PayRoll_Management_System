<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm16.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md col-8 col-md-offset-2">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID"  OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" Width="706px">
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

              
                 <asp:buttonfield buttontype="Button"  commandname="Update"    text="Accept"/>
                
           
                
                <asp:CommandField ShowDeleteButton="true"  ButtonType="Button">
                
                <ControlStyle BackColor="Red" BorderColor="Red" />
                </asp:CommandField>
                
            </Columns>
        </asp:GridView>
       
      </div>


</asp:Content>
