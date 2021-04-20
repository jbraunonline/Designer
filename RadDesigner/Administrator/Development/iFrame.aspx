<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="iFrame.aspx.vb" Inherits="RadDesigner.iFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <style type="text/css">
    .box{
    float:left;
    margin-right:20px;
}
.clear{
    clear:both;
}
                </style>
</head>
<body>
    <form id="form1" runat="server">


        <div class="box"><iframe src="/associate/ASAudit/ASAuditform.aspx"  frameborder="0" scrolling="no" width="1000" height="512" align="left"> </iframe> </div>

<div class="box">    <iframe src="/associate/ASAudit/ASAuditform/auditnotes.aspx"  frameborder="0" scrolling="no" width="500" height="512" align="right">
    </iframe>
    </div>





        </form>
</body>
</html>
