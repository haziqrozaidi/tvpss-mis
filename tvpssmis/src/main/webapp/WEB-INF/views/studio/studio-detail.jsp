<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Studio Details | TVPSS MIS</title>
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
			<div class="d-flex justify-content-between align-items-center mb-4">
				<div>
					<h1 class="mb-0">Studio Details</h1>
					<p class="text-muted mb-0">Studio: ${studio.studioName}</p>
				</div>
				<a href="${pageContext.request.contextPath}/studios"
					class="btn btn-secondary"> <i class="fas fa-arrow-left"></i>
					Back to Studios
				</a>
			</div>

			<!-- Studio Details -->
			<div class="card mb-4">
				<div class="card-body bg-light">
					<h5>Studio Information</h5>
					<div class="row">
						<div class="col-md-6">
							<p>
								<strong>Studio Name:</strong> ${studio.studioName}
							</p>
							<p>
								<strong>Level:</strong> ${studio.studioLevel}
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<strong>Location:</strong> ${studio.location}
							</p>
							<p>
								<strong>Size:</strong> ${studio.size} sq ft
							</p>
							<p>
								<strong>Status:</strong> <span
									class="badge 
                            <c:choose>
                                <c:when test="${studio.status == 'Operational'}">bg-success</c:when>
                                <c:when test="${studio.status == 'Pending'}">bg-warning</c:when>
                                <c:when test="${studio.status == 'Rejected'}">bg-danger</c:when>
                                <c:otherwise>bg-secondary</c:otherwise>
                            </c:choose>">${studio.status}</span>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Program Details -->
			<div class="card mb-4">
				<div class="card-body bg-light">
					<h5>Program Information</h5>
					<div class="row">
						<div class="col-md-6">
							<p>
								<strong>YouTube Channel:</strong> <a
									href="${program.youTubeChannelLink}" target="_blank">${program.youTubeChannelLink}</a>
							</p>
							<p>
								<strong>Establishment Date:</strong>
								${program.establishmentDate}
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<strong>Program Status:</strong> <span
									class="badge 
                            <c:choose>
                                <c:when test="${program.status == 'Active'}">bg-success</c:when>
                                <c:when test="${program.status == 'Inactive'}">bg-danger</c:when>
                                <c:otherwise>bg-warning</c:otherwise>
                            </c:choose>">${program.status}</span>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Conditionally Render Crew and Equipment Information -->
			<c:if test="${userRole != 'Student'}">
				<!-- Crew Details -->
				<div class="card mb-4">
					<div class="card-body bg-light">
						<h5>Crew Information</h5>
						<table class="table table-striped table-hover">
							<thead class="table-dark">
								<tr>
									<th>Name</th>
									<th>Role</th>
									<th>Contact</th>
									<th>Join Date</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty crewList}">
										<c:forEach var="crew" items="${crewList}">
											<tr>
												<td>${crew.user.fullName}</td>
												<td>${crew.role}</td>
												<td>${crew.user.contactNumber}</td>
												<td>${crew.joinDate}</td>
												<td><span
													class="badge 
                                                <c:choose>
                                                    <c:when test="${crew.status == 'Active'}">bg-success</c:when>
                                                    <c:when test="${crew.status == 'Inactive'}">bg-danger</c:when>
                                                </c:choose>">${crew.status}</span>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" class="text-center">No crew members
												found for this studio</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Equipment Details -->
				<div class="card mb-4">
					<div class="card-body bg-light">
						<h5>Equipment Information</h5>
						<table class="table table-striped table-hover">
							<thead class="table-dark">
								<tr>
									<th>Equipment Name</th>
									<th>Type</th>
									<th>Quantity</th>
									<th>Status</th>
									<th>Purchase Date</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty equipmentList}">
										<c:forEach var="equipment" items="${equipmentList}">
											<tr>
												<td>${equipment.equipmentName}</td>
												<td>${equipment.equipmentType}</td>
												<td>${equipment.quantity}</td>
												<td>${equipment.status}</td>
												<td>${equipment.purchaseDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" class="text-center">No equipment found
												for this studio</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
		</div>

	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const equipmentNavLink = document.querySelector(
        'a[href*="studios"]',
        );
        if (equipmentNavLink) {
            equipmentNavLink.classList.add("active");
        }
      });
    </script>
</body>

</html>
