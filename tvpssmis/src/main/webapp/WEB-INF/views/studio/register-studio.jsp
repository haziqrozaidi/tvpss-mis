<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Register Studio | TVPSS MIS</title>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        <%@ include file="/WEB-INF/views/css/sidebars.css" %>
    </style>
</head>

<body>
	<div class="d-flex" style="min-height: 100vh">
		<!-- Sidebar Include -->
		<%@ include file="/WEB-INF/views/fragments/sidebar.jsp"%>

		<div class="container-fluid p-4">
			<h1 class="mb-4">Register Studio</h1>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<form id="studioForm"
						action="${pageContext.request.contextPath}/studios/register"
						method="post">
						<!-- Studio Basic Information -->
						<div class="form-section">
							<h4 class="mb-3">Studio Basic Information</h4>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Studio Name</label> <input
										type="text" class="form-control" name="studioName"
										placeholder="Enter Studio Name" required />
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">School Name</label> <input
										type="text" class="form-control" name="schoolName"
										value="${user.school.schoolName}" readonly />
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Studio Location</label> <input
										type="text" class="form-control" name="location"
										placeholder="Enter Studio Location" required />
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">Studio Size (sq ft)</label> <input
										type="number" class="form-control" name="size"
										placeholder="Enter Studio Size" required />
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Studio Level</label> <select
										class="form-select" name="studioLevel" required>
										<option value="" disabled selected>Select Studio
											Level</option>
										<option value="Basic">Basic</option>
										<option value="Intermediate">Intermediate</option>
										<option value="Advanced">Advanced</option>
									</select>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label">Associated Program</label> <select
									class="form-select" name="programId" required>
									<option value="" disabled selected>Select Program</option>
									<c:forEach var="program" items="${programs}">
										<option value="${program.programId}">
											${program.youTubeChannelLink}</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<!-- Crew Information -->
						<div class="form-section">
							<h4 class="mb-3">Crew Information</h4>
							<div id="crewSection">
								<!-- Default Crew Row -->
								<div class="row crew-row">
									<div class="col-md-4 mb-3">
										<label class="form-label">Name</label> <select
											class="form-select crewName" name="crewName[]" required>
											<option value="">Select Crew Member</option>
											<c:forEach var="user" items="${users}">
												<option value="${user.userId}"
													data-contact="${user.contactNumber}">
													${user.fullName} (${user.role.roleName})</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-4 mb-3">
										<label class="form-label">Role</label> <select
											class="form-select" name="crewRole[]" required>
											<option value="Director">Director</option>
											<option value="Camera Operator">Camera Operator</option>
											<option value="Sound Technician">Sound Technician</option>
											<option value="Editor">Editor</option>
											<option value="Host">Host</option>
										</select>
									</div>
									<div class="col-md-4 mb-3">
										<label class="form-label">Contact</label> <input type="text"
											class="form-control crewContact" name="crewContact[]"
											placeholder="Contact Number" readonly required />
									</div>
								</div>

							</div>
							<button type="button" class="btn btn-secondary"
								id="addCrewMember">
								<i class="bi bi-plus"></i> Add Crew Member
							</button>
						</div>
						<!-- Equipment Details -->
						<div class="form-section">
							<h4 class="mb-3">Equipment Details</h4>
							<div id="equipmentSection">
								<!-- Predefined Equipment Rows -->
								<div class="row">
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Name</label> <input
											type="text" class="form-control" name="equipmentName[]"
											placeholder="Enter Equipment Name" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Type</label> <select
											class="form-select" name="equipmentType[]" readonly>
											<option value="Camera" selected>Camera</option>
										</select>
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Quantity</label> <input
											type="number" class="form-control" name="quantity[]"
											placeholder="Enter Quantity" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Purchase Date</label> <input
											type="date" class="form-control" name="purchaseDate[]"
											required />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Name</label> <input
											type="text" class="form-control" name="equipmentName[]"
											placeholder="Enter Equipment Name" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Type</label> <select
											class="form-select" name="equipmentType[]" readonly>
											<option value="Microphone" selected>Microphone</option>
										</select>
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Quantity</label> <input
											type="number" class="form-control" name="quantity[]"
											placeholder="Enter Quantity" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Purchase Date</label> <input
											type="date" class="form-control" name="purchaseDate[]"
											required />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Name</label> <input
											type="text" class="form-control" name="equipmentName[]"
											placeholder="Enter Equipment Name" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Equipment Type</label> <select
											class="form-select" name="equipmentType[]" readonly>
											<option value="Lighting" selected>Lighting</option>
										</select>
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Quantity</label> <input
											type="number" class="form-control" name="quantity[]"
											placeholder="Enter Quantity" required />
									</div>
									<div class="col-md-3 mb-3">
										<label class="form-label">Purchase Date</label> <input
											type="date" class="form-control" name="purchaseDate[]"
											required />
									</div>
								</div>
							</div>
							<!-- Add Equipment Button -->
							<button type="button" class="btn btn-secondary" id="addEquipment">
								<i class="bi bi-plus"></i> Add Equipment
							</button>
						</div>



						<!-- Submit Button -->
						<div class="text-center">
							<button type="submit" class="btn btn-primary btn-lg">Register
								Studio</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript for dynamic fields -->
	<script>
      document.addEventListener("DOMContentLoaded", function () {
        const today = new Date().toISOString().split("T")[0];
        document.getElementById("establishmentDate").value = today;
      });

      // Add Additional Crew
     document.addEventListener("DOMContentLoaded", function () {
  // Auto-fill contact number based on selected name
  document.addEventListener("change", function (e) {
    if (e.target.classList.contains("crewName")) {
      const selectedOption = e.target.selectedOptions[0];
      const contactInput = e.target.closest(".crew-row").querySelector(".crewContact");
      const contactNumber = selectedOption.getAttribute("data-contact") || "";
      contactInput.value = contactNumber;
    }
  });

  // Add a new crew member row
  document.getElementById("addCrewMember").addEventListener("click", function () {
    const crewSection = document.getElementById("crewSection");
    const newRow = document.createElement("div");
    newRow.classList.add("row", "crew-row");
    newRow.innerHTML = `
      <div class="col-md-4 mb-3">
        <label class="form-label">Name</label>
        <select class="form-select crewName" name="crewName[]" required>
          <option value="">Select Crew Member</option>
          <c:forEach var="user" items="${users}">
            <option value="${user.userId}" data-contact="${user.contactNumber}">
              ${user.fullName} (${user.role.roleName})
            </option>
          </c:forEach>
        </select>
      </div>
      <div class="col-md-4 mb-3">
        <label class="form-label">Role</label>
        <select class="form-select" name="crewRole[]" required>
          <option value="Director">Director</option>
          <option value="Camera Operator">Camera Operator</option>
          <option value="Sound Technician">Sound Technician</option>
          <option value="Editor">Editor</option>
          <option value="Host">Host</option>
        </select>
      </div>
      <div class="col-md-4 mb-3">
        <label class="form-label">Contact</label>
        <input type="text" class="form-control crewContact" name="crewContact[]" placeholder="Contact Number" readonly required />
      </div>
    `;
    crewSection.appendChild(newRow);
  });
});

