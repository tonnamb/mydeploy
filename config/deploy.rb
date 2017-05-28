# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "mydeploy"
set :repo_url, "git@github.com:tonnamb/mydeploy.git"
set :deploy_to, "/var/www/mydeploy"
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'
