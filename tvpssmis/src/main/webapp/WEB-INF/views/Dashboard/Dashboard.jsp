<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard | TVPSS MIS</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
      <%@include file="/WEB-INF/views/css/sidebars.css"%>
    </style>
  </head>
  <body>
    <div class="d-flex" style="min-height: 100vh">
      <!-- Sidebar Include -->
      <%@ include file="/WEB-INF/views/fragments/sidebar.jsp" %>

      <div class="container-fluid p-4">
        <h1 class="mb-4">Dashboard</h1>

        <c:choose>
          <c:when test="${user.role.roleName == 'Teacher'}">
          <!-- Teacher Dashboard -->
            <div class="row mb-4">
              <div class="col-md-3">
                <div class="card text-white bg-primary">
                  <div class="card-body">
                    <h5 class="card-title">Total Studios</h5>
                    <p class="card-text"><c:out value="${totalStudios}" /></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card text-white bg-success">
                  <div class="card-body">
                    <h5 class="card-title">Total Equipment</h5>
                    <p class="card-text"><c:out value="${totalEquipment}" /></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card text-white bg-warning">
                  <div class="card-body">
                    <h5 class="card-title">Total Programs</h5>
                    <p class="card-text"><c:out value="${totalPrograms}" /></p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card text-white bg-info">
                  <div class="card-body">
                    <h5 class="card-title">Total Crew Members</h5>
                    <p class="card-text"><c:out value="${totalCrew}" /></p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Teacher Specific Data -->
            <div class="row">
              <div class="col-md-6">
                <h2 class="mb-4">Programs</h2>
                <table class="table table-striped table-hover">
                  <thead class="table-dark">
                    <tr>
                      <th>YouTube Channel</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="program" items="${programs}">
                      <tr>
                        <td>${program.youTubeChannelLink}</td>
                        <td>${program.status}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="col-md-6">
                <h2 class="mb-4">Crew Overview</h2>
                <table class="table table-striped table-hover">
                  <thead class="table-dark">
                    <tr>
                      <th>Name</th>
                      <th>Role</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="crew" items="${crewList}">
                      <tr>
                        <td>${crew.user.fullName}</td>
                        <td>${crew.role}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </c:when>
          <c:when test="${user.role.roleName == 'Student'}">
          <!-- Student Dashboard -->
            <div class="row">
              <div class="col-md-6">
                <h2 class="mb-4">Programs</h2>
                <table class="table table-striped table-hover">
                  <thead class="table-dark">
                    <tr>
                      <th>YouTube Channel</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="program" items="${programs}">
                      <tr>
                        <td>${program.youTubeChannelLink}</td>
                        <td>${program.status}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="col-md-6">
                <h2 class="mb-4">Application Status</h2>
                <table class="table table-striped table-hover">
                  <thead class="table-dark">
                    <tr>
                      <th>Application ID</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>

                      <tr>
                        <td>ApplicationID</td>
                        <td>Application Status</td>
                      </tr>

                  </tbody>
                </table>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
