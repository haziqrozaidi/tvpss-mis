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
                <div>
                    <a href="${pageContext.request.contextPath}/equipment/dashboard" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
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
                            <th>Link</th>
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
                                        <td><fmt:formatNumber value="${request.price}" type="currency" currencySymbol="RM" /></td>
                                        <td>
                                            <c:if test="${not empty request.link}">
                                                <a href="${request.link}" target="_blank" class="btn btn-sm btn-link">
                                                    <i class="fas fa-external-link-alt"></i> View
                                                </a>
                                            </c:if>
                                        </td>
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
                                                <button class="btn btn-sm btn-warning" data-bs-toggle="modal" 
                                                        data-bs-target="#editRequestModal${request.requestId}">
                                                    <i class="fas fa-edit"></i>
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
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Set active nav item
        document.addEventListener("DOMContentLoaded", function () {
            const equipmentNavLink = document.querySelector('a[href="/tvpssmis/equipment/dashboard"]');
            if (equipmentNavLink) {
                equipmentNavLink.classList.add("active");
            }
        });
    </script>
</body>
</html>
