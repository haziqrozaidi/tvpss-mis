<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Content Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Sidebar -->
    <style><%@include file="/WEB-INF/views/css/sidebarsxnavbar.css"%></style>
    <style><%@include file="/WEB-INF/views/css/sidebars.css"%></style>
    <!-- Icon Scout -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>

<body>
    <!-- Sidebar and Header code remains unchanged -->

    <div class="container">
        <header>
            <nav class="navbar">
                <div class="nav-section nav-left">
                    <button class="nav-button menu-button">
                        <i class="uil uil-bars"></i>
                    </button>
                    <a href="#" class="nav-logo">
                        <img src="img/Group 1.png" alt="logo" class="logo-image">
                        <h2 class="logo-text"></h2>
                    </a>
                </div>

                <div class="nav-section nav-center">
                    <form action="#" class="search-form">
                        <input type="search" placeholder="Search" required class="search-input">
                        <button class="nav-button search-button">
                            <i class="uil uil-search"></i>
                        </button>
                    </form>
                </div>

                <div class="nav-section nav-right">
                    <button class="nav-button upload-button">
                        <i class="uil uil-cloud-upload"></i>
                    </button>
                    <img src="img/profile.png" alt="logo" class="user-image">
                </div>
            </nav>
        </header>

        <div class="content-container">
            <h1>Manage Content</h1>
            <div class="tabs">
                <button class="tab active">All Content</button>
                <button class="tab">Media</button>
                <button class="tab">Journalism</button>
                <button class="tab">Hosting</button>
                <button class="tab">No Type</button>
            </div>

            <table class="content-table">
                <thead>
                    <tr>
                        <th>Content List</th>
                        <th>Content Category</th>
                        <th>Content Type</th>
                        <th>Date Uploaded</th>
                        <th>Details</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="content" items="${contentList}">
                        <tr>
                            <td>
                                <div class="content-item">
                                    <div class="thumbnail"></div>
                                    <div>
                                        <p class="content-title">${content.title}</p>
                                        <p class="content-description">${content.description}</p>
                                    </div>
                                </div>
                            </td>
                            <td>${content.category}</td>
                            <td>Media</td>
                            <td>${content.uploadDate}</td>
                            <td>
                                <div class="dropdown">
                                    <button class="details-button">
                                        <i class="uil uil-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-content">
                                        <a href="UpdateContentInformation.html?id=${content.id}">Edit</a>
                                        <a href="#" onclick="deleteContent(${content.id})">Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function deleteContent(contentId) {
            if (confirm('Are you sure you want to delete this content?')) {
                window.location.href = '/tvpssmis/content/delete?id=' + contentId;
            }
        }
    </script>

</body>

</html>
