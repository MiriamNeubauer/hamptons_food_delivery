// NICHT DIE FUNKTIONEN DIREKT CALLEN!!! s. KOMMENTAR IN ajax_example im application.js

function createTabs() {
	$( "#tabs" ).tabs();
};

function addRow(frm) {
	rowNum ++;
	var row = '<p id="rowNum'+rowNum+'">';
	row += '<select name="itemwrapper[item' + rowNum + '[item_type]]">';
	row += '<option value="appetizer">Appetizer</option>';
	row += '<option value="maincourse">Main Course</option>';
	row += '<option value="dessert">Dessert</option>';
	row += '<option value="beverage">Beverage</option>';
	row += '</select>';
	row += 'Choose item: <input type="text" name="itemwrapper[item' + rowNum + '[item_name]]"> Select quantity: <input type="text" name="itemwrapper[item' + rowNum + '[quantity]]"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';

	$('#itemRows').append($(row));
	// frm.add_qty.value = '';
	// frm.add_name.value = '';
};

function removeRow(rnum) {
	jQuery('#rowNum'+rnum).remove();
};

function mapCreator() {
		// #creates map for a given (1.argument in parentheses)latitude und (2.argument)longitude as well as zoom factor
		var map = L.map('map').setView([40.9378777, -72.3009158], 12);

		// #fügt die tile layer hinzu
		L.tileLayer('http://{s}.tile.cloudmade.com/6f0513128f874549b7128f69db6d0e95/997/256/{z}/{x}/{y}.png', {
		attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
		maxZoom: 18
		}).addTo(map);


		var businesses = gon.businesses;
						// // #das gibt uns alle der suche entsprechenden businesses (als array)
						// // var data = <%= @data.to_json.html_safe %>;

		for (var i=0 ; i < businesses.length; i++) {

				var marker = L.marker(businesses[i].coordinates).addTo(map);
					// <% @response["businesses"].each do |restaurant| %>
				marker.bindPopup("<b>" + businesses[i].name + "</b> <br>" + businesses[i].city).openPopup();
			};
}; 