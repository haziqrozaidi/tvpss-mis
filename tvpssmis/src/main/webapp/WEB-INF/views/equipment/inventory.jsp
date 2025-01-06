<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Studio Equipment Inventory | TVPSS MIS</title>
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
            <h1 class="mb-0">Studio Equipment Inventory</h1>
            <p class="text-muted mb-0">Studio: ${studio.studioName}</p>
          </div>
          <div>
            <a
              href="${pageContext.request.contextPath}/equipment/studio?schoolId=${studio.program.school.schoolId}"
              class="btn btn-secondary"
            >
              <i class="fas fa-arrow-left"></i> Back to Studio
            </a>
          </div>
        </div>

        <div class="row">
          <div class="container-fluid">
            <div>
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>Equipment Name</th>
                    <th>Type</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Purchase Date</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty equipmentList}">
                      <c:forEach var="equipment" items="${equipmentList}">
                        <tr>
                          <td>${equipment.equipmentName}</td>
                          <td>${equipment.equipmentType}</td>
                          <td>${equipment.quantity}</td>
                          <td>${equipment.status}</td>
                          <td>${equipment.purchaseDate}</td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="5" class="text-center">
                          No equipment found for this studio
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
          'a[href="/tvpssmis/resources/equipment"]',
        );
        if (equipmentNavLink) {
          equipmentNavLink.classList.add("active");
        }
      });
    </script>
  </body>
</html>
