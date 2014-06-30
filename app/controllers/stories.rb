get '/stories' do
  @user = User.find(session[:user_id]) || User.new
  @users = User.all
  @stories = Story.all
  @stories.sort_by { |story| story.updated_at }
  erb :all_stories
end

get '/stories/new' do
  erb :new_story
end

post '/stories/new' do
  @story = Story.create(title: params[:title], summary: params[:summary], user_id: session[:user_id])
  redirect "/stories"
end

get '/stories/:id' do
  @story = Story.find(params[:id])
  @segment = Segment.where("story_id = ? AND parent_id = 0", @story.id).first
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
