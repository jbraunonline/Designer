<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DivTest.aspx.vb" Inherits="RadDesigner.DivTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
.container {
    width:1000px;
    height: 500px;
    background: aqua;
    margin: auto;
    padding: 10px;
}
.one {
    width: 75%;
    height: 200px;
    background: red;
    float: left;
}
.two {
    margin-left: 15%;
    height: 200px;
    background: black;
}

            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <section class="container">
    <div class="one"></div>
    <div class="two"></div>
</section>
    </div>
    </form>
</body>
</html>
