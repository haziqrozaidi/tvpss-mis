<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Studio Information | TVPSS MIS</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome for icons -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      rel="stylesheet"
    />
    <style>
      <%@include file="/WEB-INF/views/css/sidebars.css"%>
    </style>
  </head>
  <body>
	<div class="d-flex" style="min-height: 100vh">
		<!-- Sidebar Include -->
		<%@ include file="/WEB-INF/views/fragments/sidebar.jsp"%>
		<div class="container-fluid p-4">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<div>
					<h1 class="mb-0">Studio Information</h1>
				</div>
			</div>

			<div class="row">
				<div class="container-fluid">
					<div>
						<table class="table table-striped table-hover">
							<thead class="table-dark">
								<tr>
									<th>Studio Name</th>
									<th>Studio Level</th>
									<th>Studio Location</th>
									<th>Size (sq ft)</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when
										test="${role.roleId == 1 || role.roleId == 4 || role.roleId == 5}">
										<!-- JPNJ, PPD, Admin View -->
										<c:if test="${not empty studios}">
											<c:forEach var="studio" items="${studios}">
												<tr>
													<td>${studio.studioName}</td>
													<td>${studio.studioLevel}</td>
													<td>${studio.location}</td>
													<td>${studio.size}</td>
													<td><span
														class="badge 
                                <c:choose>
                                    <c:when test="${studio.status == 'Operational'}">bg-success</c:when>
                                    <c:when test="${studio.status == 'Pending'}">bg-warning</c:when>
                                    <c:when test="${studio.status == 'Rejected'}">bg-danger</c:when>
                                    <c:otherwise>bg-secondary</c:otherwise>
                                </c:choose>">
															${studio.status} </span></td>
													<td>
														<!-- Status Update Form --> <c:if
															test="${studio.status == 'Operational' && (role.roleId == 4 || role.roleId == 5)}">
															<form
																action="${pageContext.request.contextPath}/studios/updateStatus"
																method="post" style="display: inline;">
																<input type="hidden" name="studioId"
																	value="${studio.studioId}" /> <select name="status"
																	class="form-select form-select-sm d-inline"
																	style="width: auto;" required>
																	<option value="Operational" selected>Operational</option>
																	<option value="Discontinued">Discontinued</option>
																</select>
																<button type="submit" class="btn btn-sm btn-primary">
																	Update</button>
															</form>
														</c:if> <a
														href="${pageContext.request.contextPath}/studios/${studio.studioId}/details"
														class="btn btn-sm btn-info"> <i class="fas fa-eye"></i>
													</a> <!-- Delete Button --> <c:if
															test="${studio.status == 'Discontinued' || studio.status == 'Rejected' || studio.status == 'Pending'}">
															<form
																action="${pageContext.request.contextPath}/studios/delete"
																method="post" style="display: inline;">
																<input type="hidden" name="studioId"
																	value="${studio.studioId}" />
																<button type="submit" class="btn btn-sm btn-danger"
																	onclick="return confirm('Are you sure you want to delete this studio?');">
																	<i class="fas fa-trash-alt"></i> Delete
																</button>
															</form>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<!-- Additional teacher and student logic remains unchanged -->
									</c:when>
									 <c:when test="${role.roleId == 2 || role.roleId == 3}">
            <!-- Teacher and Student View -->
            <c:if test="${hasStudiosForSchool}">
                <c:forEach var="studio" items="${studios}">
                    <c:if test="${studio.program.school.schoolId == user.school.schoolId}">
                        <tr>
                            <td>${studio.studioName}</td>
                            <td>${studio.studioLevel}</td>
                            <td>${studio.location}</td>
                            <td>${studio.size}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${studio.status == 'Operational'}">bg-success</c:when>
                                        <c:when test="${studio.status == 'Pending'}">bg-warning</c:when>
                                        <c:when test="${studio.status == 'Rejected'}">bg-danger</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>">
                                    ${studio.status}
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/studios/${studio.studioId}/details" class="btn btn-sm btn-info">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty studios || !hasStudiosForSchool}">
                <tr>
                    <td colspan="6" class="text-center">No studios found for your school</td>
                </tr>
            </c:if>
        </c:when>

        <c:otherwise>
            <tr>
                <td colspan="6" class="text-center text-danger">You are not authorized to view this page.</td>
            </tr>
        </c:otherwise>
								</c:choose>
							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
      document.addEventListener("DOMContentLoaded", function () {
        const equipmentNavLink = document.querySelector(
          'a[href="/tvpssmis/equipment/dashboard"]',
        );
        if (equipmentNavLink) {
          equipmentNavLink.classList.add("active");
        }
      });
    </script>
</body>
</html>
