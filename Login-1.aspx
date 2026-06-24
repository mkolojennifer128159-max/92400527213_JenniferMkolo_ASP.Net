<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyApp.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 13px;
            background: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 30px;
            min-height: 100vh;
        }

        /* ── Main Dialog Window (matches registration form) ── */
        .window {
            background: #ffffff;
            border: 1px solid #999;
            border-radius: 4px;
            width: 480px;
            box-shadow: 3px 3px 10px rgba(0,0,0,0.25);
        }

        /* Title Bar */
        .title-bar {
            background: linear-gradient(to bottom, #f1f1f1, #e1e1e1);
            border-bottom: 1px solid #aaa;
            padding: 6px 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 4px 4px 0 0;
            font-size: 12px;
            color: #333;
        }

        .title-bar .close-btn {
            background: #f44336;
            color: white;
            border: none;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 11px;
            cursor: pointer;
            line-height: 18px;
            text-align: center;
        }

        .window-body {
            padding: 16px 14px 20px;
        }

        /* ── Golden title badge (from the image) ── */
        .login-badge {
            display: flex;
            justify-content: center;
            margin-bottom: 22px;
        }

        .login-badge span {
            background: #F5A623;
            color: #222;
            font-size: 15px;
            font-weight: 800;
            letter-spacing: 2px;
            padding: 10px 44px;
            border-radius: 30px;
            text-transform: uppercase;
            box-shadow: 0 2px 6px rgba(245,166,35,0.4);
        }

        /* ── Two-column layout: illustration | form ── */
        .login-body {
            display: flex;
            align-items: center;
            gap: 28px;
            padding: 0 8px;
        }

        /* ── Student illustration circle ── */
        .illus-circle {
            flex-shrink: 0;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: #F5A623;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(245,166,35,0.35);
            overflow: hidden;
        }

        /* SVG graduation cap figures */
        .illus-circle svg {
            width: 130px;
            height: 130px;
        }

        /* ── Form side ── */
        .form-side {
            flex: 1;
        }

        /* Underline field rows (matching the image) */
        .field-row {
            margin-bottom: 22px;
        }

        .field-row label {
            display: block;
            font-size: 13px;
            color: #222;
            margin-bottom: 4px;
        }

        .field-wrapper {
            display: flex;
            align-items: center;
            border-bottom: 2px solid #F5A623;
            padding-bottom: 4px;
        }

        .field-wrapper .asp-input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 13px;
            color: #333;
            background: transparent;
            padding: 2px 0;
        }

        .field-icon {
            font-size: 18px;
            color: #333;
            margin-left: 6px;
            flex-shrink: 0;
        }

        /* ── Golden Login button ── */
        .btn-login {
            width: 100%;
            padding: 9px;
            background: #F5A623;
            color: #222;
            border: none;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 6px;
            box-shadow: 0 2px 6px rgba(245,166,35,0.4);
            transition: background 0.15s, transform 0.1s;
        }

        .btn-login:hover {
            background: #e09610;
            transform: translateY(-1px);
        }

        /* Validation */
        .val-msg {
            color: #cc2200;
            font-size: 11px;
            margin-top: 2px;
            display: block;
        }

        /* Register link below */
        .register-note {
            text-align: center;
            margin-top: 14px;
            font-size: 12px;
            color: #666;
        }

        .register-note a {
            color: #e07b00;
            font-weight: 600;
            text-decoration: none;
        }

        .register-note a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<form id="form1" runat="server">

  <div class="window">

    <!-- Title Bar -->
    <div class="title-bar">
      <span>Student Login</span>
      <button class="close-btn" type="button" onclick="window.close()">✕</button>
    </div>

    <div class="window-body">

      <!-- Golden "STUDENT LOGIN" badge -->
      <div class="login-badge">
        <span>STUDENT LOGIN</span>
      </div>

      <div class="login-body">

        <!-- Illustration circle with graduation SVG -->
        <div class="illus-circle">
          <svg viewBox="0 0 130 130" xmlns="http://www.w3.org/2000/svg">
            <!-- Back-left student (smaller, pink) -->
            <g transform="translate(18,38) scale(0.72)">
              <!-- body -->
              <ellipse cx="40" cy="105" rx="22" ry="28" fill="#e07b8a"/>
              <!-- head -->
              <circle cx="40" cy="62" r="18" fill="#d4956a"/>
              <!-- graduation cap board -->
              <rect x="18" y="42" width="44" height="7" rx="3" fill="#333"/>
              <!-- tassel knob -->
              <rect x="38" y="36" width="4" height="7" fill="#333"/>
              <!-- cap top flat -->
              <polygon points="40,34 58,42 40,50 22,42" fill="#444"/>
              <!-- tassel string -->
              <line x1="58" y1="42" x2="62" y2="56" stroke="#e07b00" stroke-width="2"/>
              <circle cx="62" cy="58" r="3" fill="#e07b00"/>
            </g>
            <!-- Back-right student (smaller, teal) -->
            <g transform="translate(72,38) scale(0.72)">
              <ellipse cx="40" cy="105" rx="22" ry="28" fill="#5bb8b4"/>
              <circle cx="40" cy="62" r="18" fill="#d4956a"/>
              <rect x="18" y="42" width="44" height="7" rx="3" fill="#333"/>
              <rect x="38" y="36" width="4" height="7" fill="#333"/>
              <polygon points="40,34 58,42 40,50 22,42" fill="#444"/>
              <line x1="22" y1="42" x2="18" y2="56" stroke="#e07b00" stroke-width="2"/>
              <circle cx="18" cy="58" r="3" fill="#e07b00"/>
            </g>
            <!-- Front center student (main, teal) -->
            <g transform="translate(28,28) scale(0.92)">
              <ellipse cx="40" cy="108" rx="28" ry="30" fill="#2a8a8a"/>
              <circle cx="40" cy="58" r="22" fill="#c8845a"/>
              <!-- shirt collar V -->
              <polygon points="32,80 40,95 48,80" fill="#e0a070"/>
              <!-- graduation cap board -->
              <rect x="14" y="34" width="52" height="8" rx="4" fill="#333"/>
              <rect x="37" y="26" width="6" height="9" fill="#333"/>
              <polygon points="40,24 64,34 40,44 16,34" fill="#444"/>
              <!-- tassel -->
              <line x1="64" y1="34" x2="69" y2="52" stroke="#e07b00" stroke-width="2.5"/>
              <circle cx="69" cy="55" r="4" fill="#e07b00"/>
            </g>
          </svg>
        </div>

        <!-- Form -->
        <div class="form-side">

          <!-- Email ID -->
          <div class="field-row">
            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email ID" />
            <div class="field-wrapper">
              <asp:TextBox ID="txtEmail" runat="server" CssClass="asp-input"
                TextMode="Email" placeholder="" />
              <span class="field-icon">👤</span>
            </div>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
              ControlToValidate="txtEmail"
              ErrorMessage="Email is required."
              CssClass="val-msg" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
              ControlToValidate="txtEmail"
              ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
              ErrorMessage="Enter a valid email address."
              CssClass="val-msg" Display="Dynamic" />
          </div>

          <!-- Password -->
          <div class="field-row">
            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password" />
            <div class="field-wrapper">
              <asp:TextBox ID="txtPassword" runat="server" CssClass="asp-input"
                TextMode="Password" placeholder="" />
              <span class="field-icon">🔒</span>
            </div>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
              ControlToValidate="txtPassword"
              ErrorMessage="Password is required."
              CssClass="val-msg" Display="Dynamic" />
          </div>

          <!-- LOGIN button -->
          <asp:Button ID="btnLogin" runat="server" Text="LOGIN"
            CssClass="btn-login" OnClick="btnLogin_Click" />

          <!-- Validation Summary -->
          <asp:ValidationSummary ID="vsSummary" runat="server"
            CssClass="val-msg" DisplayMode="BulletList"
            ShowSummary="true" HeaderText="Please fix:" />

        </div><!-- /form-side -->

      </div><!-- /login-body -->

      <!-- Register link -->
      <p class="register-note">
        Don't have an account?
        <asp:HyperLink ID="lnkRegister" runat="server"
          NavigateUrl="StudentRegistration.aspx" Text="Register here" />
      </p>

    </div><!-- /window-body -->
  </div><!-- /window -->

</form>
</body>
</html>
