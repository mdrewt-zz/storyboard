get '/json/:story_id/:parent_id/:index' do
  @segments = Segment.where("story_id = ? and parent_id = ?", params[:story_id], params[:parent_id])
  @segment = @segments.select{|seg| seg.index == params[:index].to_i % @segments.length}.first
  @parents = @segment.ancestors.sort_by{|seg| seg.id}
  @children = @segment.descendants.sort_by{|seg| seg.id}
  (@parents + @children).uniq.to_json
end

