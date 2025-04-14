namespace :notifications do
  desc "Add a manual notification for all users watching a specific game"
  task add_game_notifications: :environment do
    game = Game.find_by(name: "Cool Game")
    users = game.watch_list_items.map(&:user)

    users.each do |user|
      Notification.create!(
        user: user,
        title: "Big update for #{game.name}!",
        body: "Version 2.0 is now live. New quests, better graphics, and more!",
        read: false
      )
    end

    puts "Notifications sent to #{users.count} users for #{game.name}"
  end
end
