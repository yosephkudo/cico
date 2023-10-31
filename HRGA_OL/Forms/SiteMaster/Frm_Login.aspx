<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Frm_Login.aspx.vb" Inherits="HRGA_OL.Frm_Login" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<title>CICO BEKB | Welcome ...</title>

	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
	<style>
		body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('Designs/Images/background.jpg'); /* Set the background image */
            background-size: cover; /* Ensure the image covers the entire background */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            background-position: center; /* Center the background image */
            background-color: #f4f4f4; /* Fallback background color */
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

		.container {
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
			text-align: center;
			max-width: 400px;
			width: 100%;
		}

		h1 {
			font-weight: bold;
			font-size: 36px;
			color: #4caf50;
			margin-bottom: 30px;
		}

		.input-group {
			margin-bottom: 20px;
		}

		.input-group i {
			color: #888;
		}

		.input-group input[type="text"],
		.input-group input[type="password"] {
			width: calc(100% - 30px);
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			margin-top: 10px;
		}

        .input-group select {
			width: calc(100% - 30px);
			padding: 10px;
			border: 1px solid #4caf50;
			border-radius: 5px;
			margin-top: 10px;
			color: #fff;
			background-color: #4caf50; /* Light grey background color */
		}

		.btnLogin {
			background-color: #4caf50;
			color: #fff;
			border: none;
			padding: 10px 20px;
			font-size: 18px;
			cursor: pointer;
			border-radius: 5px;
		}

		.btnLogin:hover {
			background-color: #45a049;
		}

		.footer-haz {
			margin-top: 30px;
			color: #fff;
		}
	</style>
</head>

<body>
	<form runat="server">
		<div class="container">
			<img src='<%= ResolveUrl("~/Designs/Images/logo-login2.png") %>' alt="Logo" class="img-responsive" style="max-height: 80%; max-width: 80%" />
			<%-- <h1>CICO BEKB</h1> --%>
			<div class="input-group">
				<i class="fas fa-user"></i>
				<asp:TextBox ID="txtUsernames" runat="server" CssClass="text" placeholder="Username" ClientIDMode="Static"></asp:TextBox>
			</div>
			<div class="input-group">
				<i class="fas fa-lock"></i>
				<asp:TextBox ID="txtPasswords" runat="server" CssClass="text" TextMode="Password" placeholder="Password" ClientIDMode="Static"></asp:TextBox>
			</div>
			<div class="phone">
				<i class="fa fa-minus" aria-hidden="true"></i>
				<asp:Label ID="lblKet" runat="server" ForeColor="Green" Font-Size="Medium"></asp:Label>
			</div>
			<div class="input-group">
				<i class="fas fa-lock"></i>
				<asp:DropDownList ID="ddlAkses" runat="server" CssClass="text" AutoPostBack="true" ClientIDMode="Static">
					<asp:ListItem Text="Select Profile" Value="" />
				</asp:DropDownList>
			</div>
			    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btnLogin" />
			</div>
            <div class="footer-haz">
				&copy; 2023 IS Div Distrik BEKB. All Rights Reserved | Dev by <a href="#">YS</a>
			</div>
		</div>
	</form>
</body>

</html>
