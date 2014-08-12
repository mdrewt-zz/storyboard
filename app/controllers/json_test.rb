get '/json/:parent_id/:index' do
  @segments = Segment.descended_from(params[:parent_id], params[:index].to_i).to_json
  JSON.parse(@segments).each{|seg| seg[:index] = params[:index]}.to_json
end

