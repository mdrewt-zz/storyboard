get '/' do
	if User.where(id: session[:user_id]).first.is_a? User
		redirect '/stories'
	else
  	erb :index
  end
 # erb :index
end

get '/signup' do
	erb :index
end

post '/signup' do
	User.create(name: params[:name], email: params[:email],
	username: params[:username], password: params[:password])

	user = User.authenticate(params)
	if user
		session[:user_id] = User.find_by(email: params[:email]).id
		redirect '/stories'
	else
		redirect '/'
	end

	redirect "/stories"
end

post '/login' do
	user = User.authenticate(params)
	if user
		session[:user_id] = User.find_by(email: params[:email]).id
		redirect '/stories'
	else
		redirect '/'
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end