//Add Equipment
      document.getElementById("addEquipment").addEventListener("click", function () {
    	  const equipmentSection = document.getElementById("equipmentSection");
    	  const newRow = document.createElement("div");
    	  newRow.classList.add("row");
    	  newRow.innerHTML = `
    	    <div class="col-md-3 mb-3">
    	      <label class="form-label">Equipment Name</label>
    	      <input type="text" class="form-control" name="equipmentName[]" placeholder="Enter Equipment Name" required />
    	    </div>
    	    <div class="col-md-3 mb-3">
    	      <label class="form-label">Equipment Type</label>
    	      <select class="form-select" name="equipmentType[]" required>
    	        <option value="Camera">Camera</option>
    	        <option value="Microphone">Microphone</option>
    	        <option value="Lighting">Lighting</option>
    	      </select>
    	    </div>
    	    <div class="col-md-3 mb-3">
    	      <label class="form-label">Quantity</label>
    	      <input type="number" class="form-control" name="quantity[]" placeholder="Enter Quantity" required />
    	    </div>
    	    <div class="col-md-3 mb-3">
    	      <label class="form-label">Purchase Date</label>
    	      <input type="date" class="form-control" name="purchaseDate[]" required />
    	    </div>
    	  `;
    	  equipmentSection.appendChild(newRow);
    	});


      // Validate form on submit
      document.getElementById("studioForm").addEventListener("submit", function (e) {
        if (!this.checkValidity()) {
          e.preventDefault();
          alert("Please fill in all required fields.");
        }
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const equipmentNavLink = document.querySelector(
          'a[href*="studios/register"]',
        );
        if (equipmentNavLink) {
          equipmentNavLink.classList.add("active");
        }
      });
    </script>
</body>
</html>
