# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:


set :rails_env, "production"
set :application, "child_labor_master"
set :deploy_to, "/var/www/child_labour-master"

server '46.51.222.52', user: 'ubuntu', roles: %w{app db web}, my_property: :my_value
server '46.51.222.52 ', user: 'ubuntu', roles: %w{app web}, other_property: :other_value
server '46.51.222.52 ', user: 'ubuntu', roles: %w{db}

#role :web, "ec2-46-51-222-52.ap-southeast-1.compute.amazonaws.com"
#role :app, "ec2-46-51-222-52.ap-southeast-1.compute.amazonaws.com"
#role :db, "ec2-46-51-222-52.ap-southeast-1.compute.amazonaws.com", :primary => true

#namespace :deploy do
#  task :restart, roles:   %w{app  web} do
#    run "cd #{current_path} && sudo chmod -R 755 #{chmod755}"
#    run "touch #{current_path}/tmp/restart.txt"
#  end
#
#  namespace :assets do
#    task :precompile, roles:  [:app, :web], :except => { :no_release => true } do
#      from = source.next_revision(current_revision)
#      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
#        run %Q{rm -rf #{shared_path}/assets && mkdir -p #{shared_path}/assets && rm -rf #{latest_release}/public/assets && ln -s #{shared_path}/assets #{latest_release}/public/assets}
#        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
#      else
#        logger.info "Skipping asset pre-compilation because there were no asset changes"
#      end
#    end
#  end
#end
#namespace :bundle do
#  desc "Run bundle install manually"
#  task :install do
#    run "ln -s -- #{shared_path}/bundle #{latest_release}/vendor/bundle"
#    run %Q{ cd #{latest_release} && RAILS_ENV=#{rails_env} bundle install --deployment --quiet --without development test }
#    run "cd #{release_path} && ln -nfs #{shared_path}/config/mongoid.yml config/mongoid.yml"
#    run "cd #{release_path} && ln -nfs #{shared_path}/config/s3.yml config/s3.yml"
#  end
#end
#
#namespace :git do
#  desc 'git tags cleanup'
#  task :tagcleanup, :except => { :no_release => true } do
#    tag_list = `git for-each-ref --format '%(tag)' refs/tags --sort=-taggerdate`
#    total_tags = tag_list.to_s.split("\n")
#    deleted_tags = total_tags.drop(5)
#    logger.log Capistrano::Logger::INFO, "keeping 5 of #{total_tags.length} deployed tags"
#    deleted_tags.each do |tag|
#      system("git tag -d #{tag}")
#      system("git push origin :refs/tags/#{tag}")
#    end
#  end
#end

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
  set :ssh_options, {
    keys: %w(/home/ubuntu/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
