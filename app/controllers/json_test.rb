get '/json/:parent_id/:index' do
  @segments = Segment.descended_from(params[:parent_id], params[:index].to_i)
  @segments.to_json
end

