get '/json/:story_id/:parent_id/:index' do
  @segment = Segment.where("story_id = ? and parent_id = ? and index = ?", params[:story_id], params[:parent_id], params[:index])
  @parents = @segment.ancestors
  @children = @segment.descendants
  (@parents + [@segment] + @children).to_json
end

