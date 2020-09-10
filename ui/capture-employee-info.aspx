<%@ Page Language="C#" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="capture-employee-info.aspx.cs" MasterPageFile="~/master/site.master" CodeFile="~/ui/capture-employee-info.aspx.cs" Inherits="TimeTracker.ui.capture_employee_info" %>




<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:content id="Content1" runat="server" contentplaceholderid="head" align="center">

</asp:content>

<asp:content id="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1" >

    
    <link href="../css/myStyle.css" rel="stylesheet" />


    <script type="text/javascript">
    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onunload = function() {
        null
    };
</script>

    <style type="text/css">
    .submit {
        border: 1px solid #3366FF;
        border-radius: 5px;
        color: white;
        padding: 5px 10px 5px 25px;
        background: url(../images/msexcel.png)
        left 3px  no-repeat #3366FF;
    }
</style>

 <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 634px;
        }
        .auto-style7 {
            width: 347px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            width: 104px;
        }
        .auto-style10 {
            width: 300px;
        }
        .auto-style11 {
            width: 91%;
        }
        .auto-style12 {
            width: 402px;
            height: 34px;
        }
        .auto-style13 {
            width: 347px;
            height: 34px;
        }
        .auto-style14 {
            height: 34px;
        }
        .auto-style15 {
            width: 115px;
        }
        .auto-style17 {
            width: 402px;
            height: 19px;
        }
        .auto-style18 {
            width: 347px;
            height: 19px;
        }
        .auto-style19 {
            height: 19px;
        }
        .auto-style21 {
            width: 239px;
        }
        .auto-style22 {
            width: 347px;
        }
        .auto-style23 {
            width: 402px;
            height: 22px;
        }
        .auto-style24 {
            width: 347px;
            height: 22px;
        }
        .auto-style25 {
            height: 22px;
        }
        .auto-style26 {
            width: 402px;
        }
        </style>

 <style type="text/css">
      .modalPopup{
          background-color: gray ;
          width:400px;
          height:450px;
       
      }

     .modalPopup .roundbox-top
     {    
       -moz-border-radius: 4px 4px 0 0;
        -webkit-border-radius: 4px 4px 0 0;    
        border-radius: 4px 4px 0 0;
     }
     .modalPopup .roundbox-bottom
     {    
       -moz-border-radius: 0 0 4px 4px;
       -webkit-border-radius: 0 0 4px 4px;
       border-radius: 0 0 4px 4px;
      }

      .modalPopup .header
      {
          background-color:   #3366FF;
          height:30px;
          color: white;
          line-height:30px;
          text-align:left;
          font-weight:bold;
      }

      .modalPopup .footer
      {
          padding:3px;

      }

     .modalPopup .button
     {
         border: 0px solid #5C5C5C;
         font-weight: bold;
        
              
     }

     

     </style>

