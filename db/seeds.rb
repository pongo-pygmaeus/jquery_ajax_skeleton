5.times do |i|
   User.create(:username => "m#{i}",
               :password => "m#{i}")
end

30.times do
  Hack.create(text: Faker::Hacker.say_something_smart)
end
