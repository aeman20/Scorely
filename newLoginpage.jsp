<!DOCTYPE html>
<html>
<head>
  <title>Scorely Login</title>
  <style>
    body {
      margin: 0; font-family: 'Segoe UI', Arial;
      background: linear-gradient(135deg, #1a47c9, #ffffff);
      display: flex; justify-content: center; align-items: center; height: 100vh;
    }
    .container {
      background: #f3f3f3; padding: 40px 30px; border-radius: 15px;
      width: 320px; text-align: center; box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }
    .logo { font-size: 45px; font-weight: bold; color: #1e3a8a; margin-bottom: 20px; }
    h2 { margin-bottom: 20px; color: #333; }
    input, select {
      width: 100%; padding: 12px; margin: 10px 0;
      border-radius: 10px; border: 3px solid #ccc; box-sizing: border-box;
      font-size: 16px;
    }
    button {
      width: 100%; padding: 12px; margin-top: 15px; border-color:#1e3a8a;
      border-radius: 10px; background:  #ffffff; font-size: 16px;
      font-weight: bold; cursor: pointer; transition: 0.3s;
      
    }
    button:hover { background: #5783ff; }
    .forgot { margin-top: 10px; font-size: 20px; color: #1e3a8a; cursor: pointer; }

    /* Popup Styling */
    #popup {
      display: none; position: fixed; top: 0; left: 0;
      width: 100%; height: 100%; background: rgba(0,0,0,0.6);
      z-index: 1000;
    }
    .popup-box {
      background: white; width: 300px; margin: 15% auto;
      padding: 25px; border-radius: 15px; text-align: center;
      box-shadow: 0 5px 20px rgba(0,0,0,0.3);
    }
  </style>
</head>
<body>

<div class="container">
  <div class="logo">Scorely</div>
  <h2>Login</h2>
  <form action="NewLoginServlet" method="post">
    <input type="email" name="email" placeholder="Enter Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <select name="role" required>
      <option value="">Select Role</option>
      <option value="accountant">Accountant</option>
      <option value="teacher">Teacher</option>
      <option value="student">Student</option>
    </select>
    <button type="submit">Log In</button>
  </form>
  <div class="forgot">Forgot Password?</div>
</div>

<div id="popup">
  <div class="popup-box">
    <h3 style="color:red; margin-top:0;">Invalid Login</h3>
    <p>Email, Password or Role is incorrect.</p>
    <button style="width: auto; padding: 8px 30px;" onclick="closePopup()">OK</button>
  </div>
</div>

<script>
  function showPopup() {
    document.getElementById("popup").style.display = "block";
  }

  function closePopup() {
    document.getElementById("popup").style.display = "none";
  }

  // Ensure popup shows only when error exists
  window.onload = function() {
    <% if (request.getAttribute("error") != null) { %>
      showPopup();
    <% } %>
  };
</script>

</body>
</html>