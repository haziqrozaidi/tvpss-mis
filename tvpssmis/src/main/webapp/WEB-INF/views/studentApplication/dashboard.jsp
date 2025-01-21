<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Application Dashboard | TVPSS MIS</title>
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
        <h1 class="mb-4">Application Dashboard</h1>

        <div class="row mb-4">
          <div class="col-md-4">
            <div class="card text-white bg-primary">
              <div class="card-body">
                <h5 class="card-title">Total Applications</h5>
                <p class="card-text">
                  <c:out value="${totalApplications}" />
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-success">
              <div class="card-body">
                <h5 class="card-title">Accepted Applications</h5>
                <p class="card-text">
                  <c:out value="${acceptedApplications}" />
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-danger">
              <div class="card-body">
                <h5 class="card-title">Rejected Applications</h5>
                <p class="card-text">
                  <c:out value="${rejectedApplications}" />
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h2 class="mb-0">Application Summary</h2>
          <c:if test="${role.roleId == 1 || role.roleId == 4 || role.roleId == 5}">
          <a href="${pageContext.request.contextPath}/studentApplication/manage" class="btn btn-secondary">
            <i class="fas fa-arrow-right"></i> Manage Applications
          </a>
          </c:if>
        </div>

        <table class="table table-striped table-hover">
          <thead class="table-dark">
            <tr>
              <th>Application ID</th>
              <th>Program ID</th>
              <th>Apply Date</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty applications}">
              	<c:if test="${hasApplication}">
                <c:forEach var="application" items="${applications}">
                  <tr>
                    <td>${application.application_Id}</td>
                    <td><a href= "${application.programID.youTubeChannelLink}" target=" blank">${application.programID.youTubeChannelLink}</a></td>
                    <td>${application.applyDate}</td>
                    <td>
                      <span
                        class="badge bg-${application.status == 'Accepted' ? 'success' : application.status == 'Rejected' ? 'danger' : 'warning'}"
                      >
                        ${application.status}
                      </span>
                    </td>
                    <td>
                    	<c:if test="${application.status == 'Pending' || application.status == 'Rejected'}">
                    	<form
                    		action="${pageContext.request.contextPath}/dashboard/delete"
                    		method="post" style="display: inline;">
                    		<input type="hidden" name="application_id"
                    			value="${application.application_Id}" />
                    		<button type="submit" class="btn btn-sm btn-danger"
									onclick="return confirm('Are you sure you want to delete this application?');">
								<i class="fas fa-trash-alt"></i> Delete
							</button>
						</form>
						</c:if>
                    	
                  </tr>
                </c:forEach>
                </c:if>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="4" class="text-center">No applications found</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const applicationNavLink = document.querySelector(
          'a[href="/tvpssmis/application/dashboard"]',
        );
        if (applicationNavLink) {
          applicationNavLink.classList.add("active");
        }
      });
    </script>
  </body>
</html>