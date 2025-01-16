<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Application Form</title>
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
		<%@ include file="/WEB-INF/views/fragments/sidebar.jsp"%>

        <div class="container py-4">
            <h1 class="mb-4">Student Application Form</h1>
            <form class="row g-3">
                <!-- Applicant Name -->
                <div class="col-md-6">
                    <label for="applicant-name" class="form-label">Applicant Name</label>
                    <input type="text" id="applicant-name" class="form-control" placeholder="Enter your name">
                </div>

                <!-- Email Address -->
                <div class="col-md-6">
                    <label for="email-address" class="form-label">Email Address</label>
                    <input type="email" id="email-address" class="form-control" placeholder="Enter your email">
                </div>

                <!-- Phone Number -->
                <div class="col-md-6">
                    <label for="phone-number" class="form-label">Phone Number</label>
                    <input type="tel" id="phone-number" class="form-control" placeholder="Enter your phone number">
                </div>

                <!-- Home Address -->
                <div class="col-md-6">
                    <label for="home-address" class="form-label">Home Address</label>
                    <input type="text" id="home-address" class="form-control" placeholder="Enter your address">
                </div>

                <!-- School Name -->
                <div class="col-md-6">
                    <label for="school-name" class="form-label">School Name</label>
                    <input type="text" id="school-name" class="form-control" placeholder="Enter school name">
                </div>

                <!-- School Region -->
                <div class="col-md-6">
                    <label for="school-region" class="form-label">School Region</label>
                    <input type="text" id="school-region" class="form-control" placeholder="Enter school region">
                </div>

                <!-- School Address -->
                <div class="col-12">
                    <label for="school-address" class="form-label">School Address</label>
                    <input type="text" id="school-address" class="form-control" placeholder="Enter school address">
                </div>

                <!-- Applicant Photo Upload -->
                <div class="col-12">
                    <label for="applicant-photo" class="form-label">Applicant Photo</label>
                    <input type="file" id="applicant-photo" class="form-control">
                </div>

                <!-- Form Actions -->
                <div class="col-12 d-flex justify-content-between">
                    <button type="button" class="btn btn-danger" onclick="window.history.back()">Return</button>
                    <button type="submit" class="btn btn-primary">Submit Form</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
      document.addEventListener("DOMContentLoaded", function () {
        const studentNavLink = document.querySelector(
          'a[href="/tvpssmis/students/form"]',
        );
        if (studentNavLink) {
          studentNavLink.classList.add("active");
        }
      });
    </script>
</html>