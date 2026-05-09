<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scorely - Fees Entry</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        :root {
            --primary: #3880c1;
            --secondary: #61a0e1;
            --bg-light: #f4f7fa;
            --white: #ffffff;
            --card-blue: #c4daff;
            --text-dark: #2c3e50;
            --shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
        body { background-color: var(--bg-light); display: flex; min-height: 100vh; margin: 0; }

        /* --- Sidebar Style (Fixed) --- */
        .sidebar { 
            width: 280px; 
            background-image: linear-gradient(to bottom, #78a9e4, #0037ff); 
            color: #fff; 
            padding: 20px 0; 
            position: fixed; 
            height: 100vh; 
            top: 0; left: 0; 
            z-index: 1000;
        }
        .logo { padding: 0 20px 30px; font-size: 1.6rem; font-weight: 600; display: flex; align-items: center; gap: 10px; }

        .nav-item a { display: flex; align-items: center; padding: 12px 20px; color: #ffffff; text-decoration: none; transition: 0.2s; opacity: 0.9; }
        .nav-item.active a { background-color: rgba(255, 255, 255, 0.3); border-radius: 4px; margin: 0 15px; opacity: 1; }
        .nav-item a i { width: 30px; font-size: 1.1rem; }

        /* --- Main Content (Shifted) --- */
        .main-content { flex-grow: 1; padding: 30px; margin-left: 280px; width: calc(100% - 280px); }
        .header-title { font-size: 1.8rem; margin-bottom: 25px; color: var(--text-dark); font-weight: 600; }

        /* --- Filter Panel --- */
        .filter-panel { background: var(--card-blue); padding: 20px; border-radius: 12px; margin-bottom: 25px; display: flex; gap: 20px; align-items: flex-end; box-shadow: var(--shadow); }
        .input-field { padding: 10px; border: 1px solid #ced4da; border-radius: 6px; outline: none; min-width: 200px; }
        .search-btn { background: var(--primary); color: #fff; border: none; padding: 10px 25px; border-radius: 6px; cursor: pointer; font-weight: 600; }

        /* --- Table Styling --- */
        .table-container { background: var(--white); border-radius: 12px; padding: 20px; box-shadow: var(--shadow); overflow-x: auto; }
        .fees-table { width: 100%; border-collapse: collapse; }
        .fees-table th { background: #f8f9fa; color: #777; text-align: left; padding: 15px; font-size: 0.85rem; border-bottom: 2px solid #eee; }
        .fees-table td { padding: 15px; border-bottom: 1px solid #eee; font-size: 0.9rem; }
        .btn-add-pay { background: transparent; border: 1px solid var(--primary); color: var(--primary); padding: 6px 12px; border-radius: 6px; cursor: pointer; font-weight: 600; transition: 0.3s; }
        .btn-add-pay:hover { background: var(--primary); color: #fff; }

        /* --- NEW MODAL WINDOW UI --- */
        .modal-overlay { 
            display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
            background: rgba(0,0,0,0.4); backdrop-filter: blur(8px); z-index: 9999; 
            justify-content: center; align-items: center; 
        }
        .modal-window { 
            background: #fff; width: 950px; border-radius: 20px; overflow: hidden; 
            box-shadow: 0 25px 50px rgba(0,0,0,0.2); animation: slideUp 0.3s ease-out; 
        }
        @keyframes slideUp { from { transform: translateY(40px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }

        .modal-header { background: linear-gradient(135deg, #3880c1, #0037ff); color: #fff; padding: 20px 25px; display: flex; justify-content: space-between; align-items: center; }
        .close-modal { cursor: pointer; font-size: 1.5rem; }

        /* Section 1: Student Details Top Bar */
        .student-details-card { background: #f8fbff; margin: 20px 25px; padding: 20px; border-radius: 12px; border: 1px solid #e1e8f0; }
        .section-title { font-size: 1rem; font-weight: 700; color: #3880c1; margin-bottom: 12px; display: flex; align-items: center; gap: 8px; }
        .details-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 15px; }
        .detail-box { display: flex; flex-direction: column; }
        .detail-box label { font-size: 0.7rem; color: #64748b; text-transform: uppercase; margin-bottom: 4px; }
        .detail-box span { font-weight: 600; color: #1e293b; font-size: 0.9rem; display: flex; align-items: center; gap: 5px; }

        /* Layout Split */
        .modal-content-split { display: grid; grid-template-columns: 1.4fr 1fr; gap: 25px; padding: 0 25px 25px; }
        
        .payment-form { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .form-group { display: flex; flex-direction: column; gap: 5px; }
        .form-group label { font-size: 0.85rem; font-weight: 600; color: #444; }
        .form-group input, .form-group select { padding: 10px; border: 1.5px solid #e2e8f0; border-radius: 8px; outline: none; }
        
        .history-scroll { max-height: 280px; overflow-y: auto; padding-right: 10px; }
        .history-entry { background: #fff; border: 1px solid #f1f5f9; padding: 12px; border-radius: 10px; margin-bottom: 10px; border-left: 4px solid #27ae60; }

        .btn-submit { background: #27ae60; color: #fff; border: none; padding: 12px; border-radius: 8px; font-weight: 600; cursor: pointer; width: 100%; margin-top: 15px; }
        .btn-submit:hover { background: #219150; }
   /* --- Fees Summary Section --- */
.fees-summary-container {
    background: #e1efff;
    margin: 0 25px 20px;
    padding: 15px;
    border-radius: 15px;
    border: 1px solid #c4daff;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}
.summary-card {
    background: #fff;
    padding: 15px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}
.summary-card label {
    display: block;
    font-size: 0.75rem;
    color: #64748b;
    text-transform: uppercase;
    font-weight: 700;
    margin-bottom: 5px;
}
.summary-card span {
    font-size: 1.4rem;
    font-weight: 800;
    color: #1e293b;
}
.summary-card.total span { color: #2c3e50; }
.summary-card.paid span { color: #10b981; }
.summary-card.due span { color: #ef4444; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo"><i class="fas fa-shield-alt"></i> Scorely</div>
        <nav>
            <ul>
                <li class="nav-item"><a href="#"><i class="fas fa-chart-line"></i> Dashboard</a></li>
                <li class="nav-item"><a href="addStudent.jsp"><i class="fas fa-pencil-alt"></i> Add Student</a></li>
                <li class="nav-item"><a href="addTeacher.jsp"><i class="fas fa-edit"></i> Add Teacher</a></li>
                <li class="nav-item active"><a href="feesEntry.jsp"><i class="fas fa-bullhorn"></i> Fees Entry</a></li>
                <li class="nav-item"><a href="updateFeesStructure.jsp"><i class="fas fa-user-cog"></i> Update Fees Structure</a></li>
                <li class="nav-item"><a href="financialReport.jsp"><i class="fas fa-user-cog"></i> Financial Report</a></li>
                <li class="nav-item"><a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <h1 class="header-title">Fees Management Entry</h1>

        <div class="filter-panel">
    <div class="filter-group">
        <label>Select Class</label>
        <select class="input-field" id="classSelector" onchange="filterClass()">
            <option value="">Choose Class</option>
            <c:forEach var="cls" items="${['Nursery', 'LKG', 'UKG', '1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th']}">
                <option value="${cls}" ${currentClass == cls ? 'selected' : ''}>${cls}</option>
            </c:forEach>
        </select>
    </div>
    <div class="filter-group">
        <label>Search by Name</label>
        <input type="text" id="nameSearch" class="input-field" placeholder="Student name (Optional)">
    </div>
    <button class="search-btn" onclick="searchByName()"><i class="fas fa-search"></i> Search Records</button>
</div>

        <div class="table-container">
            <table class="fees-table">
                <thead>
                    <tr><th>S.No.</th><th>Roll No.</th><th>Student Name</th><th>Father Name</th><th>Total Fees</th><th>Paid Fees</th><th>Due Amount</th><th>Action</th></tr>
                </thead>
                <tbody>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.rollNo}</td>
            <td>${student.name}</td>
            <td>${student.father}</td>
            <td>₹${student.total}</td>
            <td>₹${student.paid}</td>
            <td style="color:red; font-weight:bold;">₹${student.due}</td>
            <td>
               <button class="btn-add-pay" 
    onclick="openPaymentModal('${student.rollNo}', '${student.name}', '${student.total}', '${student.paid}', '${student.due}', '${student.father}', '${currentClass}')">
    <i class="fas fa-plus"></i> Add Payment
</button>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${empty studentList}">
        <tr>
            <td colspan="8" style="text-align:center; padding:20px; color:#999;">No Records!</td>
        </tr>
    </c:if>
</tbody>
            </table>
        </div>
    </div>

    <div id="paymentModal" class="modal-overlay">
        <div class="modal-window">
            <div class="modal-header">
                <h3><i class="fas fa-file-invoice-dollar"></i> Fee Payment Portal</h3>
                <span class="close-modal" onclick="closeModal()">&times;</span>
            </div>
            
            <div class="student-details-card">
                <h4 class="section-title"><i class="fas fa-user-graduate"></i> Student Details</h4>
                <div class="details-grid">
    <div class="detail-box"><label>Name</label><span id="m-name"></span></div>
    <div class="detail-box"><label>Class</label><span id="m-class">12th</span></div>
    <div class="detail-box"><label>Roll No</label><span id="m-roll"></span></div>
    <div class="detail-box"><label>Father Name</label><span id="m-father">Aman Khan</span></div>
    <div class="detail-box"><label>Mobile</label><span>983827xxxx</span></div>
</div>
            </div>
<div class="fees-summary-container">
    <div class="summary-card total">
        <label>Total Fees</label>
        <span id="m-total">₹0.00</span>
    </div>
    <div class="summary-card paid">
        <label>Paid Fees</label>
        <span id="m-paid">₹0.00</span>
    </div>
    <div class="summary-card due">
        <label>Due Fees</label>
        <span id="m-due">₹0.00</span>
    </div>
</div>
            <div class="modal-content-split">
                <div class="form-section">
                    <h4 class="section-title"><i class="fas fa-plus-circle"></i> Add New Payment</h4>
                    <div class="payment-form">
                        <div class="form-group"><label>Deposit Amount</label><input type="number" placeholder="Enter Amount"></div>
                        <div class="form-group"><label>Deposit Date</label><input type="date"></div>
                        <div class="form-group"><label>Mode</label><select><option>Cash</option><option>UPI/Online</option></select></div>
                        <div class="form-group"><label>Fees Type</label><select><option>Tuition Fee</option></select></div>
                        <div class="form-group"><label>Academic Year</label><input type="text" value="2024-25" readonly></div>
                        <div class="form-group"><label>Transaction ID</label><input type="text" placeholder="Optional"></div>
                        <div style="grid-column: span 2;"><button class="btn-submit"><i class="fas fa-check"></i> Submit Payment</button></div>
                    </div>
                </div>

                <div class="history-section">
                    <h4 class="section-title"><i class="fas fa-history"></i> Payment History</h4>
                    <div class="history-scroll">
                        <div class="history-entry">
                            <div style="display:flex; justify-content:space-between;"><b>₹5,000.00</b><small>10 Jan 2024</small></div>
                            <div style="font-size:0.8rem; color:#475569;">Mode: Cash | ID: REC-501</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <script>
    // 1. Modal Open Function (Fully Dynamic)
    function openPaymentModal(roll, name, total, paid, due, father, studentClass) {
        console.log("Opening Modal for:", name); // Debugging ke liye

        // Student Basic Info
        document.getElementById('m-roll').innerHTML = '<i class="fas fa-id-badge"></i> ' + roll;
        document.getElementById('m-name').innerHTML = '<i class="fas fa-user"></i> ' + name;
        
        // Father & Class Update
        if(document.getElementById('m-father')) document.getElementById('m-father').innerText = father;
        if(document.getElementById('m-class')) document.getElementById('m-class').innerText = studentClass;
        
        // Fees Summary (Numbers formatted with commas)
        document.getElementById('m-total').innerText = '₹' + parseFloat(total).toLocaleString('en-IN');
        document.getElementById('m-paid').innerText = '₹' + parseFloat(paid).toLocaleString('en-IN');
        document.getElementById('m-due').innerText = '₹' + parseFloat(due).toLocaleString('en-IN');

        // Show Modal
        document.getElementById('paymentModal').style.display = 'flex';
    }

    // 2. Modal Close Function
    function closeModal() { 
        document.getElementById('paymentModal').style.display = 'none'; 
    }

    // 3. Class Filter Logic
    function filterClass() {
        var selectedClass = document.getElementById("classSelector").value;
        if(selectedClass) {
            window.location.href = "FeesEntryServlet?class=" + encodeURIComponent(selectedClass);
        }
    }

    // 4. Client-side Name Search
    function searchByName() {
        var input = document.getElementById("nameSearch").value.toUpperCase();
        var table = document.querySelector(".fees-table");
        var tr = table.getElementsByTagName("tr");

        for (var i = 1; i < tr.length; i++) {
            var tdName = tr[i].getElementsByTagName("td")[2];
            if (tdName) {
                var txtValue = tdName.textContent || tdName.innerText;
                tr[i].style.display = txtValue.toUpperCase().indexOf(input) > -1 ? "" : "none";
            }
        }
    }

    // 5. Modal ke bahar click karne par band hona (Extra safety)
    window.onclick = function(event) {
        var modal = document.getElementById('paymentModal');
        if (event.target == modal) {
            closeModal();
        }
    }
</script>
</body>
</html>