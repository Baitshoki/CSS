<%@ Page Title="" Language="C#" MasterPageFile="~/master/site.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="ui_register" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password], input[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.textbox[type=text], .textbox[TextMode=password], .textbox[TextMode=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}


/* Set a style for all buttons */
.btnSave {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Extra styles for the save button */
.savebtn {
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.textbox {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
    .auto-style5 {
        width: 353px;
    }
    .auto-style7 {
        width: 388px;
    }
</style>





<style>
	.roundedTable
	{
		border-radius: 6px 6px 6px 6px;
		border: 1px solid #000;  
		border-spacing: 0;
		width: 500px;
	}

	.roundedTable tr:first-child td:first-child 
	{
		border-top-left-radius: 5px;
	}
	
	.roundedTable tr:first-child td:last-child 
	{
		border-top-right-radius: 5px;
	}
	
	.roundedTable tr:last-child td:first-child 
	{
		border-bottom-left-radius: 5px;
	}
	
	.roundedTable tr:last-child td:last-child 
	{
		border-bottom-right-radius: 5px;
	}
/* optional setting to pad the table cells */
	.roundedTable th, td
	{
		padding: 10px 10px 10px 10px; 
	}
/* optional setting to set the background color and font color of the first row - behave like a header */
	.roundedTable tr:first-child td:first-child 
	{
		background-color: #000;
		color: #FFF;
	}
/* optional setting to set the background color of the last row - behave like a footer */
	.roundedTable tr:last-child td:last-child 
	{
		background-color: #CCC;
	}
    .auto-style5 {
        width: 486px;
    }
    .auto-style7 {
        border-radius: 6px 6px 6px 6px;
        border: 1px solid #3366FF;
        border-spacing: 0;
        width: 600px;
    }
    .auto-style10 {
        width: 461px;
    }
    .auto-style11 {
        width: 145px;
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

    <div></div>

   <table   >
      
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style5">
                <asp:HiddenField ID="txtHidenEmpID" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style10">

    <table class="auto-style7"  style="background-color:white" >
        <tr>
            <td >

            </td>
            <td >
             <br />

                 <label for="fname" style="color:#000033"><b>Name</b></label>
   
                   <asp:TextBox ID="txtFName" runat="server" placeholder="Enter Full Names"   CssClass="textbox"  ></asp:TextBox>
        
                 <label for="sname" style="color:#000033"><b>Surname</b></label>
   
                   <asp:TextBox ID="txtSName" runat="server" placeholder="Enter Surname"   CssClass="textbox"  ></asp:TextBox>
        




              <label for="email" style="color:#000033"><b>Username/EmailAddress</b></label>
   
                   <asp:TextBox ID="txtEmailAddress" runat="server" placeholder="Enter Username/EmailAddress"   CssClass="textbox"   TextMode="Email"></asp:TextBox>


                 <label for="cell" style="color:#000033"><b>Cell Number</b></label>
   
                   <asp:TextBox ID="txtCell" runat="server" placeholder="Enter Cell Number"   CssClass="textbox"  ></asp:TextBox>
        
                                       
                
                  <label for="pwd"  style="color:#000033"><b>Password</b></label>
          
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password" Text="Enter Password"  CssClass="textbox"  TextMode="Password"></asp:TextBox>
    
                <label for="role" style="color:#000033"><b>Role</b></label>
                  
                  <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="false" Height="90px"  Width="336px">
                           
                  </asp:DropDownList>

                <br />
                <br />
                <br />

                <br />

        <asp:Button ID="btnRegister" CssClass="btnSave" runat="server" Text="Login" OnClick="btnRegister_Click" />

     
      <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>



            </td>
            <td class="auto-style5">

            </td>
        </tr>

    </table>

   </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
       
    </table>

   



</asp:Content>
   