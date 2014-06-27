get '/stories' do
  @user = session[:user] # THIS IS WRONG.. but we need a user
  @users = User.all
  @stories = Story.all
  erb :stories
end

get '/stories/new' do
  erb :new_story
end

post '/stories/new' do
  @story = Story.create(title: params[:title], summary: params[:summary], user_id: session[:user].id)
  redirect "/stories"
end

get '/stories/:id' do
  @story = Story.find(params[:id])
  erb :branches
end
