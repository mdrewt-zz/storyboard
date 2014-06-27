get '/' do
	if session[:user].is_a? User
		redirect '/stories'
	else
  	erb :index
  end
end

get '/signup' do
	erb :index
end

post '/signup' do
	User.create(name: params[:name], email: params[:email],
	username: params[:username], password: params[:password])

	user = User.authenticate(params)
	if user
		session[:user] = User.find_by(email: params[:email])
		redirect '/stories'
	else
		redirect '/'
	end

	redirect "/stories"
end

post '/login' do
	user = User.authenticate(params)
	if user
		session[:user] = User.find_by(email: params[:email])
		redirect '/stories'
	else
		redirect '/'
	end
end

get '/logout' do
	session[:user] = nil
	redirect '/'
end
