require 'net/http'
require 'uri'
require 'json'

class SteamApiService
  BASE_URL = "https://store.steampowered.com/api/appdetails"

  def self.fetch_game_info(appid)
    uri = URI("#{BASE_URL}?appids=#{appid}")
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    data = result[appid.to_s]["data"] if result[appid.to_s]["success"]
    return nil unless data

    {
      name: data["name"],
      description: data["short_description"],
      cover_url: data["header_image"],
      platforms: data["platforms"].select { |_k, v| v }.keys.join(", "),
      release_date: data["release_date"]["date"]
    }
  rescue => e
    puts "Steam API Error: #{e.message}"
    nil
  end
end
