<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Equipment Requests | TVPSS MIS</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-0">Equipment Requests</h1>
                <div class="d-flex gap-2">
                    <!-- Existing Back Button -->
                    <c:choose>
                        <c:when test="${role.roleName == 'Teacher'}">
                            <a href="${pageContext.request.contextPath}/equipment/studio?schoolId=${user.school.schoolId}" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Studio
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/equipment/dashboard" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Back to Dashboard
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <!-- Create Request Button -->
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createRequestModal">
                        <i class="fas fa-plus"></i> Create Request
                    </button>
                </div>
            </div>

            <!-- Requests Table -->
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>School</th>
                            <th>Equipment Name</th>
                            <th>Type</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Status</th>
                            <th>Request Date</th>
                            <th>Approval Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty equipmentRequests}">
                                <c:forEach var="request" items="${equipmentRequests}">
                                    <tr>
                                        <td>${request.studio.program.school.schoolName}</td>
                                        <td>${request.equipmentName}</td>
                                        <td>${request.equipmentType}</td>
                                        <td>${request.quantity}</td>
                                        <td>${request.price}</td>
                                        <td>
                                            <span class="badge bg-${request.status eq 'Pending' ? 'warning' : 
                                                                    request.status eq 'Approved' ? 'success' : 'danger'}">
                                                ${request.status}
                                            </span>
                                        </td>
                                        <td><fmt:formatDate value="${request.requestDate}" pattern="dd-MM-yyyy"/></td>
                                        <td><fmt:formatDate value="${request.approvalDate}" pattern="dd-MM-yyyy"/></td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" 
                                                        data-bs-target="#viewRequestModal${request.requestId}">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="13" class="text-center">No equipment requests found</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- View Request Modal -->
        <c:forEach var="request" items="${equipmentRequests}">
            <div class="modal fade" id="viewRequestModal${request.requestId}" tabindex="-1" 
                 aria-labelledby="viewRequestModalLabel${request.requestId}" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="viewRequestModalLabel${request.requestId}">
                                Request Details
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">School:</div>
                                <div class="col-8">${request.studio.program.school.schoolName}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Studio:</div>
                                <div class="col-8">${request.studio.studioName}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Equipment Name:</div>
                                <div class="col-8">${request.equipmentName}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Equipment Type:</div>
                                <div class="col-8">${request.equipmentType}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Quantity:</div>
                                <div class="col-8">${request.quantity}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Price:</div>
                                <div class="col-8">
                                    <fmt:formatNumber value="${request.price}" type="currency" currencySymbol="RM" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Link:</div>
                                <div class="col-8">
                                    <c:if test="${not empty request.link}">
                                        <a href="${request.link}" target="_blank">
                                            <i class="fas fa-external-link-alt"></i> View Link
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Request Reason:</div>
                                <div class="col-8">${request.requestReason}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Status:</div>
                                <div class="col-8">
                                    <span class="badge bg-${request.status eq 'Pending' ? 'warning' : 
                                                        request.status eq 'Approved' ? 'success' : 'danger'}">
                                        ${request.status}
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Request Date:</div>
                                <div class="col-8">
                                    <fmt:formatDate value="${request.requestDate}" pattern="dd-MM-yyyy"/>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Approval Date:</div>
                                <div class="col-8">
                                    <fmt:formatDate value="${request.approvalDate}" pattern="dd-MM-yyyy"/>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Remarks:</div>
                                <div class="col-8">${request.remarks}</div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <!-- Add Create Request Modal - Add this before the closing </div> of the main container -->
        <div class="modal fade" id="createRequestModal" tabindex="-1" aria-labelledby="createRequestModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createRequestModalLabel">Create Equipment Request</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/equipment/requests/create" method="POST">
                        <div class="modal-body">
                            <!-- Hidden School ID -->
                            <input type="hidden" name="schoolId" value="${user.school.schoolId}">
                            
                            <!-- Studio Selection -->
                            <div class="mb-3">
                                <label for="studioId" class="form-label">Studio</label>
                                <select class="form-select" id="studioId" name="studioId" required>
                                    <option value="">Select Studio</option>
                                    <c:forEach var="studio" items="${studios}">
                                        <option value="${studio.studioId}">${studio.studioName}</option>
                                    </c:forEach>
                                </select>
                            </div>
        
                            <!-- Equipment Name -->
                            <div class="mb-3">
                                <label for="equipmentName" class="form-label">Equipment Name</label>
                                <input type="text" class="form-control" id="equipmentName" name="equipmentName" required>
                            </div>
        
                            <!-- Equipment Type -->
                            <div class="mb-3">
                                <label for="equipmentType" class="form-label">Equipment Type</label>
                                <select class="form-select" id="equipmentType" name="equipmentType" required>
                                    <option value="">Select Type</option>
                                    <option value="Camera">Camera</option>
                                    <option value="Audio">Audio</option>
                                    <option value="Lighting">Lighting</option>
                                    <option value="Computer">Computer</option>
                                    <option value="Accessories">Accessories</option>
                                    <option value="Others">Others</option>
                                </select>
                            </div>
        
                            <!-- Quantity -->
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                            </div>
        
                            <!-- Price -->
                            <div class="mb-3">
                                <label for="price" class="form-label">Price (RM)</label>
                                <input type="number" class="form-control" id="price" name="price" min="0" step="0.01" required>
                            </div>
        
                            <!-- Link -->
                            <div class="mb-3">
                                <label for="link" class="form-label">Reference Link (Optional)</label>
                                <input type="url" class="form-control" id="link" name="link">
                            </div>
        
                            <!-- Request Reason -->
                            <div class="mb-3">
                                <label for="requestReason" class="form-label">Request Reason</label>
                                <textarea class="form-control" id="requestReason" name="requestReason" rows="3" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit Request</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Set active nav item
        document.addEventListener("DOMContentLoaded", function () {
          const equipmentNavLink = document.querySelector(
          		'a[href*="/tvpssmis/equipment/studio"]',
          );
          if (equipmentNavLink) {
            	equipmentNavLink.classList.add("active");
          }
        });
    </script>
</body>
</html>
