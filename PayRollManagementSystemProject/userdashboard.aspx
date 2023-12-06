<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userdashboard.aspx.cs" Inherits="PayRollManagementSystemProject.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="userdash" style="margin-top:20px; margin-left:30px; margin-right:30px;">
      
           <div class="intro" style="width:500px;height:60px; margin-bottom:20px;font-family:Baskerville;font-size:35px;padding-top:10px;">
               
            Goodmorning, <asp:Label ID="Label1" runat="server" ></asp:Label>
               
            </div><br /><br />
        <div class="timer" style="font-size:38px;">
           Current Time
       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="TimerTime" runat="server" Interval="1000">
        </asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Label ID="lblDateToday" runat="server"></asp:Label>
                <asp:Label ID="lblTime" runat="server"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="TimerTime" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        </div>
         <br /><br /><br /><br />
       

        
         <div class="recomand">
           <div class="row" style="margin-top:10px; margin-bottom:10px">
              <div class="col-md-4">
                  <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
                  
                  <div class="card" style="height:80px;width:400px;background: linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123));">
                       <div class="card-body">
                           <center>
                     <i class="fa fa-solid fa-money-bills fa-2x"></i>
                           <span class="ms-3 d-none d-sm-inline" style="font-size:30px;"> Pay</span>
                            </center>
                        </div>
                  </div>
                  </asp:LinkButton>
              </div>
             
               <div class="col-md-4">
                   <asp:LinkButton ID="LinkButton44" runat="server" OnClick="LinkButton44_Click">
                   <div class="card" style="height:80px;width:400px;background: linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123));">
                        <div class="card-body">
                        <center>
                       <i class="fa-regular fa-calendar-check fa-2x"></i>
                      <span class="ms-3 d-none d-sm-inline" style="font-size:30px;">Time Off</span>
                        </center>
                        </div>                   
                  </div>
                  </asp:LinkButton>
               </div>
               <div class="col-md-4">
                   <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                   <div class="card" style="height:80px; width:400px;background: linear-gradient(to top, rgb(255, 126, 95), rgb(254, 180, 123));">
                       <div class="card-body">
                        <center>
                        <i class="fa-duotone fa-calendar-days fa-2x"></i>
                        <span class="ms-3 d-none d-sm-inline" style="font-size:30px;"> Timecard</span>
                        </center>
                        </div>
                  </div>
                       </asp:LinkButton>
               </div>
           </div>
         </div>
   
    </div>

</asp:Content>
