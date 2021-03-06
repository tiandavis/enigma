_.extend(Backbone.Model.prototype, {
  // By default, rails expects model params to be wrapped in a nested params hash
  // https://github.com/rails/rails/blob/master/actionpack/lib/action_controller/metal/params_wrapper.rb
  _paramsWrapper : function() {
    return this.paramsWrapper;
  }
});


// Alias Backbone.sync method to inject Rails specific
// parameters into the options.data
Backbone.sync = (function(original){
  return function(method, model, options) {

    // Inject params data inside the options hash
    if (!options.data && model && (method == 'create' || method == 'update' || method == 'delete')) {

      var railsParams = {};
      if (method == 'create' || method == 'update') {
        // We can set contentType to JSON
        options.contentType = 'application/json';
        
        // Wrap model attributes if paramsWrapper key is defined
        if (this.paramsWrapper) {
          railsParams[this.paramsWrapper] = _.clone(this.attributes);
        }
        else {
          railsParams = _.clone(this.attributes);
        }
      }

      // Add rails csrf params
      csrfParm = $("meta[name='csrf-param']").attr('content');
      csrfToken = $("meta[name='csrf-token']").attr('content');

      if (!csrfParm || !csrfToken) {
        throw new Error("Did you forget to set csrf_meta_tag in your rails layout?");
      }

      railsParams[csrfParm] = csrfToken;

      // Add rails utf8 param
      if (method == 'create' || method == 'update') {
        railsParams['utf8'] = "✓";
      }

      options.data = JSON.stringify(railsParams);
    }

    // Call aliased Backbone.sync with our options
    original(method, model, options);

  };
})(Backbone.sync);