get '/hacks' do
  @hacks = Hack.all
  erb :"/hacks/index"
end

get '/hacks/:id' do
end

post '/hacks' do
  @hack = Hack.new(text: Faker::Hacker.say_something_smart)
  # Come back later and finish this
  if @hack.save
    if request.xhr?
      # content_type :json #Tell rack we're sending a JSON object back
      # @hack.to_json
      # Render the new thing as JSON
      # Render a partial with the new thing
      erb :"hacks/_display_hack", layout: false, locals: {hack: @hack}
      # status 400
      # locals: {variable_in_the_partial: variable_in_the_controller}

    else
      # Either redirect to show page of new item
      # redirect "/hacks/#{@hack.id}"
      # Or erb the show page
      erb :"/hacks/show"
    end
  else
    # Do some error things
  end

end
