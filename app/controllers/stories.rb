get '/stories' do
  @user = session[:user] || User.new
  @users = User.all
  @stories = Story.all
  erb :all_stories
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
  erb :story
end

get '/stories/:id/edit' do
  @story = Story.find(params[:id])
  erb :edit_story
end

put '/stories/:id' do
  @story = Story.update(params[:id], title: params[:title], summary: params[:summary])
  redirect '/stories/#{@story.id}'
end
