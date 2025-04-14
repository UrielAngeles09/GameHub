class SteamApiService
    BASE_URL = "https://api.steampowered.com"
  
    def initialize
      @api_key = ENV['F876C42B20769C97F08DA7317D8A5E7D']  # Access the API key from the environment variable
    end
  
    def fetch_game_news(app_id)
      response = HTTParty.get("#{BASE_URL}/ISteamNews/GetNewsForApp/v2/", query: { appid: app_id, count: 5, maxlength: 300, key: F876C42B20769C97F08DA7317D8A5E7D })
      if response.success?
        response.parsed_response["appnews"]["newsitems"]
      else
        []
      end
    end
  
    def fetch_game_details(app_id)
      response = HTTParty.get("#{BASE_URL}/ISteamUserStats/GetSchemaForGame/v2/", query: { appid: app_id, key: F876C42B20769C97F08DA7317D8A5E7D })
      if response.success?
        response.parsed_response["game"]["availableGameStats"]
      else
        {}
      end
    end
  end
  