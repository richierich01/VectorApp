<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="VectorWebForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Showing all student information </p>  
           
        </div>
        <asp:GridView ID="GvData" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
