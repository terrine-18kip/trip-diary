require 'json'

class WpItem
  def self.get
    connection = Faraday.new(url: 'https://18kipper.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = connection.get '/wp-json/wp/v2/posts?&_embed&tags=88&after=2016-08-01T00:00:00'
    @articles = JSON.parse(response.body) 
  end
end
