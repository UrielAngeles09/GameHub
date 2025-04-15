class Game < ApplicationRecord
    # Split comma-separated platform string into an array
    def platform_list
      (platforms || "").split(",").map(&:strip)
    end
  
    # Fetch data from Steam API using the Steam App ID
    def fetch_steam_data(steam_appid)
      require 'net/http'
      require 'json'
  
      url = URI("https://store.steampowered.com/api/appdetails?appids=#{steam_appid}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
  
      if data[steam_appid.to_s]["success"]
        details = data[steam_appid.to_s]["data"]
        self.title = details["name"] if details["name"]
        self.cover_url = details["header_image"] if details["header_image"]
        self.buy_link = "https://store.steampowered.com/app/#{steam_appid}/"
        self.save!
      end
    rescue => e
      Rails.logger.error("Steam API fetch failed: #{e.message}")
    end
  end
  