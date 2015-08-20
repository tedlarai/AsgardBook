Facebook clone made for [The Odin Project](http://www.theodinproject.com/ruby_on_rails/final-project)

Steps:

1. Set rails to use postgresql with 'rails new --database=postgresql'.
2. Setup Heroku following the instructions [here](https://devcenter.heroku.com/articles/getting-started-with-rails4).
3. Setup devise gem using 'rails g devise:install' and following the remaining given instructions .
4. Build the testing environment. It is my first attempt to test in a large scale, so expect it to be a bit messy. I followed a few tutorials out there and I will try to create my workflow. My main source was [Everyday Rails](everydayrails.com).
  1. Gems:
    ```
    gem 'rspec-rails'
    gem 'factory_girl_rails'
    gem 'capybara'
    gem 'guard-rspec'
    gem 'spring-commands-rspec'
    gem 'faker'
    gem 'launchy'
    gem 'shoulda-matchers'
    gem 'shoulda-callback-matchers'
    ```
  2. 'spring binstub --all' lets spring knows rspec
  3. 'guard init' and edit Guardfile to 'cmd: "bin/rspec"'
  4. 'rails g rspec:install' and in .rspec: '--format documentation'
  5. In 'spec/spec_helper.rb': 'require "capybara/rspec"'
  6. Configure the generators in 'config/application.rb'
5. Devise user model
6. Add first_name and last_name fields, including validations and sanitizers on 'application_controller'
7. User model validation tests using [this](https://gist.github.com/kyletcarlson/6234923) template.
