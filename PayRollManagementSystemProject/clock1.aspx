<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="clock1.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper" style="margin-top:100px;">
	  
          <div class="row mx-auto" >
              <div class="col">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <div class="time" Style=" text-align:center">
                <asp:Button ID="btnStart" style="margin-right:60px;background:linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123));" Text="StartWork" runat="server" OnClick="Start" Height="80px" Width="150px" BorderWidth="0px" />
                <asp:Button ID="btnStop" Text="EndWork" style="background:linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123));" runat="server" OnClick="Stop" Height="80px" Width="150px" BorderStyle="Groove" BorderWidth="0px" /><br />
                </div>

                <asp:Label ID="Label3" runat="server" Text="pending" Visible="false"></asp:Label>
                  </div>
              </div>
          
    </div>

</asp:Content>
