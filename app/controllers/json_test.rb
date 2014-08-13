get '/json/:story_id/:parent_id/:index' do
  @segment = Segment.where("story_id = ? and parent_id = ? and index = ?", params[:story_id], params[:parent_id], params[:index])
  @parents = Segment.parents_of(@segment)
  @children = Segment.descended_from(@segment)
  (@parents + @children).uniq.to_json
end

