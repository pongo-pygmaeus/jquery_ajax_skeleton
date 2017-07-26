class User < ActiveRecord::Base

   include BCrypt

   # Why do we do the following Password.new malarchy?
   # (See 'sessions_controller.rb' 'post /sessions/login')
   # def self.get_users_json
   #    p User.all
   #    return p self.all.to_json
   # end

   def password
      @password ||= Password.new(password_hash)
   end

   def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
   end

   def authenticate(input_password)
      password == input_password
   end
end
