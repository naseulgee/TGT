document.getElementById("togetherForm").style.display = "none";
	document.getElementById("placeForm").style.display = "none";
	document.getElementById("boardForm").style.display = "";

$("#tab_a").click(function() {
	document.getElementById("togetherForm").style.display = "none";
	document.getElementById("placeForm").style.display = "none";
	document.getElementById("boardForm").style.display = "";
});

$("#tab_b").click(function() {
	document.getElementById("boardForm").style.display = "none";
	document.getElementById("placeForm").style.display = "none";
	document.getElementById("togetherForm").style.display = "";
});

$("#tab_c").click(function() {
	document.getElementById("boardForm").style.display = "none";
	document.getElementById("togetherForm").style.display = "none";
	document.getElementById("placeForm").style.display = "";
});