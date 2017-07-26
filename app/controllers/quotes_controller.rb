# INDEX ROUTE
get '/quotes' do
  @quotes = Quote.all
  erb :"/quotes/index.html"
end

# NEW ROUTE

get '/quotes/new' do
  # debug("*", params)
  if request.xhr?
    erb :"/quotes/_new.html", layout: false
  else
    erb :"/quotes/_new.html"
  end
end

# CREATE ROUTE
post '/quotes' do
  @quote = Quote.new(text: Faker::Hacker.say_something_smart)

  if @quote.save
    if request.xhr?
      erb :"quotes/_quote.html", locals: {quote: @quote}, layout: false
    else
      erb :"/quotes/show.html"
    end
  else
    # Do some server error things...
  end
end







