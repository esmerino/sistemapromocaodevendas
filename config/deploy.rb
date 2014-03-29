require "bundler/capistrano"
require "capistrano/ext/multistage"

set :user, "deployer"
set :stages, %w(staging production)
set :default_stage, "production"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

set :application, "sistemapromotordevendas"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:luizfilipecoxa/sistemapromocaodevendas.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  namespace :assets do
    desc "Precompile assets on local machine and upload them to the server."
    task :precompile, roles: :web, except: {no_release: true} do
      run_locally "bundle exec rake assets:precompile RAILS_ENV=production"
      find_servers_for_task(current_task).each do |server|
        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
      end
    end
  end
end

namespace :deploy do
  desc "Database seeds."
  task :seed, roles: :web, except: {no_release: true} do
    run_locally "bundle exec rake db:seed RAILS_ENV=production"
  end
end