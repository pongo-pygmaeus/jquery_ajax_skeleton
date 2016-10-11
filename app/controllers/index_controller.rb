get '/' do
	erb :index, layout: !request.xhr?
end