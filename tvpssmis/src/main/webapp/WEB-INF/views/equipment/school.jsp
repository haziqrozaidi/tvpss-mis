<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Equipment Management | TVPSS MIS</title>
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
          <h1 class="mb-0">Equipment Management</h1>
          <a href="${pageContext.request.contextPath}/equipment/dashboard" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
          </a>
        </div>

        <div class="row">
          <div class="container-fluid">
            <div>
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>School Name</th>
                    <th>School Address</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                    <th>YouTube Channel</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty schools}">
                      <c:forEach var="school" items="${schools}">
                        <tr>
                          <td>${school.schoolName}</td>
                          <td>${school.schoolAddress}</td>
                          <td>${school.contactNumber}</td>
                          <td>${school.email}</td>
                          <td>
                            <c:choose>
                              <c:when test="${not empty schoolPrograms[school.schoolId]}">
                                <a
                                  href="${schoolPrograms[school.schoolId].youTubeChannelLink}"
                                  target="_blank"
                                  class="btn btn-sm btn-link"
                                >
                                  View Channel
                                </a>
                              </c:when>
                              <c:otherwise>
                                <span class="text-muted">No channel linked</span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td>
                            <c:choose>
                              <c:when test="${not empty schoolPrograms[school.schoolId]}">
                                <span
                                  class="badge bg-${schoolPrograms[school.schoolId].status == 'Active' ? 'success' : 'warning'}"
                                >
                                  ${schoolPrograms[school.schoolId].status}
                                </span>
                              </c:when>
                              <c:otherwise>
                                <span class="badge bg-secondary">No Program</span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td>
                            <div class="btn-group" role="group">
                              <button
                                class="btn btn-sm btn-warning"
                                data-bs-toggle="modal"
                                data-bs-target="#editSchoolModal${school.schoolId}"
                              >
                                <i class="fas fa-edit"></i>
                              </button>
                              <a
                                href="${pageContext.request.contextPath}/equipment/studio?schoolId=${school.schoolId}"
                                class="btn btn-sm btn-info"
                              >
                                <i class="fas fa-eye"></i>
                              </a>
                            </div>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="7" class="text-center">No schools found</td>
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
          'a[href="/tvpssmis/equipment/dashboard"]',
        );
        if (equipmentNavLink) {
          equipmentNavLink.classList.add("active");
        }
      });
    </script>
  </body>
</html>
