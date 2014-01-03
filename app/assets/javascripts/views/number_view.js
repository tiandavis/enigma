var NumberView = Backbone.View.extend({
	el: $("#maincontent"),
	
	initialize: function() {
		
	},
	
	events: {
		"click .number-view input[type='submit']"				: "process_number"
    },
	
	process_number: function(e) {
		$(".success-block").empty();
		$("#countdown").empty();
		e.preventDefault();
		e.stopPropagation();
		
		var value = $(".number-view input[name='number[value]']").val();
		
		var number = new Number();
		
		number.set({"number" : {"value" : value}});
		
		if(number.isValid() === true) {
			number.bind("sync", this.render);
			number.save();
		} else {
			$(".success-block").html(number.validationError);
		}
		
		return this;
    },

	render:  function(number) {
		$(".success-block").empty();
		$("#countdown").empty();

		var value = number.get("value");
		
		var template = "<div><span>{{value}}</span> <ins>data conversion results</ins></div>".replace("{{value}}", value);

		$("#countdown").append(template);
		
		return this;
	},
});

window.numberView = new NumberView();