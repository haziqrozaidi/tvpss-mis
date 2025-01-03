<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
        <h1 class="mb-4">Equipment Management</h1>

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
                  <tr>
                    <td>SMK Teknologi Media</td>
                    <td>Jalan Teknologi 123, Kuala Lumpur</td>
                    <td>+60 3-1234 5678</td>
                    <td>admin@smkteknologimedia.edu.my</td>
                    <td>
                      <a href="#" target="_blank" class="text-primary">
                        <i class="fab fa-youtube me-2"></i>View Channel
                      </a>
                    </td>
                    <td><span class="badge bg-success">Active</span></td>
                    <td>
                      <div class="btn-group" role="group">
                        <button
                          class="btn btn-sm btn-warning"
                          data-bs-toggle="modal"
                          data-bs-target="#editSchoolModal"
                        >
                          <i class="fas fa-edit"></i>
                        </button>
                        <button
                          class="btn btn-sm btn-info"
                          data-bs-toggle="modal"
                          data-bs-target="#viewSchoolModal"
                        >
                          <i class="fas fa-eye"></i>
                        </button>
                      </div>
                    </td>
                  </tr>
                  <!-- Add more rows as needed -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
