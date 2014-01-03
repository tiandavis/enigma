				 ______     __   __     __     ______     __    __     ______    
				/\  ___\   /\ "-.\ \   /\ \   /\  ___\   /\ "-./  \   /\  __ \   
				\ \  __\   \ \ \-.  \  \ \ \  \ \ \__ \  \ \ \-./\ \  \ \  __ \  
				 \ \_____\  \ \_\\"\_\  \ \_\  \ \_____\  \ \_\ \ \_\  \ \_\ \_\ 
				  \/_____/   \/_/ \/_/   \/_/   \/_____/   \/_/  \/_/   \/_/\/_/ 

			

Enigma demonstrates best practice application architecture for modern, full stack, mobile ready web applications.

Application Stack
-----------

Enigma organizes a number of open source projects:

Front End:
* Responsive Web Design - uses HTML5, CSS3, Sass and JavaScript
* [Sass] - CSS3 preprocessor with superpowers
* [jQuery] - duh
* [Underscore] - functional JavaScript utility library
* [Backbone] - an MVC architecture for scalable JavaScript apps
* [Jasmine] - a BDD/TDD framework for testing JavaScript code
* [Sinon] - test spies, stubs and mocks for JavaScript

Back End
* [Ruby] - a dynamic, elegant open source programming language
* [Rails 4] - a web framework built on ruby and optimized for programmer happiness
* [RSpec] - a BDD/TDD framework for testing Ruby code
* [FactoryGirl] - a library for setting up Ruby objects as test data
* [Capybara] - an acceptance test framework for web applications 
* [Selenium] - a browser automation framework

Installation
--------------

```sh
git clone https://github.com/tiandavis/enigma.git
cd enigma
bundle install
rails server
http://localhost:3000
```

RSpec Test Suite
--------------

```sh
cd enigma
bundle exec rspec
```

Jasmine Test Suite
--------------

```sh
cd enigma\spec\javascripts\
run SpecRunner.html
```

Contributions
--------------

Contributions are great, but I'm serious about code quality. Any pull request without accompanying, passing, test coverage will flat out be ignored. You can submit a pull request for Code Review and discussion. Thanks!


[Sass]:http://sass-lang.com/
[jQuery]:http://jquery.com
[Underscore]:http://underscorejs.org/
[Backbone]:http://backbonejs.org/
[Jasmine]:http://pivotal.github.io/jasmine/
[Sinon]:http://sinonjs.org/
[Ruby]:https://www.ruby-lang.org/en/
[Rails 4]:http://rubyonrails.org/
[RSpec]:http://rspec.info/
[FactoryGirl]:https://github.com/thoughtbot/factory_girl
[Capybara]:http://jnicklas.github.io/capybara/
[Selenium]:http://docs.seleniumhq.org/

