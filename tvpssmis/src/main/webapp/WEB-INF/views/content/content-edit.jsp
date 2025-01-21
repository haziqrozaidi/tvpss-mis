<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Content</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="d-flex" style="min-height: 100vh">
		<!-- Sidebar Include -->
		<%@ include file="/WEB-INF/views/fragments/sidebar.jsp"%>

		<div class="container mt-4">
			<h1>Edit Content</h1>
			<form action="${pageContext.request.contextPath}/content/update"
				method="post">
				<input type="hidden" name="content_id" value="${content.content_id}">

				<!-- Content Title -->
				<div class="form-group">
					<label for="content-title">Content Title</label> <input type="text"
						id="content-title" name="title" class="form-control"
						value="${content.title}" required>
				</div>

				<!-- Content Description -->
				<div class="form-group mt-3">
					<label for="content-description">Content Description</label>
					<textarea id="content-description" name="description"
						class="form-control" required>${content.description}</textarea>
				</div>

				<!-- Content Category -->
				<div class="form-group mt-3">
					<label for="content-category">Content Category</label> <select
						id="content-category" name="category" class="form-control"
						required>
						<option value="Event Coverage"
							${content.category == 'Event Coverage' ? 'selected' : ''}>Event
							Coverage</option>
						<option value="Education"
							${content.category == 'Education' ? 'selected' : ''}>Education</option>
						<option value="technology"
							${content.category == 'technology' ? 'selected' : ''}>Technology</option>
						<option value="journalism"
							${content.category == 'journalism' ? 'selected' : ''}>Journalism</option>
					</select>
				</div>

				<!-- Video URL (contentName) -->
				<div class="form-group mt-3">
					<label for="video-url">Video URL</label> <input type="text"
						id="video-url" name="contentName" class="form-control"
						value="${content.contentName}" required />
				</div>

				<!-- Program Selection -->
				<div class="form-group mt-3">
					<label for="programId">Program</label>
					<select id="programId" name="programId" class="form-control">
   			 			<option value="1">1 - SMK TamanDesaSkudaiTV</option>
    					<option value="2">2 - SMK TamanUniversitiTV</option>
    					<option value="3">3 - SMK BandarDato OnnTV</option>
    					<option value="4">4 - SMK TamanMolekTV</option>
    					<option value="5">5 - SMK TamanDayaTV</option>
					</select>
				</div>




				<!-- Form Actions -->
				<div class="form-buttons mt-4">
					<button type="submit" class="btn btn-primary">Save Changes</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.history.back()">Cancel</button>
				</div>
			</form>
		</div>
</body>
</html>
