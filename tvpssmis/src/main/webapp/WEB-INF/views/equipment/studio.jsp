<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Studio Equipment Management | TVPSS MIS</title>
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
          <div>
            <h1 class="mb-0">Studio Equipment Management</h1>
            <p class="text-muted mb-0">School: ${school.schoolName}</p>
          </div>
          <div class="d-flex gap-2"> <!-- Added gap-2 for spacing between buttons -->
              <c:if test="${role.roleName == 'Teacher'}">
                <a href="${pageContext.request.contextPath}/equipment/requests/school" 
                   class="btn btn-secondary">
                    <i class="fas fa-arrow-right"></i> View Equipment Requests
                </a>
              </c:if>
              <c:if test="${role.roleName != 'Teacher'}">
                  <a href="${pageContext.request.contextPath}/equipment/school" 
                     class="btn btn-secondary">
                      <i class="fas fa-arrow-left"></i> Back to Schools
                  </a>
              </c:if>
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
                    <th>Program</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty studios}">
                      <c:forEach var="studio" items="${studios}">
                        <tr>
                          <td>${studio.studioName}</td>
                          <td>${studio.studioLevel}</td>
                          <td>${studio.location}</td>
                          <td>${studio.size}</td>
                          <td>
                            <span
                              class="badge bg-${studio.status == 'Operational' ? 'success' : 'warning'}"
                            >
                              ${studio.status}
                            </span>
                          </td>
                          <td>${studio.program.school.schoolName}</td>
                          <td>
                            <a
                              href="${pageContext.request.contextPath}/equipment/inventory?studioId=${studio.studioId}"
                              class="btn btn-sm btn-info"
                            >
                              <i class="fas fa-eye"></i>
                            </a>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="6" class="text-center">
                          No studios found for this school
                        </td>
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
        const equipmentNavLink = document.querySelector(
        	'a[href*="/tvpssmis/equipment/studio"]',
        );
        if (equipmentNavLink) {
          	equipmentNavLink.classList.add("active");
        }
        
        const element = document.querySelector(
        	'a[href*="equipment/dashboard"]',
        );
        if (element) {
        	element.classList.add("active");
        }
      });
    </script>
  </body>
</html>
