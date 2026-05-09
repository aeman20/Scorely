<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Scorely</title>
    <link rel="stylesheet" href="about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <i class="fas fa-shield-alt"></i> <span>Scorely</span>
        </div>
        
        <div class="nav-right"> 
            <nav>
                <a href="index.jsp">Home</a>
                <a href="#" class="active">About</a>
                <a href="#">Features</a>
                <a href="contact.jsp">Contact</a>
            </nav>
            <a href="loginRegister.jsp">  <button class="login-button" >Login</button></a>
        </div>
    </header>
    <main class="container">
        <section class="hero-section">
            <div class="hero-content">
                <h1>About Us</h1>
                <p>The Digital Student Performance Management System is a web-based platform designed to simplify academic record management in educational institutions. It provides a secure, centralized system for all performance data.</p>
                <p>This system replaces manual paper records, complex Excel sheets, and unsecured file sharing by providing a unified digital solution for teachers, students, and institutions.</p>
            </div>
            <div class="hero-illustration">
                <div class="illustration-box">
                    <i class="fas fa-laptop-code"></i>
                    <i class="fas fa-graduation-cap"></i>
                    <i class="fas fa-chart-line"></i>
                    <p>Modern Academic Dashboard</p>
                </div>
            </div>
        </section>

        <section class="info-section">
            <h2>Who Is This System For?</h2>
            <div class="card-grid">
                <div class="card">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <h3>Teachers</h3>
                    <p>Easily manage marks, input attendance, and publish instant announcements to the class.</p>
                </div>
                <div class="card">
                    <i class="fas fa-user-graduate"></i>
                    <h3>Students</h3>
                    <p>Access their performance reports, attendance records, and important notices anytime, anywhere.</p>
                </div>
                <div class="card">
                    <i class="fas fa-university"></i>
                    <h3>Institutions</h3>
                    <p>Maintain secure, centralized, and long-term academic records for better decision-making.</p>
                </div>
            </div>
        </section>

        <section class="info-section objectives">
            <h2>Objectives of the System</h2>
            <ul>
                <li><i class="fas fa-check-circle"></i> Digitize and centralize all academic records for easy maintenance.</li>
                <li><i class="fas fa-check-circle"></i> Reduce manual administrative work and human error.</li>
                <li><i class="fas fa-check-circle"></i> Improve data accuracy and transparency between teachers and students.</li>
                <li><i class="fas fa-check-circle"></i> Ensure robust data privacy with secure, role-based access.</li>
            </ul>
        </section>

        <section class="info-section how-it-works">
            <h2>How It Works</h2>
            <div class="step-flow">
                <div class="step">
                    <i class="fas fa-keyboard"></i>
                    <h4>Step 1: Data Entry</h4>
                    <p>Teachers enter marks and update attendance.</p>
                </div>
                <div class="arrow"><i class="fas fa-arrow-right"></i></div>
                <div class="step">
                    <i class="fas fa-database"></i>
                    <h4>Step 2: Processing</h4>
                    <p>The system processes and securely stores the performance data.</p>
                </div>
                <div class="arrow"><i class="fas fa-arrow-right"></i></div>
                <div class="step">
                    <i class="fas fa-tv"></i>
                    <h4>Step 3: View Reports</h4>
                    <p>Students instantly view their updated performance on the dashboard.</p>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-content">
                <p>&copy; 2025 Scorely. All Rights Reserved.</p>
                <nav class="footer-links">
                    <a href="#">Privacy Policy</a> |
                    <a href="#">Terms of Service</a> |
                    <a href="#">Contact Us</a>
                </nav>
            </div>
        </footer>
    </main>
</body>
</html>