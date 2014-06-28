get 'story/:story_id/segment/:segment_id' do
  @segment = Segment.find(params[:segment_id])
  erb :segment
end

get 'story/:story_id/segment/:segment_id/new' do
  @segment = Segment.find(params[:segment_id])
  if session[:user].id == @segment.user.id
    erb :create_segment
  else
    erb :permission_denied
  end
end

put 'story/:story_id/segment/:segment_id/new' do
  segment = Segment.create(params(:edit))
  redirect "story/#{params[:story_id]}/segment/#{segment.id}"
end

get 'story/:story_id/segment/:segment_id/edit' do
  @segment = Segment.find(params[:segment_id])
  if session[:user].id == @segment.user.id
    erb :edit_segment
  else
    erb :permission_denied
  end
end

put 'story/:story_id/segment/:segment_id/edit' do
  segment = Segment.find(params[:segment_id]).update(params(:edit))
  redirect "story/#{params[:story_id]}/segment/#{segment.id}"
end
