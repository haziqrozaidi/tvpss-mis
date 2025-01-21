<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Content Management | TVPSS MIS</title>
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
            <h1 class="mb-0">Content Management</h1>
          </div>
          <div class="d-flex gap-2">
            <c:if test="${role.roleName == 'Teacher'}">
              <!-- Updated Upload Content Button -->
              <a href="${pageContext.request.contextPath}/content/create" 
                 class="btn btn-secondary">
                  <i class="fas fa-arrow-right"></i> Upload Content
              </a>
            </c:if>
            <c:if test="${role.roleName != 'Teacher'}">
              <a href="${pageContext.request.contextPath}/content/school" 
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
                    <th>Video Link</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Upload Date</th>
                    <th>Category</th>
                    <th>Program</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${not empty contents}"> 
                      <c:forEach var="content" items="${contents}">
                        <tr>
                          <td>
                            <a href="${content.contentName}" target="_blank" class="btn btn-sm btn-link">
                              ${content.contentName}
                            </a>
                          </td>
                          <td>${content.title}</td>
                          <td>${content.description}</td>
                          <td>${content.date}</td>
                          <td>${content.category}</td>
                          <td>${content.program.school.schoolName}</td>
                          <td>
                            <a href="${pageContext.request.contextPath}/content/view?contentId=${content.content_id}"
                               class="btn btn-sm btn-info">
                              <i class="fas fa-eye"></i>
                            </a>

                            <c:if test="${role.roleName == 'Teacher'}">
                              <!-- Edit Button -->
                              <a href="${pageContext.request.contextPath}/content/edit/${content.content_id}" 
                                 class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i>
                              </a>
                              
                              <!-- Delete Button (Confirm before delete) -->
                              <form action="${pageContext.request.contextPath}/content/delete" 
                                    method="post" 
                                    style="display:inline;" 
                                    onsubmit="return confirm('Are you sure you want to delete this content?');">
                                <input type="hidden" name="content_id" value="${content.content_id}">
                                <button type="submit" class="btn btn-sm btn-danger">
                                  <i class="fas fa-trash-alt"></i>
                                </button>
                              </form>
                            </c:if>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="7" class="text-center">
                          No content found for this school
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
        const contentNavLink = document.querySelector(
          'a[href*="/tvpssmis/content/manage"]',
        );
        if (contentNavLink) {
          contentNavLink.classList.add("active");
        }

        const element = document.querySelector(
          'a[href*="content/dashboard"]',
        );
        if (element) {
          element.classList.add("active");
        }
      });
    </script>
  </body>
</html>
