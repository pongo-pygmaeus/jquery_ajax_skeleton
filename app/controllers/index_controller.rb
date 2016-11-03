get '/' do
   p session
	erb :index, layout: !request.xhr?
end