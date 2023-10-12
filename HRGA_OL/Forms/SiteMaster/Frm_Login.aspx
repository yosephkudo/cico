<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Frm_Login.aspx.vb" Inherits="HRGA_OL.Frm_Login" EnableEventValidation = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>BBSO Online | Welcome ...</title>

    <link href="<%=ResolveUrl("~/Designs/Home/css/style.css") %>" rel="stylesheet" />
    <link href="/Designs/Home/css/style.css" rel="stylesheet" media="screen" runat="server" />
    <link href="<%=ResolveUrl("~/Designs/MasterPage/font-awesome/css/font-awesome.min.css") %>" rel="stylesheet" />
    <link href="/Designs/MasterPage/font-awesome/css/font-awesome.min.css" rel="stylesheet" media="screen" runat="server" />
</head>
<body>
    <form runat="server">
    <div class="container">
            <h1>&nbsp;BEKB Online Login Page</h1>
            <div class="contact">

                <div class="right-hz">
                    <p class="para">Ticketing, Reservation, and Event Management</p>
                    <p class="para">&nbsp;PAMA Banjarbaru Support Office</p>
                    <p>Indonesia</p>
                    <p>Ext : 111</p>
                    <a href="budianto@pamapersada.com">Email : budianto@pamapersada.com, ss.adro@pamapersada.com</a>
                </div>
                <form action="#" method="post">
                    <div class="left">
                        <div class="name">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <asp:TextBox ID="txtUsernames" runat="server" CssClass="text" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="name">
                            <i class="fa fa-key" aria-hidden="true"></i>
                            <asp:TextBox ID="txtPasswords" runat="server" CssClass="text" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                        <br />
                        <div class="phone">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            &nbsp;<asp:DropDownList ID="ddlAkses" runat="server" CssClass="text"  BackColor="#666666" AutoPostBack="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <i class="fa fa-minus" aria-hidden="true"></i>
                            <asp:Label ID="lblKet" runat="server" ForeColor="White" Font-Size="Small"></asp:Label>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" />
                    </div>
                </form>
                <div class="clear"></div>
            </div>
            <div class="footer-haz">
                <p class="agileinfo">&copy; 2017 IS Div Distrik BEKB. All Rights Reserved | Dev by <a href="">MUF</a></p>
            </div>

        </div>

        <script src="<%=ResolveUrl("~/Designs/Home/placeholders.min.js") %>"></script>
        <script src="/Designs/Home/placeholders.min.js"></script>
        <!-- jQuery -->

        <script src="<%=ResolveUrl("~/Designs/MasterPage/js/jquery.min.js") %>"></script>
        <script src="/Designs/MasterPage/js/jquery.min.js"></script>
    </form>
</body>
</html>
