<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Teacher Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      
    <style>
        /* --- General Reset & Fonts --- */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        /* --- Color Variables (Based on Image 1000015132.jpg) --- */
        :root {
            --primary-blue-dark: #3880c1; /* Deeper blue for hover/active */
            --primary-blue-light: #61a0e1; /* Main gradient base */
            --sidebar-bg:#89b7eb; /* Soft blue background for nav */
            --white: #b0c8f1;
            --light-gray-bg: #f4f7fa; /* Main body background */
            --text-dark: #333;
            --text-light: #fff;
            --border-light: #e0e0e0;
            --shadow-soft: 0 4px 12px rgba(0, 0, 0, 0.08);
            --gradient-start: #78a9e4;
            --gradient-end: #61a0e1;
        }

        body {
            background-color: var(--light-gray-bg);
            display: flex;
            min-height: 100vh;
        }

        /* --- Left Navigation Panel (Blue Theme) --- */
        .sidebar {
            width: 280px;
            background-image: linear-gradient(to bottom, var(--gradient-start), #0037ff);
            color: var(--text-light);
            padding: 20px 0;
            flex-shrink: 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            padding: 0 20px 30px 20px;
            font-size: 1.6rem;
            font-weight: 600;
            color: #ffffff;
        }

        .logo i {
            margin-right: 10px;
            font-size: 1.8rem;
            color:#ffffff;
        }

        .nav-item a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #ffffff;
            text-decoration: none;
            transition: background-color 0.2s;
            font-weight: 400;
            opacity: 0.9;
        }

        .nav-item a i {
            width: 30px;
            font-size: 1.1rem;
            opacity: 0.9;
        }

        /* Active Item Styling */
        .nav-item.active a {
            background-color: rgba(255, 255, 255, 0.3); /* Lighter, semi-transparent background */
            color: var(--text-light);
            border-radius: 4px;
            margin: 0 15px;
            padding: 12px 10px;
            opacity: 1;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .nav-item:not(.active) a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            opacity: 1;
        }

        /* --- Main Content Area --- */
        .main-content {
            flex-grow: 1;
            padding: 30px;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 2rem;
            color: var(--text-dark);
            font-weight: 600;
        }

        .header h2 {
            font-size: 1.2rem;
            color: var(--text-dark);
            font-weight: 500;
            margin-top: 20px;
        }

        /* --- Student Performance Table (Full Width) --- */
        .table-card {
            background-color: var(--white);
            border-radius: 12px;
            box-shadow: var(--shadow-soft);
            padding: 20px;
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
        }

        .student-table th, .student-table td {
            text-align: left;
            padding: 15px 20px;
            border-bottom: 1px solid var(--border-light);
        }
        
        .student-table th {
            background-color: var(--white); /* Keeping header background clean */
            color: var(--text-dark);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
        }
        
        .student-table tr:last-child td {
            border-bottom: none;
        }

        .student-table td {
            font-size: 0.95rem;
            color: var(--text-dark);
        }

        /* Styling for the small blue/gray dots */
        .dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-left: 5px;
            vertical-align: middle;
        }
        .dot.blue {
            background-color: var(--primary-blue-dark);
        }
        .dot.gray {
            background-color: #ccc;
        }

       .card {
    background: white;
    border-radius: 15px;
    padding: 25px;
    margin-bottom: 30px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.card h3 {
    margin-bottom: 20px;
    color: #444;
    font-size: 18px;
}

/* Form Styles */
.input-group {
    margin-bottom: 15px;
}

.input-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    color: #666;
}

.input-group input, .input-group textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    background: #fdfdfd;
}

.form-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}



.btn-primary {
    background-color: #4a90e2;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-weight: bold;
    box-shadow: 0 4px 10px rgba(74, 144, 226, 0.3);
}
 
        
        
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-shield-alt"></i> 
            <span>Scorely</span>
        </div>
        <nav>
            <ul>
                <li class="nav-item">
                    <a href="teacherDashboardServlet"><i class="fas fa-chart-line"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a href="FetchStudentsServlet"><i class="fas fa-pencil-alt"></i> Enter Marks</a>
                </li>
                <li class="nav-item">
                    <a href="FetchAttendanceServlet"><i class="fas fa-edit"></i> Update Attendance</a>
                </li>
                <li class="nav-item active">
                    <a href=#"><i class="fas fa-bullhorn"></i> Announcements</a>
                </li>
                <li class="nav-item">
                    <a href="#"><i class="fas fa-user-cog"></i> Edit Profile</a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Welcome!</h1>
                <p>Create and manage student announcements.</p>
        </div>
<%-- Success message handle karne ke liye --%>
 <c:if test="${param.status == 'success'}">
    <div id="success-message" style="background-color: #d4edda; color: #155724; padding: 15px; border-radius: 5px; margin-bottom: 20px; text-align: center; border: 1px solid #c3e6cb;">
        <i class="fas fa-check-circle"></i> Announcement published successfully!
    </div>
</c:if>
        <div class="table-card">
            
            <h3>Create Announcement</h3>
            
            <form class="announcement-form" action="SaveAnnouncementServlet" method="post">
                    <div class="input-group">
                        <label>Announcement Title</label>
                        <input name="title" type="text" placeholder="Announcement Title" required>
                    </div>
                    <div class="input-group">
                        <label>Announcement Message</label>
                        <textarea name="message" rows="3"></textarea>
                    </div>
                    <div class="form-footer">
                        
                        <button type="submit" class="btn-primary">Publish Announcement</button>
                    </div>
                </form>
        </div>
    </div>
<script>
    // 3 second baad message ko gayab karne ke liye
    setTimeout(function() {
        var msg = document.getElementById('success-message');
        if (msg) {
            msg.style.display = 'none';
        }
    }, 3000);
</script>
</body>
</html>