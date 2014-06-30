get '/json/:parent_id/:index' do
  @segment = Segment.where(parent_id: params[:parent_id])
  if @segment.length > 0
    @segment = @segment[params[:index].to_i % @segment.length]
    erb :testing
  else
    # return not found
  end
end

