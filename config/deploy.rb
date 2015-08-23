# config valid only for current version of Capistrano
lock '3.4.0'

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'

set :application, 'child_labor_master'
set :scm, :git
set :user, "ubuntu"
set :branch, "master"
set :repo_url, 'git@github.com:pratap477/chidl_labor.git'
set :deploy_to, "/var/www/child_labor_master/chidl_labor"

set :use_sudo, true
set :chmod755, "app config db lib public vendor script bin"
#set :keep_releases, 5
set :deploy_via, :remote_cache



namespace :deploy do
  task :release do
    on release_roles :all do
      tmp_current_path = release_path.parent.join(current_path.basename)

      execute :ln, '-s', release_path, tmp_current_path
      execute :mv, tmp_current_path, current_path.parent
    end
  end
  before :deploy, "deploy:check_revision"
  # only allow a deploy with passing tests to deployed

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end
end


#set :linked_files, %w{config/database.yml}

# dirs we want symlinking to shared
#set :linked_dirs, %w{}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# Default deploy_to directory is /var/www/my_app_name

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
 set :pty, true

#  Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
#set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5



