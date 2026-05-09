<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Student Dashboard</title>
    <link rel="stylesheet" href="studentDashboardstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="dashboard-header">
        <div class="header-content">
            <div class="logo-area">
                <i class="fas fa-shield-alt"></i>
                <span class="portal-name">SCORELY</span>
            </div>
            <nav class="header-nav">
                <a href="#" class="nav-item active">Home</a>
                <a href="#" class="nav-item">Profile</a>
                <a href="index.jsp" class="nav-item">Logout</a>
            </nav>
        </div>
    </header>

    <main class="dashboard-main">
        <div class="dashboard-grid">

            <div class="card overall-progress-card">
    <h2>Overall Progress</h2>
    <div class="progress-ring-container">
        <div class="progress-ring" style="--percent: ${overallProgress}">
            <span class="progress-value">${overallProgress}%</span>
        </div>
    </div>
    <p class="status-message">${overallProgress >= 40 ? 'Good Standing' : 'Needs Improvement'}</p>
</div>
      <div class="card marks-overview-card">
    <h2>Marks Overview</h2>
    <table>
        <thead>
            <tr>
                <th>Subject</th>
                <th>Test</th>
                <th>Mid-Sem</th>
                <th>Assignment</th>
                <th>Practical</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${marksData}">
                <tr>
                    <td>${m.subject}</td>
                    <td>${m.test}</td>
                    <td>${m.mid}</td>
                    <td>${m.assign}</td>
                    <td>${m.prac}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
          <div class="card overall-attendance-card">
    <h2>Overall Attendance</h2>
    <div class="attendance-bar-container">
        <p class="bar-label">${attendance}%</p>
        <div class="progress-bar-linear">
            <div class="progress-fill" style="width: ${attendance}%"></div>
        </div>
    </div>
</div>

          <div class="card announcements-card">
    <h2>Announcements / Notices</h2>
    <ul>
        <c:forEach var="a" items="${announcements}">
            <li style="margin-bottom: 15px; border-bottom: 1px solid #eee; padding-bottom: 5px;">
                <div style="display: flex; justify-content: space-between;">
                    <strong>${a.title}</strong>
                    <small style="color: #888;">${a.date}</small>
                </div>
                <p style="margin: 5px 0 0 0; font-size: 0.9em;">${a.msg}</p>
            </li>
        </c:forEach>
    </ul>
</div>

            <div class="card motivation-card">
                <p><b>Keep up the good work !</b></p>
            </div>

        </div>
    </main>
    
</body>
</html>