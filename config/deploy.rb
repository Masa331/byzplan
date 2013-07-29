require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "byzplancz"
set :repository, "git@github.com:Masa331/byzplan.git"
set :scm, "git"

role :web, "server8.railshosting.cz"
role :app, "server8.railshosting.cz"
role :db,  "server8.railshosting.cz", :primary => true

set :deploy_to, "/home/byzplancz/app/"
set :user, "byzplancz"

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
