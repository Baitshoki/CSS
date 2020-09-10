<%@ Page Title="" Language="C#" MasterPageFile="~/master/site.master" AutoEventWireup="true" CodeFile="timesheet_entries.aspx.cs" Inherits="ui_timesheet_entries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 1244px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 4px;
        }
        .auto-style4 {
            width: 869px;
        }
    </style>

    <script type="text/javascript">
    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onunload = function() {
        null
    };
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
      <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td>
                            <br />
                             <asp:Label ID="lblMsg0" runat="server" Font-Bold="True" Text="Load Correspondance" ForeColor="#4CAF50" BorderStyle="Dotted" Width="320px" Height="22px"></asp:Label>
                            <br />
                            <br />
                            </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td> 

                    <%-- DataSourceID="SqlDataSource1"--%>
                    <asp:GridView ID="GridViewTimesheet" runat="server" AutoGenerateColumns="False" 
                        EmptyDataText="There is no list of correspondance" AllowPaging="True" 
                       AllowSorting="True" Width="90%"  BackColor="White" BorderColor="#999999"
                      PageSize="20" HorizontalAlign="Left" Height="70px" ControlStyle-Font-Size="Medium" OnPageIndexChanging="GridViewTimesheet_PageIndexChanging">
                       <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                                  
                  <asp:TemplateField HeaderText="Emp ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EmployeeId" runat="server" Text='<%#Eval("EmployeeId") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField> 
              
                 <asp:TemplateField HeaderText="Project Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ProjectName" runat="server" Text='<%#Eval("ProjectName") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField> 

                  <asp:TemplateField HeaderText="Start Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StartDate" runat="server" Text='<%#Eval("StartDate") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="End Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EndDate" runat="server" Text='<%#Eval("EndDate") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField> 

                
                      </Columns>
                         <FooterStyle BackColor="#CCCCCC" ForeColor="Black"  Font-Size="Medium" />
                     <HeaderStyle BackColor= "#3366FF" Font-Bold="True" ForeColor="#333333"  Font-Size="Small" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="X-Small" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"  Font-Size="Medium"  />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                          </td>
                <td>&nbsp;</td>

            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
               
              <td>
              

                  <br />
                     
               </td>
                <td></td>
            </tr>
           <tr>
                <td class="auto-style15">&nbsp;</td>
              <td>  <asp:Label ID="lblRecord"  Text="" runat="server"></asp:Label></td>
                <td>&nbsp;</td>
            </tr>

          <tr>
                <td class="auto-style15">&nbsp;</td>
               
              <td>
              

                  <br />
                     
               </td>
                <td></td>
            </tr>

          <tr>
                <td class="auto-style15">&nbsp;</td>
               
              <td>
              

                  <table class="auto-style2">
                      <tr>
                          <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                          <td class="auto-style4">&nbsp;
                               <asp:Button ID="btnGoBack"   runat ="server" Font-Bold="True"   ForeColor="White" Width="330px" CssClass="auto-style27" Text="Go Back" BackColor="#4CAF50"  Height="50px" OnClick="btnGoBack_Click"  />

               
                          </td>
                          <td>&nbsp;</td>
                      </tr>
                  </table>
              

                  <br />
                     
               </td>
                <td></td>
            </tr>
          <tr>
                <td class="auto-style15">&nbsp;</td>
               
              <td>
              

                  <br />
                     
               </td>
                <td></td>
            </tr>
        </table>
    


</asp:Content>

