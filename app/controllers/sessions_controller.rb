#NEW

get '/sessions/login/?' do
   erb :'sessions/_login.html', layout: !request.xhr?
end

#CREATE

post '/sessions/login/?' do

   @user = User.find_by_username(params[:user][:email])

   if @user && @user.password == params[:user][:password]
      session[:id] = @user.id
      
      erb :'/headers/_header_links.html', layout: !request.xhr?
   else
      @errors = "Email & Password not found"
      erb :'/sessions/_login.html', layout: !request.xhr?
   end

end

# DELETE

delete '/sessions/logout/?' do
   session[:id] = nil
   erb :'/headers/_header_links.html', layout: !request.xhr?
end