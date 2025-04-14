# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Notification.create!(
  title: "Starfield Just Got a Major Update!",
  body: "Bethesda dropped a huge patch with performance fixes and more quests.",
  link: "https://www.bethesda.net/en/game/starfield",
)

Notification.create!(
  title: "Your watched game 'Elden Ring DLC' now has a trailer!",
  body: "FromSoftware has released a new trailer for the Shadow of the Erdtree DLC.",
  link: "https://www.youtube.com/watch?v=V9V7XX0QSRs",
)