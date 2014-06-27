get '/' do
  erb :index
end

get '/signup' do
	erb :index
end 

post '/signup' do
	User.create(name: params[:name], email: params[:email],
	username: params[:username], password: params[:password])
end 

get '/login' do
	erb :index
end

post '/login' do
user = User.authenticate(params[:username], params[:password])
	if user
		session[:id] = user.id
		redirect '/stories'
	else 
		redirect '/'
	end 
end 