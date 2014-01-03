var Numbers = Backbone.Collection.extend({
    model: Number,

	parse: function(response) {
		console.log(response);
		return response;
	}
});