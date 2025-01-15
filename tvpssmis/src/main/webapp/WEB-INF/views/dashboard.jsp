<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Resource Management - Dashboard | TVPSS</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">
<style><%@include file="/WEB-INF/views/css/sidebars.css"%></style>
<style>
.card-hover:hover {
	transform: scale(1.05);
	transition: transform 0.3s ease;
}
</style>
</head>
<body>
	<div class="d-flex" style="min-height: 100vh;">
		<!-- Sidebar Include -->
		<%@ include file="/WEB-INF/views/fragments/sidebar.jsp"%>

		<div class="container-fluid p-4">
			<h1 class="mb-4">Resource Management Dashboard</h1>

			<!-- Summary Cards -->
			<div class="row g-4 mb-4">
				<!-- Total Schools Card -->
				<div class="col-md-3">
					<div class="card bg-primary text-white card-hover">
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-uppercase mb-2">Total Schools</h6>
									<h2>8</h2>
								</div>
								<i class="fas fa-school fa-2x"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Active Programs Card -->
				<div class="col-md-3">
					<div class="card bg-success text-white card-hover">
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-uppercase mb-2">Active Programs</h6>
									<h2>4</h2>
								</div>
								<i class="fas fa-tv fa-2x"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Equipment Status Card -->
				<div class="col-md-3">
					<div class="card bg-warning text-white card-hover">
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-uppercase mb-2">Equipment Status</h6>
									<h2>85%</h2>
								</div>
								<i class="fas fa-tools fa-2x"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Schools Needing Support Card -->
				<div class="col-md-3">
					<div class="card bg-danger text-white card-hover">
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h6 class="text-uppercase mb-2">Schools Needing Support</h6>
									<h2>1</h2>
								</div>
								<i class="fas fa-exclamation-triangle fa-2x"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Resource Table -->
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">
						<i class="fas fa-table me-2"></i>School Resources Overview
					</h5>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>School Name</th>
									<th>Studio Level</th>
									<th>Equipment Status</th>
									<th>Active Crew</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>SMK Teknologi Sejahtera</td>
									<td>Level 3</td>
									<td><span class="badge bg-success">95%</span></td>
									<td>15</td>
									<td>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-info me-1">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn btn-sm btn-warning">
												<i class="fas fa-edit"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>SMK Media Kreatif</td>
									<td>Level 2</td>
									<td><span class="badge bg-warning">80%</span></td>
									<td>10</td>
									<td>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-info me-1">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn btn-sm btn-warning">
												<i class="fas fa-edit"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>SMK Komunikasi Maju</td>
									<td>Level 1</td>
									<td><span class="badge bg-danger">65%</span></td>
									<td>8</td>
									<td>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-info me-1">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn btn-sm btn-warning">
												<i class="fas fa-edit"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>SMK Informatika Unggul</td>
									<td>Level 3</td>
									<td><span class="badge bg-success">90%</span></td>
									<td>12</td>
									<td>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-info me-1">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn btn-sm btn-warning">
												<i class="fas fa-edit"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>SMK Broadcast Profesional</td>
									<td>Level 2</td>
									<td><span class="badge bg-warning">75%</span></td>
									<td>9</td>
									<td>
										<div class="btn-group" role="group">
											<button class="btn btn-sm btn-info me-1">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn btn-sm btn-warning">
												<i class="fas fa-edit"></i>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
