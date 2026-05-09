<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Scorely</title>
    <link rel="stylesheet" href="contact.css">
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
                <a href="about.jsp">About</a>
                <a href="#">Features</a>
                <a href="contact.jsp" class="active">Contact</a>
            </nav>
            <a href="loginRegister.jsp">  <button class="login-button" >Login</button></a>
        </div>
    </header>

    <main class="container">
        <section class="hero-contact-section">
            <div class="hero-content-center">
                <h1>Contact Us</h1>
                <p>Have questions or need support? Get in touch with us.</p>
            </div>
            <div class="contact-illustration-placeholder">
                 <i class="fas fa-headset"></i> </div>
        </section>

        <section class="info-section contact-details-section">
            <h2>Our Details</h2>
            <div class="card-grid">
                <div class="card contact-card">
                    <i class="fas fa-envelope"></i>
                    <h3>Email</h3>
                    <p>support@scorely.com</p>
                </div>
                <div class="card contact-card">
                    <i class="fas fa-phone-alt"></i>
                    <h3>Phone</h3>
                    <p>+91-XXXXXXXXXX</p>
                </div>
                <div class="card contact-card">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3> Location</h3>
                    <p>College / City, State</p>
                </div>
            </div>
        </section>

        <section class="info-section contact-form-section">
            <h2>Send Us a Message</h2>
            <div class="form-wrapper">
                <form class="contact-form">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="6" required></textarea>
                    </div>
                    
                    <button type="submit" class="send-message-button">Send Message</button>
                </form>
            </div>
        </section>
        
        <div class="academic-note">
            <p>This system is developed as an academic project.</p>
        </div>

    </main>

    <footer class="contact-footer">
        <div class="footer-content">
            <p>&copy; 2025 Scorely</p>
            <p>support@scorely.com</p>
            <nav class="footer-links">
                <a href="#">Privacy Policy</a>
            </nav>
        </div>
    </footer>
</body>
</html>