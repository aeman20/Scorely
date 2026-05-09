<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Teacher Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="teacherEnterMarks.css">
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
      /*  .table-card {
            background-color: var(--white);
            border-radius: 12px;
            box-shadow: var(--shadow-soft);
            padding: 20px;
        }*/

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

      /* Registration Form Styling */
.registration-card {
    background-color:rgba(0, 55, 255, 0.2);
    border-radius: 15px;
    box-shadow: var(--shadow-soft);
    padding: 35px;
    max-width: 800px;
    margin: 20px auto;
    border: 1px solid var(--border-light);
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr; /* Do columns banayega */
    gap: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.full-width {
    grid-column: span 2; /* Kuch fields ko full width karne ke liye */
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: var(--text-dark);
    font-size: 1.2rem;
}

.form-control {
    width: 100%;
    padding: 14px;
    border: 1px solid #d1d9e6;
    border-radius: 8px;
    font-size: 1.1rem;
    transition: border-color 0.3s;
}

.form-control:focus {
    border-color: var(--primary-blue-dark);
    outline: none;
}

.reg-btn {
    background-color: var(--primary-blue-dark);
    color: white;
    border: none;
    padding: 15px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    width: 100%;
    font-size: 1rem;
    margin-top: 10px;
    transition: 0.3s;
}

.reg-btn:hover {
    background-color: #0037ff;
    box-shadow: 0 4px 15px rgba(0, 55, 255, 0.2);
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
                    <a href="accountantDashboard.jsp"><i class="fas fa-chart-line"></i> Dashboard</a>
                </li>
            <li class="nav-item">
                    <a href="addStudent.jsp"><i class="fas fa-pencil-alt"></i>  Add Student</a>
                </li>  
           
            
                <li class="nav-item active">
                    <a href="#"><i class="fas fa-edit"></i> Add Teacher</a>
                </li>
                <li class="nav-item">
                    <a href="feesEntry.jsp"><i class="fas fa-bullhorn"></i> Fees Entry</a>
                </li>
                <li class="nav-item">
                    <a href="updateFeesStructure.jsp"><i class="fas fa-user-cog"></i> Update Fees Structure</a>
                </li>
                 <li class="nav-item">
                    <a href="financialReport.jsp"><i class="fas fa-user-cog"></i>Financial Report</a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </nav>
    </div>

  <div class="main-content">
    <div class="header">
        <center><h1>Teacher Registration</h1></center>
    </div>

    <div class="registration-card">
        <form action="RegisterTeacherServlet" method="post">
            <div class="form-grid">
                
                <div class="form-group full-width">
                    <label><i class="fas fa-chalkboard-teacher"></i> Teacher's Full Name</label>
                    <input type="text" name="teacherName" class="form-control" placeholder="Enter Full Name" required>
                </div>

                <div class="form-group">
                    <label><i class="fas fa-envelope"></i> Email Address</label>
                    <input type="email" name="email" class="form-control" placeholder="teacher@school.com" required>
                </div>

                <div class="form-group">
                    <label><i class="fas fa-phone"></i> Mobile Number</label>
                    <input type="tel" name="phone" class="form-control" 
                           placeholder="10-digit number" 
                           pattern="[0-9]{10}" 
                           maxlength="10" required>
                </div>

                <div class="form-group full-width">
                    <label><i class="fas fa-lock"></i> Set Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Create login password" required>
                </div>

                <div class="form-group full-width">
                    <button type="submit" class="reg-btn">Create Teacher Account</button>
                </div>

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