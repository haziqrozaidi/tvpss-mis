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

      <!-- Main Content Area -->
      <div class="container py-5">
        <h2>Create New Content</h2>

        <!-- Content Form -->
        <form action="${pageContext.request.contextPath}/content/save" method="post">
          <div class="mb-3">
            <label for="programId">Program</label>
				<select id="programId" name="programId" class="form-control">
   			 		<option value="1">1 - SMK TamanDesaSkudaiTV</option>
    				<option value="2">2 - SMK TamanUniversitiTV</option>
    				<option value="3">3 - SMK BandarDato OnnTV</option>
    				<option value="4">4 - SMK TamanMolekTV</option>
    				<option value="5">5 - SMK TamanDayaTV</option>
				</select>

          <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" id="title" name="title" class="form-control" required />
          </div>

          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" id="description" name="description" class="form-control" />
          </div>

          <div class="mb-3">
            <label for="video-url" class="form-label">Video URL</label>
            <input type="text" id="video-url" name="contentName" class="form-control" required />
          </div>

          <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <input type="text" id="category" name="category" class="form-control" />
          </div>

          <button type="submit" class="btn btn-primary">Upload Content</button>
        </form>
      </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
