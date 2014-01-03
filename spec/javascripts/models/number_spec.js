describe("Number Model", function() {
	var number;
	
	beforeEach(function() {
		number = new Number();
	});
	
	afterEach(function() {
	    delete number;
	});
	
	describe("when instantiated", function() {
		it("is valid without a value", function() {
			expect(number).toBeDefined();
		});

		it("exhibits valid attributes", function() {
			number.set({"number" : {"value" : "hex: 5000"}});
			expect(number.get("number")).toEqual({ value : 'hex: 5000' });
		});
	});
	
	describe("is valid when the input", function() {
		it("declares a valid integer input", function() {
			number.set({"number" : {"value" : "int: 8191"}});
			expect(number.isValid()).toBe(true);
		});

		it("declares a valid hex input", function() {
			number.set({"number" : {"value" : "hex: 5000"}});
			expect(number.isValid()).toBe(true);
		});
	});
	
	describe("points to the correct REST endpoint", function() {
		beforeEach(function() {
			this.server = sinon.fakeServer.create();
	    });

	    afterEach(function() {
	      this.server.restore();
	    });
	
		it("does not save when value is empty", function() {
			var spy = sinon.spy();
			
			number.bind("invalid", spy);
		  	number.save();
		
		  	expect(spy.calledWith(number, "Please choose one of the following formats: 1) int: 8191 or 2) hex: 5000")).toBeTruthy();
		});
	
		it("fires a callback when 'sync' is triggered", function() {
			var spy = sinon.spy();	

			number.set({"number" : {"value" : "int: 8191"}});
			number.bind("sync", spy);

			number.trigger("sync"); 

			expect(spy.called).toBeTruthy();
		});
		
		it("is valid when pointing to /numbers endpoint", function() {
			expect(number.urlRoot).toEqual("/numbers");
		});

		it("is valid when server posts to /numbers endpoint", function() {			
			var spy = sinon.spy(jQuery, "ajax");
			
			number.set({"number" : {"value" : "int: 8191"}});
			number.save();
			
			expect(spy.getCall(0).args[0].url).toEqual("/numbers");
			
			jQuery.ajax.restore();
		});
		
		it("passes valid attributes to the endpoint", function() {
			var spy = sinon.spy(jQuery, "ajax");
			
			this.server.respondWith(
	        	"POST", "/number",
				[200, {"Content-Type": "application/json"}, '{"number":{"value":"int: 8191"}}']
			);
			
			number.set({"number" : {"value" : "int: 8191"}});
			number.bind("sync", spy);
			number.save();
			
			this.server.respond();

			expect(spy.getCall(0).args[0].data).toEqual('{"number":{"value":"int: 8191"}}');
			
			jQuery.ajax.restore();
		});
	});
});