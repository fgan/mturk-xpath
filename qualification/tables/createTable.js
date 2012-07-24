$(document).ready(function() {
	var header = "<tr>";
	var markup = "<tr>";
	for (key in data[0]) {
	    header += "<th>" + key + "</th>"
	    markup += "<td>${" + key + "}</td>";
	}
	header += "</tr>"
	markup += "</tr>";
	$.template('dataTemplate', markup);
	
	$('#dataTable').html(header);
	$.tmpl('dataTemplate', data).appendTo('#dataTable');
});