set :stage, :production
set :unicorn_rack_env, "development"
set :rails_env, 'development'
set :migration_role, 'db'

role :app, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}
role :web, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}
role :db, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}

set :ssh_options, {
  keys: [File.expand_path('~/.ssh/capistrano.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

server 'ec2-34-211-25-138.us-west-2.compute.amazonaws.com', user: 'ubuntu', roles: %w{web app db}