get '/branch/:id' do
  @segment = Segment.find(params[:id])
  erb :segment
end

get '/branch/:id/edit' do
  @segment = Segment.find(params[:id])
  if session[:user].id == @segment.user.id
    erb :edit_segment
  else
    erb :permission_denied
  end
end

put '/branch/:id/edit' do
  segment = Segment.find(params[:id]).update(params(:edit))
  redirect "/branch/#{segment.id}"
end
