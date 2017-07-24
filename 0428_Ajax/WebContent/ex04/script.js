var tableData = [
				{"name":"우유","price":"1000"},
				{"name":"음료수","price":"1200"},
				{"name":"커피","price":"500"},
				{"name":"차","price":"1500"},
				];

var table = "<table>";
table += "<thead><tr><th>제품</th><th>가격</th></tr></thead>";
table += "<tbody>";
$.each(tableData,function(data){
	table += "<tr><td>"+this["name"]+"</td><td>"+this["price"]+"</td></tr>";
});
table += "</tbody></table>";
$("#out").append(table);