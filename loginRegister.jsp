<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Sign In / Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* --- General Styles --- */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f2f5;
        }

        /* --- Color Variables --- */
        :root {
            --primary-color: #38c1a6; /* Main green/teal */
            --secondary-color: #e6f7f4; /* Light background for forms */
            --text-dark: #333;
            --text-light: #fff;
            --social-icon-bg: #f5f5f5;
        }

        /* --- Container Layout --- */
        .container {
            position: relative;
            width: 800px;
            max-width: 90%;
            min-height: 500px;
            background-color: var(--text-light);
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            overflow: hidden; /* Crucial for the sliding effect */
        }

        /* --- Form Panels (Sign In & Sign Up) --- */
        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        /* --- Overlay Panel (The Sliding Side) --- */
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .overlay {
            background: #4285f4;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: var(--text-light);
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
            transform: translateX(-20%);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        /* --- Shared Form/Panel Styling --- */
        form {
            background-color: var(--text-light);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        h1 {
            font-weight: bold;
            margin: 0;
            color: var(--text-dark);
        }

        p {
            font-size: 14px;
            font-weight: 300;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        .social-container a {
            border: 1px solid var(--social-icon-bg);
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
            color: var(--text-dark);
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .social-container a:hover {
            background-color: var(--social-icon-bg);
        }

        input {
            background-color: var(--secondary-color);
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
            border-radius: 5px;
        }

        input::placeholder {
            color: var(--text-dark);
            font-size: 14px;
        }

        /* --- Buttons --- */
        .btn {
            border-radius: 20px;
            border: 1px solid #7d7d7d;
            background-color:#4285f4;
            color: var(--text-light);
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .btn.ghost {
            background-color: transparent;
            border-color: var(--text-light);
        }
        
        .btn:active {
            transform: scale(0.95);
        }
        
        /* --- Links --- */
        .forgot-password {
            color: var(--text-dark);
            font-size: 12px;
            margin: 15px 0;
            text-decoration: none;
        }

        /* --- Logo and Text Styles --- */
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            font-weight: 680;
            color: #4285f4;
            z-index: 200;
        }
        .overlay .logo {
            color: var(--text-light);
            left: auto;
            right: 20px;
            transition: all 0.6s ease-in-out;
        }
        .overlay-left .logo {
            left: 20px;
            right: auto;
        }
        
        .title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .panel-text {
            font-size: 14px;
            font-weight: 400;
            line-height: 1.5;
            margin: 10px 0;
        }
        .panel-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        /* --- The Magic Transition Classes --- */

        /* Move form to the right (to hide Sign-in and reveal Sign-up) */
        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }

        /* Bring Sign-up form into view */
        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }
        @keyframes show {
            0%, 49% {
                opacity: 0;
                z-index: 1;
            }
            50%, 100% {
                opacity: 1;
                z-index: 5;
            }
        }

        /* Move overlay to the left */
        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }

        /* Move overlay's content to the right (to swap the panels) */
        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        /* Move the "Welcome Back!" panel out of sight */
        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }

        /* Move the "Hello, Friend!" panel into view */
        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }

    </style>
</head>
<body>

<div class="container" id="container">
    <div class="logo">Scorely</div>
    
    <div class="form-container sign-up-container">
        <form action="RegisterServlet" method="POST">
            <h2 class="title">Create Account</h2>
            
            <input type="text" placeholder="Name" name="name" required />
            <input type="email" placeholder="Email" name="email"  required />
            <input type="password" placeholder="Create Password" name="password" required />
          <select name="role" required style="
    background-color: var(--secondary-color);
    border: none;
    padding: 12px 15px;
    margin: 8px 0;
    width: 100%;
    border-radius: 5px;
    color: var(--text-dark);
    font-size: 14px;
    cursor: pointer;">
    <option value="" disabled selected>Select Your Role</option>
    <option value="student">Student</option>
    <option value="teacher">Teacher</option>
</select>
            <button class="btn">Sign Up</button>
        </form>
    </div>

    <div class="form-container sign-in-container">
        <form action="LoginServlet"  method="POST" >
            <h2 class="title">Login </h2>
          <input type="email" placeholder="Email" name="email" required />
            <input type="password" placeholder="Password"  name="password" required />
            <a href="#" class="forgot-password">Forgot your password?</a>
            <button class="btn">Login </button>
        </form>
    </div>

    <div class="overlay-container">
        <div class="overlay">
            
            <div class="overlay-panel overlay-left">
                <h2 class="panel-title">Welcome Back!</h2>
                <p class="panel-text">To keep connected with us please login with your personal info</p>
                <button class="btn ghost" id="signIn">Login</button>
            </div>
             <div class="overlay-panel overlay-right">
                <h2 class="panel-title">Hello, Friend!</h2>
                <p class="panel-text">Enter your personal details and start journey with us</p>
                <button class="btn ghost" id="signUp">Sign Up</button>
            </div>
           
        </div>
    </div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    // Listener to switch to the Sign Up view
    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    // Listener to switch back to the Sign In view
    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>

</body>
</html>