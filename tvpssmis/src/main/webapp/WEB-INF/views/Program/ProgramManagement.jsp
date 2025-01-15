<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Program Management | TVPSS MIS</title>
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
        <%@ include file="/WEB-INF/views/fragments/sidebar.jsp" %>

        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="mb-0">Program Management</h1>
                    <p class="text-muted mb-0">Manage all programs under your school</p>
                </div>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProgramModal">
                    <i class="fas fa-plus"></i> Add Program
                </button>
            </div>

            <!-- Program List -->
            <div class="card mb-4">
                <div class="card-body bg-light">
                    <h5>Available Programs</h5>
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>YouTube Channel</th>
                                <th>Establishment Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty programs}">
                                    <c:forEach var="program" items="${programs}">
                                        <tr>
                                            <td>
                                                <a href="${program.youTubeChannelLink}" target="_blank">${program.youTubeChannelLink}</a>
                                            </td>
                                            <td>${program.establishmentDate}</td>
                                            <td>${program.status}</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editProgramModal${program.programId}">
                                                    Edit
                                                </button>
                                                <form action="${pageContext.request.contextPath}/program/delete" method="post" style="display: inline;">
                                                    <input type="hidden" name="programId" value="${program.programId}" />
                                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this program?');">
                                                        Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" class="text-center">No programs found</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Program Modal -->
	<div class="modal fade" id="addProgramModal" tabindex="-1"
		aria-labelledby="addProgramModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProgramModalLabel">Add New
						Program</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/program/add"
						method="post">
						<div class="mb-3">
							<label for="youTubeChannelLink" class="form-label">YouTube
								Channel Link</label> <input type="url" class="form-control"
								id="youTubeChannelLink" name="youTubeChannelLink" required />
						</div>
						<div class="mb-3">
							<label for="establishmentDate" class="form-label">Establishment
								Date</label> <input type="date" class="form-control"
								id="establishmentDate" name="establishmentDate" required />
						</div>
						<div class="mb-3">
							<label for="status" class="form-label">Status</label> <select
								class="form-select" id="status" name="status" required>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Add
								Program</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- Edit Program Modal -->
    <c:forEach var="program" items="${programs}">
        <div class="modal fade" id="editProgramModal${program.programId}" tabindex="-1" aria-labelledby="editProgramModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editProgramModalLabel">Edit
							Program</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/program/update"
							method="post">
							<input type="hidden" name="programId"
								value="${program.programId}" />
							<div class="mb-3">
								<label for="youTubeChannelLink${program.programId}"
									class="form-label">YouTube Channel Link</label> <input
									type="url" class="form-control"
									id="youTubeChannelLink${program.programId}"
									name="youTubeChannelLink" value="${program.youTubeChannelLink}"
									required />
							</div>
							<div class="mb-3">
								<label for="establishmentDate${program.programId}"
									class="form-label">Establishment Date</label> <input
									type="date" class="form-control"
									id="establishmentDate${program.programId}"
									name="establishmentDate" value="${program.establishmentDate}"
									required />
							</div>
							<div class="mb-3">
								<label for="status${program.programId}" class="form-label">Status</label> <input
									type="text" class="form-control" id="status${program.programId}" name="status"
									value="${program.status}" required />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									Changes</button>
							</div>
						</form>
					</div>
				</div>
            </div>
        </div>
    </c:forEach>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
