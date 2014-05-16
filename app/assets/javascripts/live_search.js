$("#big-search-box").bind("keyup", function() {
	$("#big-search-box").addClass("loading"); //adiciona o spinner

	var form = $("#live-search-form"); // pega o form wrapping a search bar

	var url = "/tasks/live_search"; // live_search action

	var formData = form.serialize(); // pega os dados no form

	$.get(url,formData, function(html) { // faz um ajax get

		$("#big-search-box").removeClass("loading"); // oculta o spinner

		$("live-search-results").html(html); // substitui o "results" div com os resultados

	});


});