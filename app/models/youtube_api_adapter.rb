require 'uri'
require 'net/http'
require 'json'

class YouTubeAPIAdapter

  def self.find_results(query)

    api_endpoint = "https://www.googleapis.com/youtube/v3/search"
    key = ENV['YOUTUBE_API_KEY']
    part="snippet"
    type="video"

    url = URI("#{api_endpoint}?key=#{key}&part=#{part}&type=#{type}&q=#{query}")

    p url

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    # p "*" * 10
    data = JSON.parse(response.body)

    # p response = JSON.parse(response)
    # p "*" * 10
  end

##################################################

  # base_uri ENV['YOUTUBE_SEARCH_URL']
  # format :json

  # #ENDPOINT = https://www.googleapis.com/youtube/v3/search?
  # #key=key_in_ENV
  # #&part=snippet
  # #&type=video
  # #&q=bikes

  # default_params part: 'snippet', 
  #                type: 'video', 
  #                maxResults: 50, 
  #                key: ENV['YOUTUBE_API_KEY']
                 
  # def self.find_results( query_string )
  #   p ENV['YOUTUBE_SEARCH_URL']
  #   self.get( '',  query: { q: query_string } )
  # end

end