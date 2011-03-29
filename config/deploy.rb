set :application, "bandsite"
set :repository,  "git@github.com:th3james/bandsite.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "77.235.60.163"                          # Your HTTP server, Apache/etc
role :app, "77.235.60.163"                          # This may be the same as your `Web` server
role :db,  "77.235.60.163", :primary => true # This is where Rails migrations will run

set :user, "th3james"
set :use_sudo, true
set :runner, :user
set :port, 30000

set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

default_run_options[:pty] = true # Must be set for the password prompt from git to work

#task to run to link the database files properly
task :setup_production_database_configuration do
  postgres_password = Capistrano::CLI.password_prompt("Production PostGres password: ")
  require 'yaml'
  spec = { "production" => {
                         "adapter" => "postgresql",
                         "database" => 'bandsite',
                         "username" => 'bandsite',
                         "password" => postgres_password }}
  run "mkdir -p #{shared_path}/config"
  put(spec.to_yaml, "#{shared_path}/config/database.yml")
end

task :create_sym_links do
  run "(rm #{release_path}/config/database.yml && ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml) || echo 'not ready for this'"
  run "(rm -rf #{release_path}/public/system && ln -s #{shared_path}/system #{release_path}/public/) || echo 'not ready for this'"
end

after "deploy:setup", :setup_production_database_configuration
#after "deploy:setup", :create_private_folder, :create_system_and_headers_folder
after "deploy", :create_sym_links

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
