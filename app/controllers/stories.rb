get '/stories' do
  @stories = Story.all
  erb :stories
end

get '/stories/new' do
  erb :new_story
end

post '/stories/new' do
  @story = Story.create(title: params[:title], summary: params[:summary])
  redirect "/stories/#{@story.id}"
end

get '/stories/:id' do
  @story = Story.find(params[:id])
  erb :branches
end
