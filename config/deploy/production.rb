role :app, %w{s15.mydevil.net}
role :web, %w{s15.mydevil.net}
role :db,  %w{s15.mydevil.net}
server 's15.mydevil.net', user: 'Smilzy', roles: %w{web app db}
set :rails_env, :production
set :deploy_to, '/home/Smilzy/domains/wozniakalex.com'