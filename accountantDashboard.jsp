<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Accountant Dashboard</title>
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
/* --- Right Side Main Content Layout --- */
.main-content {
    flex-grow: 1;
    padding: 30px;
    background-color: #f4f7f9; /* Light background for contrast */
    min-height: 100vh;
}

.main-header-title {
    font-size: 1.8rem;
    margin-bottom: 25px;
    color: #2c3e50;
    font-weight: 600;
}

/* --- Content Cards (Filter & Table) --- */
.content-panel-card {
    background-color: #c4daff;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.06);
    margin-bottom: 25px;
}

.panel-header-title {
    color: #2c3e50;
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 20px;
    border-left: 4px solid #3880c1;
    padding-left: 10px;
}

/* --- Filter Controls --- */
.filter-controls-group {
    display: flex;
    gap: 20px;
    align-items: flex-end;
    flex-wrap: wrap;
}

.filter-sub-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.filter-label-text {
    font-size: 0.9rem;
    font-weight: 500;
    color: #555;
}

.filter-select-input {
    padding: 10px 12px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    font-size: 0.95rem;
    min-width: 180px;
    outline: none;
    transition: border-color 0.2s;
}

.filter-select-input:focus {
    border-color: #3880c1;
}

.refined-search-btn {
    background-color: #3880c1;
    color: #ffffff;
    border: none;
    padding: 11px 25px;
    border-radius: 6px;
    font-size: 0.95rem;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

.refined-search-btn:hover {
    background-color: #2c6aa8;
}

/* --- Data Table Design --- */
.data-summary-txt {
    color: #7f8c8d;
    margin-bottom: 15px;
    font-size: 0.9rem;
    font-style: italic;
}

.refined-data-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
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
}

/* --- Action Button Designs --- */
.actions-col {
    display: flex;
    gap: 10px;
    align-items: center;
}

.action-btn {
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 600;
    padding: 6px 12px;
    border-radius: 6px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: all 0.3s ease;
    border: 1px solid transparent;
}

/* Edit Button - Green Border Style */
.btn-edit-outline {
    color: #28a745;
    border-color: #28a745;
    background-color: transparent;
}

.btn-edit-outline:hover {
    background-color: #28a745;
    color: #fff;
    box-shadow: 0 2px 8px rgba(40, 167, 69, 0.3);
}

/* Delete Button - Red Border Style */
.btn-delete-outline {
    color: #dc3545;
    border-color: #dc3545;
    background-color: transparent;
}

.btn-delete-outline:hover {
    background-color: #dc3545;
    color: #fff;
    box-shadow: 0 2px 8px rgba(220, 53, 69, 0.3);
}

/* Icon adjustments */
.action-btn i {
    font-size: 0.9rem;
}
/* Modal Background (Pura screen dhakne ke liye) */
.modal-overlay {
    display: none; 
    position: fixed;
    z-index: 1000;
    left: 0; top: 0;
    width: 100%; height: 100%;
    background-color: rgba(0,0,0,0.5); /* Black transparent background */
    align-items: center;
    justify-content: center;
}

/* Modal Box */
.modal-content-card {
    background-color: #fff;
    padding: 25px;
    border-radius: 10px;
    width: 400px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.modal-content-card h3 { margin-top: 0; color: #333; }

.modal-form-group { margin-bottom: 15px; }

.modal-form-group label { display: block; margin-bottom: 5px; font-weight: bold; }

.modal-form-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
}

.modal-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 20px;
}

.save-btn { background: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; }
.cancel-btn { background: #6c757d; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; }
/* Custom Delete Modal Styling */
.delete-overlay {
    display: none; /* Default hidden */
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.7);
    backdrop-filter: blur(4px); /* Background blur effect */
    z-index: 9999;
    align-items: center;
    justify-content: center;
}

.delete-card {
    background: #fff;
    width: 320px;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 15px 30px rgba(0,0,0,0.3);
    animation: popIn 0.3s ease-out;
}

