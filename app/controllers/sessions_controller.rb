#NEW

get '/sessions/new/?' do
   # @errors = ""
   erb :'sessions/_login.html', layout: !request.xhr?
end

#CREATE

post '/sessions/?' do
   
   @user = User.find_by_username(params[:user][:email])

   # 
   # How is BCrypt comparing a random hash string against a 
   # paintext input?
   #
   # (Hint: params[:user][:password] == @user.password) won't work
   # 
   # Just as a start, consider the following:
   # @user.password.class.name == BCrypt::Password class
   # 
   # BCrypt::Password < String (BCrypt Password Class inherits
   #                            from String class)
   # BCrypt::Password::== method is redefined from String class:
   # (From BCrypt Source Code)
   # 
   # def ==(secret)
   #   #super is the String class
   #   super(BCrypt::Engine.hash_secret(secret, @salt))
   # end
   # 
   # So, if you call "==" from a BCrypt Password object
   # (which @user.password is), the right side of the equation
   # (more accurately, the argument to the .==() method)
   # is converted to a hashed PW and compared against the 
   # @user.password, which is a BCrypt Password object created
   # from the password hash in the DB
   # 

   # "a" == "a" #true
   # "b" == "a" #false

   if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      p session
      debug "*", session.class.name
      erb :'/headers/_header_links.html', layout: !request.xhr?
   else
      @errors = "Email & Password not found"
      erb :'/sessions/_login.html', layout: !request.xhr?
   end
end

# DELETE

get '/sessions/logout' do
   session[:id] = nil
   erb :'/headers/_header_links.html', layout: !request.xhr?
end