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
            <button
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#addEquipmentModal"
            >
              <i class="fas fa-plus"></i> Add Equipment
            </button>
          </div>
        </div>
        
        <div class="card mb-4">
          <div class="card-body bg-light">
            <h5>Resource Summary</h5>
            <div class="row">
              <div class="col-md-6">
                <p><strong>Total Equipment Types:</strong> ${totalEquipmentTypes}</p>
                <p><strong>Total Equipment Pieces:</strong> ${totalEquipmentPieces}</p>
              </div>
              <div class="col-md-6">
                <p><strong>Last Updated:</strong> ${lastUpdated}</p>
                <p>
                  <strong>Condition Status:</strong>
                  <span class="badge bg-success">${conditionStatus}</span>
                </p>
              </div>
            </div>
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
                    <th>Actions</th>
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
                          <td>
                            <span class="badge 
                              <c:choose>
                                <c:when test="${equipment.status == 'Excellent'}">bg-success</c:when>
                                <c:when test="${equipment.status == 'Good'}">bg-success</c:when>
                                <c:when test="${equipment.status == 'Average'}">bg-warning</c:when>
                                <c:when test="${equipment.status == 'Poor'}">bg-danger</c:when>
                              </c:choose>">
                              ${equipment.status}
                            </span>
                          </td>
                          <td>${equipment.purchaseDate}</td>
                          <td>
                            <div class="btn-group" role="group">
                              <button
                                class="btn btn-sm btn-warning"
                                data-bs-toggle="modal"
                                data-bs-target="#editEquipmentModal${equipment.equipmentId}"
                              >
                                <i class="fas fa-edit"></i>
                              </button>
                              <form
                                action="${pageContext.request.contextPath}/equipment/delete"
                                method="post"
                                style="display: inline"
                              >
                                <input type="hidden" name="equipmentId" value="${equipment.equipmentId}" />
                                <button
                                  type="submit"
                                  class="btn btn-sm btn-danger"
                                  onclick="return confirm('Are you sure you want to delete this equipment?');"
                                >
                                  <i class="fas fa-trash-alt"></i>
                                </button>
                              </form>
                            </div>
                          </td>
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
    
    <!-- Edit Equipment Modal -->
    <c:forEach var="equipment" items="${equipmentList}">
      <div
        class="modal fade"
        id="editEquipmentModal${equipment.equipmentId}"
        tabindex="-1"
        aria-labelledby="editEquipmentModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editEquipmentModalLabel">
                Edit Equipment
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <form
                action="${pageContext.request.contextPath}/equipment/update"
                method="post"
              >
                <input
                  type="hidden"
                  name="equipmentId"
                  value="${equipment.equipmentId}"
                />
                <div class="mb-3">
                  <label for="equipmentName" class="form-label"
                    >Equipment Name</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    id="equipmentName"
                    name="equipmentName"
                    value="${equipment.equipmentName}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="equipmentType" class="form-label">Type</label>
                  <input
                    type="text"
                    class="form-control"
                    id="equipmentType"
                    name="equipmentType"
                    value="${equipment.equipmentType}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="quantity" class="form-label">Quantity</label>
                  <input
                    type="number"
                    class="form-control"
                    id="quantity"
                    name="quantity"
                    value="${equipment.quantity}"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="status" class="form-label">Status</label>
                  <select
                    class="form-select"
                    id="status"
                    name="status"
                    required
                  >
                    <option value="Excellent" ${equipment.status == 'Excellent' ? 'selected' : ''}>Excellent</option>
                    <option value="Good" ${equipment.status == 'Good' ? 'selected' : ''}>Good</option>
                    <option value="Average" ${equipment.status == 'Average' ? 'selected' : ''}>Average</option>
                    <option value="Poor" ${equipment.status == 'Poor' ? 'selected' : ''}>Poor</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="purchaseDate" class="form-label">Purchase Date</label>
                  <input
                    type="date"
                    class="form-control"
                    id="purchaseDate"
                    name="purchaseDate"
                    value="${equipment.purchaseDate}"
                    required
                  />
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    Close
                  </button>
                  <button type="submit" class="btn btn-primary">
                    Save changes
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    
    <!-- Add Equipment Modal -->
    <div
      class="modal fade"
      id="addEquipmentModal"
      tabindex="-1"
      aria-labelledby="addEquipmentModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addEquipmentModalLabel">Add Equipment</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form
              action="${pageContext.request.contextPath}/equipment/add"
              method="post"
            >
              <input type="hidden" name="studioId" value="${studio.studioId}" />
              <div class="mb-3">
                <label for="newEquipmentName" class="form-label"
                  >Equipment Name</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="newEquipmentName"
                  name="equipmentName"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="newEquipmentType" class="form-label">Type</label>
                <input
                  type="text"
                  class="form-control"
                  id="newEquipmentType"
                  name="equipmentType"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="newQuantity" class="form-label">Quantity</label>
                <input
                  type="number"
                  class="form-control"
                  id="newQuantity"
                  name="quantity"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="newStatus" class="form-label">Status</label>
                <select
                  class="form-select"
                  id="newStatus"
                  name="status"
                  required
                >
                  <option value="Excellent">Excellent</option>
                  <option value="Good">Good</option>
                  <option value="Average">Average</option>
                  <option value="Poor">Poor</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="newPurchaseDate" class="form-label"
                  >Purchase Date</label
                >
                <input
                  type="date"
                  class="form-control"
                  id="newPurchaseDate"
                  name="purchaseDate"
                  required
                />
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  Close
                </button>
                <button type="submit" class="btn btn-primary">Add Equipment</button>
              </div>
            </form>
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
