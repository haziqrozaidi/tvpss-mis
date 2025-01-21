<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Approve Studios | TVPSS MIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        <h1 class="mb-4">Pending Application Approvals</h1>
        <table class="table table-striped table-hover">
          <thead class="table-dark">
            <tr>
              <th>Application ID</th>
                    <th>Program</th>
                    <th>Apply Date</th>
                    <th>Skills</th>
                    <th>Status</th>
                    <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:when test="${not empty applications}">
                 <c:forEach var="application" items="${applications}">
                    <tr>
                     <td>${application.application_Id}</td>
                     <td><a href= "${application.programID.youTubeChannelLink}" target=" blank">${application.programID.youTubeChannelLink}</a></td>
                     <td>${application.applyDate}</td>
                     <td>${application.skills}</td>
                     <td>
                      <form action="${pageContext.request.contextPath}/studentApplication/accept" method="post" class="d-inline">
                        <input type="hidden" name="application_Id" value="${application.application_Id}" />
                        <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">
                          Approve
                        </button>
                      </form>
                      <form action="${pageContext.request.contextPath}/studentApplication/reject" method="post" class="d-inline">
                        <input type="hidden" name="application_Id" value="${application.application_Id}" />
                        <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">
                          Reject
                        </button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5" class="text-center">No studios pending approval.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const equipmentNavLink = document.querySelector(
        	'a[href*="studios/approvals"]',
        );
        if (equipmentNavLink) {
            equipmentNavLink.classList.add("active");
        }
      });
    </script>
  </body>
</html>
