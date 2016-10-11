5.times do |i|
   User.create(:username => "m#{i}",
               :password => "m#{i}")
end