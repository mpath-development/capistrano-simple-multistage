capistrano-simple-multistage
=========================

Capistrano 2.X plugin making it easy to write Capfiles that support deploying to multiple environments.  Recognizes that most of the time, you want to use an identical deployment process for each environment, but run it against different hosts using different SSH keys.  Uses the capistrano-ext-multistage plugin, but avoids the need to create separate deploy files for each environment.  Instead, environment specific behavior can be specified in the main Capfile via the in_stage function.  for example:

````ruby

require 'capistrano-simple-multistage'

in_stage(:production) {
  role :app, '10.0.1.159', '10.0.32.181'
  role :db, '10.0.1.159', :primary => true
  set :gateway, '54.200.34.219'
}

in_stage(:staging) {
  role :app, '10.0.0.73', '10.0.16.95'
  role :db, '10.0.0.73', :primary => true
  set :gateway, '54.267.22.156'
}

````