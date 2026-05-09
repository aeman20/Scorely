<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely- Student Performance Management System</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="header">
        <div class="container">
            <div class="logo">
                <i class="fas fa-shield-alt"></i> Scorely
            </div>
            <nav class="nav">

                <a href="#" class="active">Home</a>
                <a href="about.jsp">About</a>
                <a href="#">Features</a>
                <a href="contact.jsp">Contact</a>
                <button class="btn btn-login" onclick="window.location.href='newLoginpage.jsp'">Login</button>
                
            </nav>
        </div>
    </header>

    <main class="hero-section">
        <div class="container">
          
            <div class="hero-content">
 <h1>Digital Student Performance Management System</h1>
                <p>Teachers can record marks and attendance easily.
                  Students can check performance anytime, anywhere.</p>
          
                <div class="hero-buttons">
                    <a href="loginRegister.jsp"><button class="btn btn-primary" > Teacher Login</button></a>
                     <a href="loginRegister.jsp"><button class="btn btn-secondary" >Student Login</button></a>
                </div>
            </div>
  <div class="hero-illustration">
            
                            </div>
        </div>
    </main>

    <section class="features-section">
        <div class="container">
            <div class="feature-card">
                <div class="icon-bg"><i class="fas fa-pencil-alt"></i></div>
                <h3>Record Marks  </h3>
                <p>Teachers record grades effortlessly</p>
            </div>
            <div class="feature-card">
                <div class="icon-bg"><i class="fas fa-calendar-check"></i></div>
                <h3>Attendance Record</h3>
                <p>Maintain attendance record easily</p>
            </div>
            <div class="feature-card">
                <div class="icon-bg"><i class="fas fa-user-graduate"></i></div>
                <h3>Student Dashboard</h3>
                <p>Access grades & progress</p>
            </div>
            <div class="feature-card">
                <div class="icon-bg"><i class="fas fa-bullhorn"></i></div>
                <h3>Announcements</h3>
                <p>Stay updated with latest notice</p>
            </div>
        </div>
    </section>

    <section class="how-it-works-section">
        <div class="container">
            <h2>How It Works</h2>
            <div class="steps-flow">
                <div class="step">Teacher Login</div>
                <i class="fas fa-arrow-right"></i>
                <div class="step">Update Marks and Attendance </div>
                <i class="fas fa-arrow-right"></i>
                <div class="step step-highlight">Students Check Their Performance</div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Scorely Inc.</p>
            <nav class="footer-nav">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Support</a>
            </nav>
        </div>
    </footer>

</body>
</html>