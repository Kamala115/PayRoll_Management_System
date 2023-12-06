<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="time.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label3" runat="server"></asp:Label>
      <div style="margin-top:35px;"><center>
     Salary per Hour  <asp:Label ID="Label2" runat="server"></asp:Label>

       <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
      
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">





        <ContentTemplate>
          
            <div class="row">
                <div class="col">
                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ></asp:Label>
                    <asp:Timer ID="tm1" Interval="1000" runat="server" OnTick="tm1_Tick" />
                    <br />
                    <asp:Button ID="btnStart" style="margin-right:30px;" Text="StartWork" runat="server" OnClick="Start" />
                    <asp:Button ID="btnStop" Text="EndWork" runat="server" OnClick="Stop" /><br /></div> 
                </div>
                <div class="col">
                    <asp:Label ID="lblDateToday" runat="server"></asp:Label><br />
                    <asp:Label ID="lblTime" runat="server"></asp:Label>
                    <asp:Timer ID="TimerTime" runat="server" Interval="1000">
                    </asp:Timer>
                    <br />
                    <br />
                    <br />
                    
                    <br />
                    
                    <br />
                </div> 
            </div>
        </ContentTemplate>

        <Triggers>
            
            <asp:AsyncPostBackTrigger ControlID="tm1" EventName="Tick" />
            <asp:AsyncPostBackTrigger ControlID="TimerTime" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>

       
   </center>
          
</div>
    
   


</asp:Content>
