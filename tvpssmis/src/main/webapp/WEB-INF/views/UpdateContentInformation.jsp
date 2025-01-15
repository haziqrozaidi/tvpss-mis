<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Content Page</title>
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
            <h1>Edit Content</h1>
            <form class="edit-form" action="/tvpssmis/content/update" method="post">
                <input type="hidden" name="id" value="${content.id}">

                <!-- Content Title -->
                <div class="form-field">
                    <label for="content-title">Content Title</label>
                    <input type="text" id="content-title" name="title" value="${content.title}" required>
                </div>

                <!-- Content Description -->
                <div class="form-field">
                    <label for="content-description">Content Description</label>
                    <textarea id="content-description" name="description" required>${content.description}</textarea>
                </div>

                <!-- Content Category -->
                <div class="form-field">
                    <label for="content-category">Content Category</label>
                    <select id="content-category" name="category">
                        <option value="sports" <c:if test="${content.category == 'sports'}">selected</c:if>>Sports</option>
                        <option value="english" <c:if test="${content.category == 'english'}">selected</c:if>>English</option>
                        <option value="technology" <c:if test="${content.category == 'technology'}">selected</c:if>>Technology</option>
                        <option value="journalism" <c:if test="${content.category == 'journalism'}">selected</c:if>>Journalism</option>
                    </select>
                </div>

                <!-- Content Type -->
                <div class="form-field">
                    <label for="content-type">Content Type</label>
                    <select id="content-type" name="type">
                        <option value="media" <c:if test="${content.type == 'media'}">selected</c:if>>Media</option>
                        <option value="journalism" <c:if test="${content.type == 'journalism'}">selected</c:if>>Journalism</option>
                        <option value="hosting" <c:if test="${content.type == 'hosting'}">selected</c:if>>Hosting</option>
                    </select>
                </div>

                <!-- Form Actions -->
                <div class="form-buttons">
                    <button type="submit">Save Changes</button>
                    <button type="button" class="cancel-button" onclick="window.history.back()">Cancel</button>
                </div>
            </form>
        </div>
    </div>

</body>

</html>
