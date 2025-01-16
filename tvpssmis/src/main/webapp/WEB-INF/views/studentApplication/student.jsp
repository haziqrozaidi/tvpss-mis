<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Applicaton Management | TVPSS MIS</title>
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
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h1 class="mb-0">Student Management</h1>
          <a href="${pageContext.request.contextPath}/students/dashboard" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
          </a>
        </div>

        <div class="row">
          <div class="container-fluid">
            <div>
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>Student Name</th>
                    <th>Student Address</th>
                    <th>Contact Number</th>
                    <th>Email Address</th>
                    <th>Date of Joining</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty students}">
                      <c:forEach var="student" items="${students}">
                        <tr>
                          <td>${student.name}</td>
                          <td>${student.address}</td>
                          <td>${student.contactNumber}</td>
                          <td>${student.email}</td>
                          <td>${student.dateOfJoining}</td>
                          <td>
                            <c:choose>
                              <c:when test="${student.crewStatus == 'Active'}">
                                <span class="badge bg-success">Active</span>
                              </c:when>
                              <c:when test="${student.crewStatus == 'Inactive'}">
                                <span class="badge bg-warning">Inactive</span>
                              </c:when>
                              <c:otherwise>
                                <span class="badge bg-secondary">Not a Crew</span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="6" class="text-center">No students found</td>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const studentNavLink = document.querySelector(
          'a[href="/tvpssmis/students/dashboard"]',
        );
        if (studentNavLink) {
          studentNavLink.classList.add("active");
        }
      });
    </script>
</body>
</html>