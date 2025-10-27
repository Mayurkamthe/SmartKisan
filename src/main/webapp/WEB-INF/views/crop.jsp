<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smartkisan.model.Crop"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Crop Information</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800 p-6">

	<h1 class="text-3xl font-bold mb-6">Crop Information</h1>

	<section id="crop-grid"
		class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

		<%
    List<Crop> crops = (List<Crop>) request.getAttribute("crops");
    for (Crop crop : crops) {
%>
		<div class="card p-6 bg-white shadow-md rounded-xl relative"
			data-crop-name="<%= crop.getName() %>">
			<div class="absolute top-3 right-3">
				<button class="text-gray-400 hover:text-red-500 transition-colors">
					<i data-lucide="trash-2" class="w-5 h-5"></i>
				</button>
			</div>
			<h3 class="text-xl font-semibold text-gray-900 mb-3"><%= crop.getName() %></h3>
			<div class="space-y-3 text-gray-700">
				<p>
					<strong>Sowing Season:</strong>
					<%= crop.getSowingSeason() %></p>
				<p>
					<strong>Ideal Soil Type:</strong>
					<%= crop.getSoilType() %></p>
				<p>
					<strong>Water Needs:</strong>
					<%= crop.getWaterNeeds() %></p>
				<p>
					<strong>Common Pests:</strong>
					<%= crop.getPests() %></p>
			</div>
		</div>
		<%
    }
%>

	</section>

</body>
</html>
