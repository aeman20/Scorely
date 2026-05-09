<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
        /* --- Sidebar Styling (Fixed) --- */
.sidebar {
    width: 280px;
    background-image: linear-gradient(to bottom, var(--gradient-start), #0037ff);
    color: var(--text-light);
    padding: 20px 0;
    flex-shrink: 0;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);

    /* --- Naya code jo add karna hai --- */
    position: fixed;    /* Sidebar ko fix karne ke liye */
    height: 100vh;      /* Puri screen ki height */
    top: 0;
    left: 0;
    z-index: 1000;      /* Content ke upar rakhne ke liye */
    overflow-y: auto;   /* Menu bada ho toh sidebar ke andar scroll aaye */
}

/* --- Main Content Area (Shifted Right) --- */
.main-content {
    flex-grow: 1;
    padding: 30px;
    
    /* --- Naya code jo add karna hai --- */
    margin-left: 280px;         /* Sidebar ki width ke barabar gap */
    width: calc(100% - 280px);  /* Bachi hui puri jagah lene ke liye */
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
        
        /* --- General Reset & Fonts --- */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
}

/* --- Color Variables (Consistent with Accountant Dashboard) --- */
:root {
    --primary-blue-dark: #3880c1;
    --primary-blue-light: #61a0e1;
    --sidebar-bg: #89b7eb;
    --white: #ffffff;
    --light-gray-bg: #f4f7fa;
    --text-dark: #333;
    --text-light: #fff;
    --border-light: #e0e0e0;
    --shadow-soft: 0 4px 12px rgba(0, 0, 0, 0.08);
    --gradient-start: #78a9e4;
    --card-blue: #c4daff;
}

body {
    background-color: var(--light-gray-bg);
    display: flex;
    min-height: 100vh;
}

/* --- Sidebar Styling --- */
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
}

.logo i {
    margin-right: 10px;
    font-size: 1.8rem;
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

.nav-item.active a {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 4px;
    margin: 0 15px;
    opacity: 1;
}

/* --- Main Content Layout --- */
.main-content {
    flex-grow: 1;
    padding: 30px;
}

.main-header-title {
    font-size: 1.8rem;
    margin-bottom: 25px;
    color: #2c3e50;
    font-weight: 600;
}

/* --- Content Panel Card --- */
.content-panel-card {
    background-color: var(--white);
    border-radius: 12px;
    padding: 25px;
    box-shadow: var(--shadow-soft);
}

.panel-header-title {
    color: #2c3e50;
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 20px;
    border-left: 4px solid var(--primary-blue-dark);
    padding-left: 10px;
}

/* --- Refined Data Table --- */
.refined-data-table {
    width: 100%;
    border-collapse: collapse;
}

.refined-data-table th {
    background-color: #f8f9fa;
    color: #777;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.8rem;
    padding: 15px;
    border-bottom: 2px solid #edf2f7;
    text-align: left;
}

.refined-data-table td {
    padding: 15px;
    border-bottom: 1px solid #edf2f7;
    font-size: 0.95rem;
    color: #333;
    vertical-align: middle;
}

/* --- Forms & Inputs inside Table --- */
.filter-select-input {
    padding: 8px 12px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    font-size: 0.95rem;
    outline: none;
    transition: border-color 0.2s;
}

.filter-select-input:focus {
    border-color: var(--primary-blue-dark);
}

.refined-search-btn {
    background-color: #3880c1;
    color: #ffffff;
    border: none;
    padding: 8px 20px;
    border-radius: 6px;
    font-size: 0.9rem;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

.refined-search-btn:hover {
    background-color: #2c6aa8;
}

/* --- Class Badge Style --- */
.class-badge {
    background: var(--card-blue);
    color: var(--primary-blue-dark);
    padding: 5px 12px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 0.85rem;
}

/* --- Alerts/Status Messages --- */
.status-msg {
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
    gap: 10px;
}

.status-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
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
           
            
                <li class="nav-item">
                    <a href="#"><i class="fas fa-edit"></i> Add Teacher</a>
                </li>
                <li class="nav-item">
                    <a href="feesEntry.jsp"><i class="fas fa-bullhorn"></i> Fees Entry</a>
                </li>
                <li class="nav-item active">
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
    <div class="main-header-title">Fees Management</div>

    <%-- Success/Error Messages --%>
    <%-- Status Message with ID --%>
<c:if test="${param.status == 'success'}">
    <div id="success-message" style="color: #155724; background: #d4edda; padding: 12px; border-radius: 8px; margin-bottom: 15px; border: 1px solid #c3e6cb;">
        <i class="fas fa-check-circle"></i> Fees updated successfully!
    </div>
</c:if>

    <div class="content-panel-card">
        <div class="panel-header-title">Class-wise Yearly Fees Structure</div>
        
        <table class="refined-data-table">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Class Name</th>
                    <th>Yearly Fees (INR ₹)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int serialNo = 1;
                    Connection con = null;
                    try {
                        // Driver load karna
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Aapke credentials: blank password
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scorely_db", "root", "");
                        
                        // Query to fetch all classes
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM fees_structure ORDER BY id ASC");
                        
                        while(rs.next()) {
                %>
                <tr>
                    <td><%= serialNo++ %></td>
                    <td>
                        <span class="class-badge" style="background: #c4daff; color: #3880c1; padding: 5px 10px; border-radius: 5px; font-weight: 600;">
                            <%= rs.getString("class_name") %>
                        </span>
                    </td>
                    
                    <%-- Har row ke liye ek chota form taaki wahi se update ho sake --%>
                    <form action="UpdateFeesServlet" method="post">
                        <td>
                            <input type="hidden" name="update_id" value="<%= rs.getInt("id") %>">
                           <input type="number" name="fees_amount" 
       value="<fmt:formatNumber value='<%= rs.getDouble("yearly_fees") %>' pattern='#####' />" 
       class="filter-select-input" style="min-width: 120px;" required>
                        </td>
                        <td>
                            <button type="submit" class="refined-search-btn" style="padding: 5px 15px;">
                                <i class="fas fa-sync-alt"></i> Update
                            </button>
                        </td>
                    </form>
                </tr>
                <% 
                        }
                    } catch(Exception e) { 
                        out.print("<tr><td colspan='4' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace(); 
                    } finally {
                        if(con != null) con.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<script>
    setTimeout(function() {
        var msg = document.getElementById('success-message');
        if (msg) {
            // 1. Pehle message ko fade out karke hide karein
            msg.style.transition = "opacity 0.5s";
            msg.style.opacity = "0";
            
            setTimeout(function() {
                msg.style.display = 'none';
                
                // 2. URL se "?status=success" ko hatayein bina page reload kiye
                var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                window.history.pushState({path: newUrl}, '', newUrl);
            }, 500);
        }
    }, 3000); // 3 second baad
</script>
</body>
</html>