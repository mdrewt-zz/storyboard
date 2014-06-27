get '/stories' do
  @stories = Story.all
  erb :stories
end

get '/stories/new' do
  erb :new_story
end

post '/stories/new' do
  @story = Story.create
end

get '/stories/:id' do
end
