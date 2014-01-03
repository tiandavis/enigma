var Number = Backbone.Model.extend({
	urlRoot: "/numbers",

	parse: function(response) {
		return response;
	},
	
	validate: function(attrs, options) {
		var message = "Please choose one of the following formats: 1) int: 8191 or 2) hex: 5000";
		
		if(typeof attrs.number !== "undefined" && attrs.number !== null) {
			if(attrs.number.value.indexOf("int: ") > -1 || attrs.number.value.indexOf("hex: ") > -1) {
				
			} else {
				return message;
			}
		} else {
			return message;
		}	
	}
});