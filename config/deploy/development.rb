set :development, :develop
set :unicorn_rack_env, "development"
set :rails_env, 'development'
set :migration_role, 'db'

role :app, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}
role :web, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}
role :db, %w{ec2-34-211-25-138.us-west-2.compute.amazonaws.com}

set :ssh_options, {
  keys: [File.expand_path('~/.ssh/capistrano.pem')],
  forward_agent: true,
  auth_methods: %w(ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbNQoabYKWnfwUXIMiYXk1y1V+QPnwZzJF9qhB+hX4EYAYLyrn0COFSiHwELtgOBmiQzzHAXd2KK9alFBnDWZR4YiCr4V5ko9zcTphzciPwH9IGcYWNehpf5JbXuW48KJ/YpUtMCesMDJwsS/olte1KsgagAyPx5bdysSq/KsN5Wj3b2fRr1H/vlSi58QTJx1dX461cp+F/hZfgOgOki8EsUC5X0sQg1LLDZBkZ/s7dmjZ7n3uJf9ISkKZX9grP/mHDeOwixhb+KdxhSRsb8fyCoK3dCaXOESdHoGMQPXRwhiqeS1fE5690GjMT3F2JNkQEZNCFsGE4NvBwhb205/N ubuntu@ip-172-31-7-181)
}

server 'ec2-34-211-25-138.us-west-2.compute.amazonaws.com', user: 'ubuntu', roles: %w{web app db}
