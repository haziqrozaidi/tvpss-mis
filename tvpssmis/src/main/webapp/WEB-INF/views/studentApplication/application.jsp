<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Application Management | TVPSS MIS</title>
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
          <h1 class="mb-0">Application Management</h1>
          <a href="${pageContext.request.contextPath}/studentApplication/dashboard" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
          </a>
        </div>

        <div class="row">
          <div class="container-fluid">
            <div>
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>Application ID</th>
                    <th>Program ID</th>
                    <th>Apply Date</th>
                    <th>Interests</th>
                    <th>Skills</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty applications}">
                      <c:forEach var="application" items="${applications}">
                        <tr>
                          <td>${application.applicationId}</td>
                          <td>${application.programId}</td>
                          <td>${application.applyDate}</td>
                          <td>${application.interests}</td>
                          <td>${application.skills}</td>
                          <td>
                            <span
                              class="badge bg-${application.status == 'Accepted' ? 'success' : application.status == 'Rejected' ? 'danger' : 'warning'}"
                            >
                              ${application.status}
                            </span>
                          </td>
                          <td>
                            <div class="btn-group" role="group">
                              <form method="post" action="${pageContext.request.contextPath}/studentApplication/accept" style="display:inline;">
                                <input type="hidden" name="applicationId" value="${application.applicationId}" />
                                <button type="submit" class="btn btn-sm btn-success">
                                  <i class="fas fa-check"></i>
                                </button>
                              </form>
                              <form method="post" action="${pageContext.request.contextPath}/studentApplication/reject" style="display:inline;">
                                <input type="hidden" name="applicationId" value="${application.applicationId}" />
                                <button type="submit" class="btn btn-sm btn-danger">
                                  <i class="fas fa-times"></i>
                                </button>
                              </form>
                            </div>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="7" class="text-center">No applications found</td>
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
        const applicationNavLink = document.querySelector(
          'a[href="/tvpssmis/studentApplication/dashboard"]',
        );
        if (applicationNavLink) {
          applicationNavLink.classList.add("active");
        }
      });
    </script>
  </body>
</html>
