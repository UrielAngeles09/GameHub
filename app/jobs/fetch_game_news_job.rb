class FetchGameNewsJob < ApplicationJob
  queue_as :default

  def perform
    steam = SteamApiService.new

    User.includes(:watched_games).find_each do |user|
      user.watched_games.each do |game|
        next unless game.steam_app_id

        news = steam.game_news(game.steam_app_id)
        next unless news && news["appnews"]["newsitems"]

        news["appnews"]["newsitems"].each do |item|
          unless user.notifications.exists?(external_id: item["gid"])
            user.notifications.create!(
              title: item["title"],
              body: item["contents"],
              link: item["url"],
              external_id: item["gid"]
            )
          end
        end
      end
    end
  end
end