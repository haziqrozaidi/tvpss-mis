<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard | TVPSS MIS</title>
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
      <%@ include file="/WEB-INF/views/fragments/sidebar.jsp" %>

      <div class="container-fluid p-4">
        <h1 class="mb-4">Dashboard</h1>
        <div class="row mb-4">
          <div class="col-md-4">
            <div class="card text-white bg-primary">
              <div class="card-body">
                <h5 class="card-title">Total Schools</h5>
                <p class="card-text">
                  <c:out value="${totalSchools}" />
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-success">
              <div class="card-body">
                <h5 class="card-title">Total Studios</h5>
                <p class="card-text">
                  <c:out value="${totalStudios}" />
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-warning">
              <div class="card-body">
                <h5 class="card-title">Total Equipment Items</h5>
                <p class="card-text">
                  <c:out value="${totalEquipment}" />
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="container-fluid">
            <h2 class="mb-4">Schools Overview</h2>
            <table class="table table-striped table-hover">
              <thead class="table-dark">
                <tr>
                  <th>School Name</th>
                  <th>Number of Studios</th>
                  <th>Number of Equipment Items</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${not empty schoolOverview}">
                    <c:forEach var="school" items="${schoolOverview}">
                      <tr>
                        <td>${school.schoolName}</td>
                        <td>${school.numStudios}</td>
                        <td>${school.numEquipment}</td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="3" class="text-center">No data available</td>
                    </tr>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
