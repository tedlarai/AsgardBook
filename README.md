Facebook clone made for [The Odin Project](http://www.theodinproject.com/ruby_on_rails/final-project)

Configuration Steps:

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
7. Model validation tests using [this](https://gist.github.com/kyletcarlson/6234923) template.

Notes:

1. I did not include "OmniAuth" (and regretted using "Devise") because:
..* The Odin Project does a great job taking you by the hands and gradually introducing tidbits of new things in addition to the Hartl Tutorial. But at this final project, time to take of the training wheels and go solo (I believed), the effort necessary to dominate these new additions deviated the focus from applying what I already studied. I took myself spending hours researching about these features, trying to not just copy and paste code bits necessary to their configuration. I had partial success with Devise (it worked, but I do not _fully_ understand what is going on behind the curtains, in the configuration files), but I gave up doing this at this project half way through the implementation of OmniAuth. I rolled back one or two git commits and called it a day. I will finish the Odin Project (when I will have a solid grasp on everything at a level expected from a junior professional) and then I will explore the inner dungeons of Rails. Only then I will be comfortable implementing Devise and OmniAuth without feeling like I am cheating somehow.
