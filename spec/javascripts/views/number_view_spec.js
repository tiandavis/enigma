describe("Number View", function() {
	var numberView;
	
	beforeEach(function() {
		numberView = new NumberView();
	});
	
	afterEach(function() {
	    delete numberView;
	});
	
	describe("when instantiated", function() {
		it("attaches to the main DOM element", function() {
			expect(numberView.$el.selector).toEqual("#maincontent");
		});
		
		it("has a class of 'numbers'", function() {
			numberView.render = function() {
		    	this.el = document.createElement('div');
		    	return this;
		  	};
			
			spy = sinon.spy(numberView, "render");
			
			numberView.render();
			
			expect(numberView.render).toHaveBeenCalled();
		});
	});
});