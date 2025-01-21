<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Student Application | TVPSS MIS</title>
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
			<h1 class="mb-4">Student Application</h1>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<form id="studentApplicationForm"
						action="${pageContext.request.contextPath}/studentApplication/register"
						method="post">
						<input type="hidden" name="application_id"
                    	value="${application.application_Id}" />
						<!-- Application Details -->
						<div class="form-section">
							<h4 class="mb-3">Application Details</h4>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Student Name</label> <input
										type="text" class="form-control" name="schoolName"
										value="${user.fullName}" readonly />
								</div>						
								
								<div class="col-md-6 mb-3">
									<label class="form-label">School Name</label> <input
										type="text" class="form-control" name="schoolName"
										value="${user.school.schoolName}" readonly />
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">Skills</label>
									<input type="text" class="form-control" name="skills"
										placeholder="Enter your skills" required />
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">Interests</label>
									<input type="text" class="form-control" name="interests"
										placeholder="Enter your areas of interest" required />
								</div>
							</div>
													</div>

						<!-- Submit Button -->
						<div class="text-center">
							<button type="submit" class="btn btn-primary btn-lg">Submit Application</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript for form validation -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const today = new Date().toISOString().split("T")[0];
			document.getElementById("establishmentDate").value = today;
		});

		// Validate form on submit
		document.getElementById("studentApplicationForm").addEventListener("submit", function (e) {
			if (!this.checkValidity()) {
				e.preventDefault();
				alert("Please fill in all required fields.");
			}
		});
	</script>

	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const studentApplicationNavLink = document.querySelector(
				'a[href*="studentapplications/submit"]',
			);
			if (studentApplicationNavLink) {
				studentApplicationNavLink.classList.add("active");
			}
		});
	</script>
</body>
</html>
