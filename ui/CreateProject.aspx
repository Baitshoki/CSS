<%@ Page Title="" Language="C#" MasterPageFile="~/master/site.master" AutoEventWireup="true" CodeFile="CreateProject.aspx.cs" Inherits="ui_CreateProject" %>


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
        Capture - Project Information
    </p>

   
    <table class="auto-style1">
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">
                        <asp:TextBox ID="txtcID" Visible="false" ReadOnly="true" runat="server" Width="281px" ></asp:TextBox>
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
            <td class="auto-style2" ><h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Project Information</b></h1></td>
            <td>&nbsp;</td>            
        </tr>


        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2"><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add New Project </h3></td>
            <td>&nbsp;</td>
         
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">
                <table class="auto-style1" border="0">
                
                    <tr>
                        <td  ="auto-style6" class="auto-style26">
                            &nbsp;</td>
                        <td class="auto-style7">
                    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtID" Visible="false"  CssClass="textbox" Text="id" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td  ="auto-style6" class="auto-style26">
                            <asp:Label ID="Label3" runat="server" Text="Project Name:"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtProjectName" runat="server" MaxLength="50"  placeholder="Enter Project Name"   CssClass="textbox"    Width="330px" ></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            &nbsp;</td>
                    </tr>
                  

                    
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
                         
                            <asp:Button ID="btnInsertProjectName"  runat="server" Font-Bold="True"  ForeColor="White" Width="330px"  Text="Create Project" BackColor="#4CAF50"  CssClass="roundedconer" Height="50px" OnClick="btnInsertProjectName_Click"   />
                           
                            </td>
                        <td class="auto-style14"></td>
                    </tr>

                 

                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                            <asp:Button ID="btnRefresh" runat="server" Font-Bold="True" Text="Refresh" CssClass="btnSave" BackColor="Red"   ForeColor="White" Width="330px" />
                            </td>
                        <td class="auto-style19"></td>
                    </tr>

                </table>
            </td>
            <td>&nbsp;</td>
         
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style2">
                            <asp:HiddenField ID="txtHidden" runat="server"  />
                             <asp:HiddenField ID="txtEmpID" runat="server"  />
                        </td>
            <td>&nbsp;</td>
        
        </tr>
    </table>





      <div>
    
     
      <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td>
                            <br />
                            <br />
                            <br />
                            </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td> 

                    <%-- DataSourceID="SqlDataSource1"--%>
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
              <td>  &nbsp;</td>
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
