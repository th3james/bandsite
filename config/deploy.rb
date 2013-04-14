set :application, "barcodechannel"
set :repository,  "git@github.com:th3james/bandsite.git"
require 'bundler/capistrano'
require "rvm/capistrano"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "th3james"
set :runner, user

set :host, "178.79.156.139"
role :web, host                          # Your HTTP server, Apache/etc
role :app, host                          # This may be the same as your `Web` server
role :db,  host, :primary => true # This is where Rails migrations will run

set :scm, :git
set :branch, "rails_3_1"
# Target directory for the application on the web and app servers.
set(:deploy_to) { File.join("", "home", user, "www", application) }

default_run_options[:pty] = true # Must be set for the password prompt from git to work

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

set :local_shared_files, %w(config/database.yml config/cartodb_config.yml)
set :local_shared_dirs, %w(public/system)

task :setup_production_database_configuration do
  database_name = Capistrano::CLI.ui.ask("Database name: ")
  database_user = Capistrano::CLI.ui.ask("Database username: ")
  pg_password = Capistrano::CLI.password_prompt("Database user password: ")

  require 'yaml'
  spec = { "production" => {
      "adapter" => "postgresql",
      "database" => database_name,
      "username" => database_user,
      "host" => host,
      "password" => pg_password
    }
  }
  run "mkdir -p #{shared_path}/config"
  put(spec.to_yaml, "#{shared_path}/config/database.yml")
end
after "deploy:setup", :setup_production_database_configuration
