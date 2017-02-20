require 'faraday'

class Giphy

  def initialize
    @connection = Faraday.new(url=> "http://api.giphy.com")
  end

  def search(title)
    search = @connection.get("/v1/gifs/search?q=#{title}&api_key=dc6zaTOxFJmzC")
  end

  def display(title)
    response = @connection.get do |res|
      res.url "/v1/gifs/search?q=#{title}&api_key=dc6zaTOxFJmzC"
      res.params['key'] = 'value'
    end
    parse(response.body)
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end  
end


    #@connection.headers["Authorization"] = "dc6zaTOxFJmzC"

  