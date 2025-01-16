<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error | TVPSS MIS</title>
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
      <%@ include file="/WEB-INF/views/css/sidebars.css" %>
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f8f9fa;
      }
      .error-container {
        text-align: center;
        max-width: 500px;
        background: white;
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .error-container h1 {
        font-size: 3rem;
        color: #dc3545;
      }
      .error-container p {
        font-size: 1.2rem;
        color: #6c757d;
      }
      .btn-dashboard {
        background-color: #007bff;
        color: white;
        font-size: 1rem;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
      }
      .btn-dashboard:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <div class="error-container">
      <h1><i class="fas fa-exclamation-triangle"></i> Error</h1>
      <p>${error}</p>
      <a href="${pageContext.request.contextPath}/dashboard/user" class="btn-dashboard">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
      </a>
    </div>
  </body>
</html>
