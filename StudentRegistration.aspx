<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="StudentApp.StudentRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration Form</title>
    <style>
        /* ── Reset & Base ── */
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

        /* ── Main Dialog Window ── */
        .window {
            background: #ffffff;
            border: 1px solid #999;
            border-radius: 4px;
            width: 680px;
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

        /* ── Window Body ── */
        .window-body {
            padding: 12px;
        }

        /* ── Fieldset Panel ── */
        fieldset {
            border: 1.5px solid #cc2200;
            border-radius: 4px;
            padding: 14px 14px 16px;
            margin-bottom: 12px;
        }

        legend {
            color: #cc2200;
            font-weight: bold;
            font-size: 13px;
            padding: 0 6px;
            margin-left: 6px;
        }

        /* ── Enter Details layout ── */
        .details-grid {
            display: grid;
            grid-template-columns: 120px 1fr 180px;
            grid-template-rows: auto auto auto auto auto auto auto;
            gap: 8px 10px;
            align-items: center;
        }

        .details-grid label {
            color: #222;
            white-space: nowrap;
        }

        /* Photo box occupies rows 1-3, col 3 */
        .photo-area {
            grid-column: 3;
            grid-row: 1 / 4;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
        }

        .photo-box {
            width: 130px;
            height: 105px;
            border: 1.5px solid #cc2200;
            background: #fafafa;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #bbb;
            font-size: 11px;
        }

        .photo-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }

        /* Address box occupies rows 4-7, col 3 */
        .address-area {
            grid-column: 3;
            grid-row: 4 / 8;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .address-area label {
            color: #222;
        }

        /* ── Form Controls ── */
        .form-input {
            width: 100%;
            height: 26px;
            border: 1.5px solid #cc2200;
            border-radius: 2px;
            padding: 3px 6px;
            font-size: 12px;
            background: #fff;
            color: #222;
            outline: none;
        }

        .form-input:focus {
            border-color: #990000;
            box-shadow: 0 0 3px rgba(204,34,0,0.3);
        }

        /* Date of Birth row — input + calendar icon */
        .dob-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .dob-wrapper input[type="date"] {
            width: 100%;
            height: 26px;
            border: 1.5px solid #cc2200;
            border-radius: 2px;
            padding: 3px 30px 3px 6px;
            font-size: 12px;
            color: #222;
            background: #fff;
            outline: none;
        }

        .dob-wrapper input[type="date"]::-webkit-calendar-picker-indicator {
            opacity: 0;
            position: absolute;
            right: 4px;
            width: 22px;
            height: 22px;
            cursor: pointer;
            z-index: 2;
        }

        .cal-icon {
            position: absolute;
            right: 5px;
            font-size: 16px;
            color: #555;
            pointer-events: none;
            z-index: 1;
        }

        /* Gender radios */
        .gender-row {
            display: flex;
            align-items: center;
            gap: 18px;
            height: 26px;
        }

        .gender-row label {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #222;
            cursor: pointer;
        }

        .gender-row input[type="radio"] {
            accent-color: #cc2200;
            width: 13px;
            height: 13px;
            cursor: pointer;
        }

        /* DropDownList */
        .form-select {
            width: 100%;
            height: 26px;
            border: 1.5px solid #cc2200;
            border-radius: 2px;
            padding: 2px 6px;
            font-size: 12px;
            background: #fff;
            color: #222;
            outline: none;
            cursor: pointer;
        }

        .form-select:focus {
            border-color: #990000;
        }

        /* Address textarea */
        .form-textarea {
            width: 100%;
            height: 108px;
            border: 1.5px solid #cc2200;
            border-radius: 2px;
            padding: 5px 6px;
            font-size: 12px;
            background: #fff;
            color: #222;
            resize: none;
            outline: none;
            font-family: inherit;
        }

        .form-textarea:focus {
            border-color: #990000;
        }

        /* ── Buttons row ── */
        .btn-row {
            grid-column: 3;
            grid-row: 8;
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            margin-top: 4px;
        }

        .btn-submit {
            background: #b0f0f0;
            border: 1.5px solid #777;
            border-radius: 3px;
            padding: 4px 18px;
            font-size: 12px;
            cursor: pointer;
            min-width: 72px;
        }

        .btn-submit:hover { background: #80e0e0; }

        .btn-reset {
            background: #f0c8f0;
            border: 1.5px solid #777;
            border-radius: 3px;
            padding: 4px 18px;
            font-size: 12px;
            cursor: pointer;
            min-width: 72px;
        }

        .btn-reset:hover { background: #e0a0e0; }

        /* Upload Image button */
        .btn-upload {
            background: #e8e8e8;
            border: 1.5px solid #888;
            border-radius: 3px;
            padding: 3px 10px;
            font-size: 11px;
            cursor: pointer;
            width: 130px;
        }

        .btn-upload:hover { background: #d8d8d8; }

        /* ── Database Section ── */
        .db-buttons {
            display: flex;
            gap: 8px;
            margin-bottom: 8px;
        }

        .btn-edit {
            background: #c8e4ff;
            border: 1.5px solid #5599cc;
            border-radius: 3px;
            padding: 4px 20px;
            font-size: 12px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-edit:hover { background: #a8d4ff; }

        .btn-delete {
            background: #ffe8a8;
            border: 1.5px solid #cc9900;
            border-radius: 3px;
            padding: 4px 16px;
            font-size: 12px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-delete:hover { background: #ffd880; }

        /* ── DataGrid / GridView ── */
        .grid-wrapper {
            border: 1px solid #ccc;
            overflow: auto;
            min-height: 130px;
            background: #fff;
        }

        .data-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }

        .data-grid th {
            background: #dce8f8;
            border: 1px solid #aac;
            padding: 4px 6px;
            text-align: left;
            font-weight: bold;
            white-space: nowrap;
            color: #222;
        }

        .data-grid td {
            border: 1px solid #ddd;
            padding: 3px 6px;
            color: #333;
            white-space: nowrap;
        }

        .data-grid tr:nth-child(even) td { background: #f5f8ff; }
        .data-grid tr:hover td { background: #e8f0ff; }

        /* Validation */
        .val-msg {
            color: #cc2200;
            font-size: 11px;
            margin-top: 2px;
        }

        /* Underline for keyboard shortcut hints */
        u { text-decoration: underline; }
    </style>
</head>
<body>
<form id="form1" runat="server">

  <div class="window">

    <!-- ── Title Bar ── -->
    <div class="title-bar">
      <span>Student Registration Form</span>
      <button class="close-btn" type="button" onclick="window.close()">✕</button>
    </div>

    <div class="window-body">

      <!-- ══════════════════════════════════════════
           PANEL 1 : Enter Details
      ═══════════════════════════════════════════ -->
      <fieldset>
        <legend>Enter Details</legend>

        <div class="details-grid">

          <!-- Row 1: Student's Name -->
          <asp:Label ID="lblStudentName" runat="server" AssociatedControlID="txtStudentName" Text="Student's Name" />
          <div>
            <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-input" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server"
              ControlToValidate="txtStudentName"
              ErrorMessage="Required" CssClass="val-msg" Display="Dynamic" />
          </div>

          <!-- Photo area — spans rows 1-3 -->
          <div class="photo-area">
            <div class="photo-box" id="photoBox">
              <asp:Image ID="imgPhoto" runat="server" AlternateText="Photo" Style="display:none;width:100%;height:100%;object-fit:cover;" />
              <span id="photoPlaceholder">No Image</span>
            </div>
            <asp:FileUpload ID="fuPhoto" runat="server" Style="display:none;" onchange="previewPhoto(this)" />
            <button type="button" class="btn-upload"
              onclick="document.getElementById('<%= fuPhoto.ClientID %>').click()">
              Upload Image…
            </button>
          </div>

          <!-- Row 2: Father's Name -->
          <asp:Label ID="lblFatherName" runat="server" AssociatedControlID="txtFatherName" Text="Father's Name" />
          <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-input" />

          <!-- Row 3: Date of Birth -->
          <asp:Label ID="lblDOB" runat="server" AssociatedControlID="txtDOB" Text="Date of Birth" />
          <div class="dob-wrapper">
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-input" Style="padding-right:28px;" />
            <span class="cal-icon">📅</span>
          </div>

          <!-- Row 4: Gender -->
          <asp:Label ID="lblGender" runat="server" Text="Gender" />
          <div class="gender-row">
            <label>
              <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" />
            </label>
            <label>
              <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" />
            </label>
          </div>

          <!-- Address area — spans rows 4-7, col 3 -->
          <div class="address-area">
            <asp:Label ID="lblAddress" runat="server" Text="Address :" />
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"
              CssClass="form-textarea" Rows="5" />
          </div>

          <!-- Row 5: Course Applied -->
          <asp:Label ID="lblCourse" runat="server" AssociatedControlID="ddlCourse" Text="Course Applied" />
          <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-select">
            <asp:ListItem Text="" Value="" />
            <asp:ListItem Text="B.Sc Computer Science" Value="BSc CS" />
            <asp:ListItem Text="B.Sc Information Technology" Value="BSc IT" />
            <asp:ListItem Text="B.Com" Value="BCom" />
            <asp:ListItem Text="B.A" Value="BA" />
            <asp:ListItem Text="B.Tech" Value="BTech" />
            <asp:ListItem Text="MBA" Value="MBA" />
            <asp:ListItem Text="MCA" Value="MCA" />
          </asp:DropDownList>

          <!-- Row 6: Mobile Number -->
          <asp:Label ID="lblMobile" runat="server" AssociatedControlID="txtMobile" Text="Mobile Number" />
          <div>
            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-input" MaxLength="15" />
            <asp:RegularExpressionValidator ID="revMobile" runat="server"
              ControlToValidate="txtMobile"
              ValidationExpression="^\d{10,15}$"
              ErrorMessage="Enter valid mobile number"
              CssClass="val-msg" Display="Dynamic" />
          </div>

          <!-- Row 7: Email ID -->
          <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email ID" />
          <div>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
              ControlToValidate="txtEmail"
              ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
              ErrorMessage="Enter valid email"
              CssClass="val-msg" Display="Dynamic" />
          </div>

          <!-- Row 8: Submit / Reset buttons (col 3) -->
          <div style="grid-column:1;grid-row:8;"></div>
          <div style="grid-column:2;grid-row:8;"></div>
          <div class="btn-row">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
              CssClass="btn-submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset"
              CssClass="btn-reset" CausesValidation="false" OnClick="btnReset_Click" />
          </div>

        </div><!-- /details-grid -->

        <!-- Validation Summary -->
        <asp:ValidationSummary ID="vsSummary" runat="server"
          ShowSummary="true" DisplayMode="BulletList"
          CssClass="val-msg" HeaderText="Please correct:" />

      </fieldset>

      <!-- ══════════════════════════════════════════
           PANEL 2 : Database
      ═══════════════════════════════════════════ -->
      <fieldset>
        <legend>Database</legend>

        <div class="db-buttons">
          <asp:Button ID="btnEdit" runat="server" Text="Edit"
            CssClass="btn-edit" CausesValidation="false" OnClick="btnEdit_Click" />
          <asp:Button ID="btnDelete" runat="server" Text="Delete"
            CssClass="btn-delete" CausesValidation="false" OnClick="btnDelete_Click" />
        </div>

        <div class="grid-wrapper">
          <asp:GridView ID="gvStudents" runat="server"
            CssClass="data-grid"
            AutoGenerateColumns="False"
            EmptyDataText="No records found."
            DataKeyNames="SNo"
            OnSelectedIndexChanged="gvStudents_SelectedIndexChanged">
            <Columns>
              <asp:BoundField DataField="SNo"          HeaderText="S. No."        ReadOnly="True" />
              <asp:BoundField DataField="StudentName"  HeaderText="Student's Name" />
              <asp:BoundField DataField="FatherName"   HeaderText="Father's Name"  />
              <asp:BoundField DataField="DOB"          HeaderText="DOB"            DataFormatString="{0:dd-MM-yyyy}" />
              <asp:BoundField DataField="Gender"       HeaderText="Gender"         />
              <asp:BoundField DataField="Course"       HeaderText="Course"         />
              <asp:BoundField DataField="MobileNo"     HeaderText="Mobile No."     />
              <asp:BoundField DataField="EmailID"      HeaderText="Email ID"       />
              <asp:BoundField DataField="Address"      HeaderText="Address"        />
            </Columns>
            <HeaderStyle CssClass="grid-header" />
            <SelectedRowStyle BackColor="#cce0ff" />
          </asp:GridView>
        </div>

      </fieldset>

    </div><!-- /window-body -->
  </div><!-- /window -->

</form>

<script type="text/javascript">
  // Live photo preview
  function previewPhoto(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var img = document.getElementById('<%= imgPhoto.ClientID %>');
        var placeholder = document.getElementById('photoPlaceholder');
        img.src = e.target.result;
        img.style.display = 'block';
        if (placeholder) placeholder.style.display = 'none';
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
</body>
</html>
