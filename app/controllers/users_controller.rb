require_relative '../models/youtube_api_adapter'
get '/users/?' do
   # redirect "/"
   # # content_type :json
   # # @users = User.all
   p @users_json = User.all.to_json
   # p ENV['SOME_KEY']
   # p results = YouTubeAPIAdapter.custom_search("potatoes+coyotes").to_json 
   # # parsed_results = []
   # p search_results = JSON.parse( results )
   # search_results.each do |item|
   #    p item#[:url] #= "http://www.youtube.com/watch?v=#{item['id']['videoId']}"
   # #    p item[:thumbnail] # = item['snippet']['thumbnails']['medium']['url']
   # end
   # parsed_results
   # erb :"/users/_index.html"

   # p "I'm stubbed out right now"
end

#NEW (GET)

get '/users/new/?' do
   if request.xhr?
      p erb :'/users/_new.html', layout: false
   else
      erb :'/users/_new.html'
   end
end

#SHOW (GET)

get '/users/:id/?' do

   @user = User.find(params[:id])

   if current_user == @user
      redirect "/users/#{@user.id}"
   else
      redirect "/"
   end

end

#CREATE (POST)

post '/users/?' do
   
   if params[:password_confirmation] == params[:user][:password]
      @errors = ""
      @user = User.new(params[:user])

      if @user.save
         session[:id] = @user.id
         erb :'/headers/_header_links.html', layout: !request.xhr?
      else
         @errors = @user.errors.full_messages
         erb :'/users/_new.html', layout: !request.xhr?
      end
   else
      @errors = "Passwords do not match!"
      erb :'/users/_new.html', layout: !request.xhr?
   end

end

#EDIT (GET)

#UPDATE (PUT)

#DELETE (DELETE)

