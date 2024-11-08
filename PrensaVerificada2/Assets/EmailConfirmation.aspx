<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailConfirmation.aspx.cs" Inherits="PrensaVerificada2.Assets.EmailConfirmation" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Confirmation</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f3f4;
        }

        .email-container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .email-content {
            text-align: center;
        }

        .email-content h2 {
            color: #5f6368;
            font-weight: 500;
            font-size: 24px;
        }

        .email-content p {
            color: #202124;
            font-size: 16px;
            line-height: 1.5;
            margin: 10px 0;
        }

        .confirm-button {
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #1a73e8;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .confirm-button:hover {
            background-color: #1558b0;
        }

        .email-footer {
            font-size: 12px;
            color: #5f6368;
            margin-top: 30px;
            text-align: center;
        }

        .email-footer a {
            color: #1a73e8;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="email-container">
        <div class="email-content">
            <h2>Confirma tu email</h2>
            <p>Haz clic en el enlace a continuación para confirmar tu dirección de correo electrónico.</p>
            <asp:Button ID="ConfirmButton" runat="server" Text="Confirmar Email" CssClass="confirm-button" OnClick="ConfirmButton_Click" />
        </div>
        <div class="email-footer">
            <p>Si no has solicitado esta confirmación, puedes ignorar este mensaje.</p>
            <p><a href="#">¿Tienes problemas para confirmar tu email?</a></p>
        </div>
    </form>
</body>
</html>