<asp:ToolkitScriptManager  ID="ToolkitScriptManagerID" runat="server"></asp:ToolkitScriptManager>

    <p  style:"font-size:large; background-color: yellow; font-weight:bold" >
        Capture - Employee Information
    </p>

   
    <table class="auto-style1">
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">
                        <asp:TextBox ID="txtEmployeeID" Visible="false" ReadOnly="true" runat="server" Width="281px" ></asp:TextBox>
                        </td>
            <td>
                <table class="auto-style11">
                    <tr>
                        <td class="auto-style10">&nbsp;</td>
                        <td class="auto-style9">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                         <b><asp:Label ID="lblSessionEmailname" runat="server" Text="Username :" /></b>  <asp:Label ID="lblSessionEmail" runat="server" Text="" ></asp:Label>
                           
                        &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>            
        </tr>
        
         <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2" ><h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Client Information</b></h1></td>
            <td>&nbsp;</td>            
        </tr>


        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2"><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search by email address and update Client/Company information.</h3></td>
            <td>&nbsp;</td>
         
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">
                <table class="auto-style1" border="0">
                
                    <tr>
                        <td  ="auto-style6" class="auto-style26">
                            <asp:HiddenField ID="txtHiddenID" runat="server"  />
                             <asp:HiddenField ID="txtEmpID" runat="server"  />
                        </td>
                        <td class="auto-style7">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Text=""></asp:Label>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtID" Visible="false"  CssClass="textbox" Text="id" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td  ="auto-style6" class="auto-style26">
                            <asp:Label ID="Label3" runat="server" Text="Email Address:"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"  placeholder="Enter Username/Email Address"   CssClass="textbox"   TextMode="Email" Width="330px" ></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:Button ID="btnSearchClient" runat="server" Font-Bold="True" Text="Search Client" CssClass="savebtn" Visible="false" BackColor="#4CAF50"  Width="119px" ForeColor="White" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtName"   CssClass="textbox" runat="server" Width="330px" ></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtSurname" CssClass="textbox" runat="server" Width="330px" ></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label7" runat="server" Text="Cellphone Number:"></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtCell" runat="server" CssClass="textbox"   Width="330px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>

                      <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtPwd" runat="server" CssClass="textbox"   Width="330px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td class="auto-style18">                           
                            <asp:Label ID="Label15" runat="server" Text="Role:"></asp:Label>
                        </td>
                        <td class="auto-style15"> <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="false" Height="90px"  Width="336px">
                           
                            </asp:DropDownList></td>
                        <td class="auto-style13"><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="Red" ControlToValidate="ddlRole" ErrorMessage="*"
                             SetFocusOnError="True" >
                           </asp:RequiredFieldValidator></td>
                    </tr>


                  
                    <tr>
                        <td class="auto-style26">
                            &nbsp;</td>
                        <td class="auto-style22">
                            &nbsp;</td>
                        <td>&nbsp;</td>
            

                       <asp:Label id="lblPopup" runat="server" Text="Label"></asp:Label>

                     <tr>
                        <td class="auto-style23">
                            </td>
                        <td class="auto-style24">
                            </td>
                        <td class="auto-style25"></td>
                    </tr>



    



                    <tr>
                        <td class="auto-style12">
                            &nbsp;</td>
                        <td class="auto-style13">
                         
                            <asp:Button ID="btnInsertUpdateInfo"   runat ="server" Font-Bold="True"  ForeColor="White" Width="330px" CssClass="btnSave" Text="Update User Details" BackColor="#4CAF50" OnClick="btnInsertUpdateInfo_Click"  />
                           
                            </td>
                        <td class="auto-style14"></td>
                    </tr>

                    <tr>
                        <td class="auto-style12">
                            &nbsp;</td>
                        <td class="auto-style13">
                         
                            <asp:Button ID="btnInsertAddUpdateTimeSheet"  runat="server" Font-Bold="True"  ForeColor="White" Width="330px"  Text="Fill TimeSheet" BackColor="#4CAF50"  CssClass="roundedconer" Height="50px" OnClick="btnInsertAddUpdateTimeSheet_Click"   />
                           
                            </td>
                        <td class="auto-style14"></td>
                    </tr>
                   
                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                            <asp:Button ID="btnCreateProject" runat="server" Font-Bold="True"  ForeColor="White" Width="330px" CssClass="btnSave" Text="Create Project" BackColor="#4CAF50" OnClick="btnCreateProject_Click" />
                            </td>
                        <td class="auto-style19"></td>
                    </tr>

                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                            <asp:Button ID="btnRefresh" runat="server" Font-Bold="True" Text="Refresh" CssClass="btnSave" BackColor="Red" OnClick="btnRefresh_Click"  ForeColor="White" Width="330px" />
                            </td>
                        <td class="auto-style19"></td>
                    </tr>

                </table>
            </td>
            <td>&nbsp;</td>
         
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        
        </tr>
    </table>


      

       


      <div>
    <%--<form></form>--%>
     
      <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td>
                            <br />
                             <asp:Label ID="lblMsg0" runat="server" Font-Bold="True" Text="Load TimeSheet Entries" ForeColor="#3366FF" BorderStyle="Dotted" Width="320px" Height="22px"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnExportToExcel" runat="server" Height="34px" Text="ExportToExcel"  Width="215px" Font-Bold="True" CssClass="submit" OnClick="btnExportToExcel_Click" />
                            <br />
                            <br />
                            </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td> 
                
                    <%-- DataSourceID="SqlDataSource1"--%>
                    <asp:GridView ID="GridViewTimeSheet" runat="server" AutoGenerateColumns="False" 
                        EmptyDataText="There are no Entries to display - Please search existing Employee ." AllowPaging="true" 
                       AllowSorting="true" Width="90%"  BackColor="White" BorderColor="#999999"
                      PageSize="15" HorizontalAlign="Left" Height="70px" ControlStyle-Font-Size="Small" OnRowUpdating="GridViewTimeSheet_RowUpdating" OnRowCancelingEdit="GridViewTimeSheet_RowCancelingEdit" OnRowEditing="GridViewTimeSheet_RowEditing"  >
                       <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                             <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Emp ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EmployeeId" runat="server" Text='<%#Eval("EmployeeId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Surname">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Surname" runat="server" Text='<%#Eval("Surname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Surname" runat="server" Text='<%#Eval("Surname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                 <asp:TemplateField HeaderText="Role">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Role" runat="server" Text='<%#Eval("Description") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Role" runat="server" Text='<%#Eval("Description") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="Project Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ProjectName" runat="server" Text='<%#Eval("ProjectName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_ProjectName" runat="server" Text='<%#Eval("ProjectName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Start Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StartTime" runat="server" Text='<%#Eval("StartTime") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StarTime" runat="server" Text='<%#Eval("StartTime","{0:dd-MM-yyyy}") %>'></asp:TextBox>  
                    </EditItemTemplate>
                     
                </asp:TemplateField> 
                 <asp:TemplateField HeaderText="End Date">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_EndTime" runat="server" Text='<%#Eval("EndTime") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_EndTime" runat="server" Text='<%#Eval("EndTime","{0:dd-MM-yyyy}") %>'></asp:TextBox> 
                       
                    </EditItemTemplate>  
                </asp:TemplateField> 


                      </Columns>
                         <FooterStyle BackColor="#CCCCCC" ForeColor="Black"  Font-Size="X-Small" />
                     <HeaderStyle BackColor= "#3366FF" Font-Bold="True" ForeColor="#333333"  Font-Size="Small" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="X-Small" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"  Font-Size="X-Small"  />
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
        </table>
    
    </div>
    <div>
    
    </div>
    <div>
        <br />

       
    
    </div>

  

</asp:content>






