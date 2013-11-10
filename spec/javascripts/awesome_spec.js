// #we did this along githaub konacah docu - readme file
//= require spec_helper
//= require (name of file that we are testing)

describe ("The string 'awesome'", function() {
	it("Should be 'awesome' ", function() {
		"awesome".should.eq("awesome");
	});
});