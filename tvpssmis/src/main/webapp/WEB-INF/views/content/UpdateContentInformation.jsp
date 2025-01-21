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
    <%@ include file="/WEB-INF/views/css/sidebarsxnavbar.css"%>
    <!-- Icon Scout -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>

<body>
     
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

            <main class="content-container">
                <h1>Edit Content</h1>
                <form class="edit-form">
                    <!-- Content Title -->
                    <div class="form-field">
                        <label for="content-title">Content Title</label>
                        <input type="text" id="content-title" placeholder="Enter content title">
                    </div>

                    <!-- Content Description -->
                    <div class="form-field">
                        <label for="content-description">Content Description</label>
                        <textarea id="content-description" placeholder="Enter content description"></textarea>
                    </div>

                    <!-- Content Category -->
                    <div class="form-field">
                        <label for="content-category">Content Category</label>
                        <select id="content-category">
                            <option value="sports">Sports</option>
                            <option value="english">English</option>
                            <option value="technology">Technology</option>
                            <option value="journalism">Journalism</option>
                        </select>
                    </div>

                    <!-- Content Type -->
                    <div class="form-field">
                        <label for="content-type">Content Type</label>
                        <select id="content-type">
                            <option value="media">Media</option>
                            <option value="journalism">Journalism</option>
                            <option value="hosting">Hosting</option>
                        </select>
                    </div>

                    <!-- Content Thumbnail -->
                    <div class="upload-section">
                        <label for="content-thumbnail">Thumbnail (Upload Image)</label>
                        <input type="file" id="content-thumbnail">
                        <div class="thumbnail-preview"></div>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-buttons">
                        <button type="submit">Save Changes</button>
                        <button type="button" class="cancel-button" onclick="window.history.back()">Cancel</button>
                    </div>
                </form>
            </main>
        </div>

</body>

</html>