@keyframes popIn {
    0% { transform: scale(0.7); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
}

.delete-card i {
    font-size: 50px;
    color: #ff4757;
    margin-bottom: 15px;
}

.delete-card h3 { margin: 10px 0; color: #2f3542; }
.delete-card p { color: #747d8c; font-size: 14px; margin-bottom: 20px; }

.del-btn-group { display: flex; gap: 10px; justify-content: center; }

.btn-yes { background: #ff4757; color: #fff; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; font-weight: bold; }
.btn-no { background: #f1f2f6; color: #2f3542; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; }
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
                <li class="nav-item active">
                    <a href="#"><i class="fas fa-chart-line"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                     <a href="addStudent.jsp"><i class="fas fa-pencil-alt"></i> Add Student</a>
                </li>
                <li class="nav-item">
                    <a href="addTeacher.jsp"><i class="fas fa-edit"></i> Add Teacher</a>
                </li>
                <li class="nav-item">
                    <a href="feesEntry.jsp"><i class="fas fa-bullhorn"></i>Fees Entry</a>
                </li>
                <li class="nav-item">
                    <a href="updateFeesStructure.jsp"><i class="fas fa-user-cog"></i>Update Fees Structure</a>
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
    <div class="main-header-title">Management Overview</div>

    <div class="content-panel-card">
        <div class="panel-header-title">Filter Panel</div>
        <form action="AccountantDashboardServlet" method="get">
            <div class="filter-controls-group">
                <div class="filter-sub-group">
                    <span class="filter-label-text">View List For</span>
                    <select name="viewType" id="viewType" class="filter-select-input" onchange="toggleClassName()">
                        <option value="">-- Select Type --</option>
                        <option value="student" ${viewType == 'student' ? 'selected' : ''}>Students</option>
                        <option value="teacher" ${viewType == 'teacher' ? 'selected' : ''}>Teachers</option>
                    </select>
                </div>

                <div class="filter-sub-group" id="classFilterSubGroup" style="display: ${viewType == 'student' ? 'flex' : 'none'};">
                    <span class="filter-label-text">Select Class</span>
                    <select name="className" class="filter-select-input">
                        <option value="all">All Classes</option>
                        <option value="Nursery" ${selectedClass == 'Nursery' ? 'selected' : ''}>Nursery</option>
                         <option value="LKG" ${selectedClass == 'LKG' ? 'selected' : ''}>LKG</option>
                          <option value="UKG" ${selectedClass == 'UKG' ? 'selected' : ''}>UKG</option>
                        <option value="1st" ${selectedClass == '1st' ? 'selected' : ''}>1st</option>
                         <option value="2nd" ${selectedClass == '2nd' ? 'selected' : ''}>2nd</option>
                          <option value="3rd" ${selectedClass == '3rd' ? 'selected' : ''}>3rd</option>
                           <option value="4th" ${selectedClass == '4th' ? 'selected' : ''}>4th</option>
                            <option value="5th" ${selectedClass == '5th' ? 'selected' : ''}>5th</option>
                             <option value="6th" ${selectedClass == '6th' ? 'selected' : ''}>6th</option>
                              <option value="7th" ${selectedClass == '7th' ? 'selected' : ''}>7th</option>
                               <option value="8th" ${selectedClass == '8th' ? 'selected' : ''}>8th</option>
                                <option value="9th" ${selectedClass == '9th' ? 'selected' : ''}>9th</option>
                                 <option value="10th" ${selectedClass == '10th' ? 'selected' : ''}>10th</option>
                                  <option value="11th" ${selectedClass == '11th' ? 'selected' : ''}>11th</option>
                                   <option value="12th" ${selectedClass == '12th' ? 'selected' : ''}>12th</option>
                    </select>
                </div>

                <button type="submit" class="refined-search-btn">Search Records</button>
            </div>
        </form>
    </div>

    <div class="content-panel-card">
        <div class="panel-header-title">Users List</div>

        <c:choose>
            <%-- Jab initial login ho --%>
            <c:when test="${empty viewType}">
                <div style="text-align: center; padding: 40px; color: #95a5a6;">
                    <i class="fas fa-info-circle" style="font-size: 2rem; margin-bottom: 10px;"></i>
                    <p>Please select Student or Teacher from the filters above to see records.</p>
                </div>
            </c:when>

            <%-- Jab Data show karna ho --%>
            <c:otherwise>
                <div class="data-summary-txt">
                    Showing: <b>${viewType == 'student' ? 'Students' : 'Teachers'}</b> - ${userList.size()} Records Found
                </div>
                
                <table class="refined-data-table">
                    <thead>
                        <tr>
                            <th>S.No</th>
                            <c:if test="${viewType == 'student'}">
                                <th>Name</th>
                                <th>Class</th>
                                <th>Roll No</th>
                                <th>Father Name</th>
                            </c:if>
                            <c:if test="${viewType == 'teacher'}">
                                <th>Teacher Name</th>
                            </c:if>
                            <th>Phone Number</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${userList}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <c:choose>
                                    <c:when test="${viewType == 'student'}">
                                        <td>${user.name}</td>
                                        <td>${user.className}</td> <td>${user.rollNo}</td>
                                        <td>${user.father_name}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${user.name}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${user.phone}</td>
                                <td class="actions-col">
                                    <button type="button" class="action-btn btn-edit-outline" 
        onclick="openEditModal('${user.id}', '${user.name}', '${user.phone}', '${viewType}', '${user.father_name}', '${user.rollNo}')">
    <i class="fas fa-edit"></i> Edit
</button>
    <button type="button" class="action-btn btn-delete-outline" 
        onclick="askDelete('${user.id}', '${viewType}')">
    <i class="fas fa-trash"></i> Delete
</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    function toggleClassName() {
        var viewType = document.getElementById("viewType").value;
        var classGroup = document.getElementById("classFilterSubGroup");
        classGroup.style.display = (viewType === "student") ? "flex" : "none";
    }
</script>
<div id="editModal" class="modal-overlay">
    <div class="modal-content-card">
        <h3>Edit Details</h3>
        <form action="UpdateUserServlet" method="post">
            <input type="hidden" name="id" id="modal-id">
            <input type="hidden" name="type" id="modal-type">

            <div class="modal-form-group">
                <label>Name</label>
                <input type="text" name="name" id="modal-name" required>
            </div>

            <div id="student-fields" style="display:none;">
                <div class="modal-form-group">
                    <label>Father Name</label>
                    <input type="text" name="fatherName" id="modal-father">
                </div>
                <div class="modal-form-group">
                    <label>Roll Number</label>
                    <input type="text" name="rollNo" id="modal-roll">
                </div>
            </div>

            <div class="modal-form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" id="modal-phone"  pattern="[0-9]{10}"  maxlength="10"required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="save-btn">Save & Close</button>
                <button type="button" class="cancel-btn" onclick="closeEditModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>
<script>
    function openEditModal(id, name, phone, type, father, roll) {
    document.getElementById('modal-id').value = id;
    document.getElementById('modal-name').value = name;
    document.getElementById('modal-phone').value = phone;
    document.getElementById('modal-type').value = type;

    var studentDiv = document.getElementById('student-fields');
    if(type === 'student') {
        studentDiv.style.display = 'block';
        document.getElementById('modal-father').value = father;
        document.getElementById('modal-roll').value = roll;
    } else {
        studentDiv.style.display = 'none';
    }

    document.getElementById('editModal').style.display = 'flex';
}

function closeEditModal() {
    document.getElementById('editModal').style.display = 'none';
}
    </script>
<div id="deleteConfirmModal" class="delete-overlay">
    <div class="delete-card">
        <i class="fas fa-trash-alt"></i>
        <h3>Delete Record?</h3>
        <p>Are you sure ?</p>
        <div class="del-btn-group">
            <button id="confirmDelete" class="btn-yes">Yes, Delete</button>
            <button onclick="closeDeletePopup()" class="btn-no">Cancel</button>
        </div>
    </div>
</div>
    <script>
        let finalUrl = "";

function askDelete(id, type) {
    // Servlet URL yahan construct karein
    finalUrl = "DeleteUser?id=" + id + "&type=" + type;
    document.getElementById("deleteConfirmModal").style.display = "flex";
}

function closeDeletePopup() {
    document.getElementById("deleteConfirmModal").style.display = "none";
}

// "Yes" click hone par servlet par bhejein
document.getElementById("confirmDelete").onclick = function() {
    window.location.href = finalUrl;
};
        </script>
</body>
</html>