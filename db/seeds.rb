# Create a user to associate with games
user = User.create!(email: "example@example.com", password: "password", password_confirmation: "password")

# Now create the games and associate them with the user
Game.create!(
  title: "Elden Ring 2",
  release_date: Date.new(2025, 3, 15),
  cover_url: "https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/da6e95de3b2d476ed5dcfdb55fa40dfd.jpg",
  platforms: "PlayStation 5, Xbox Series X, PC",
  buy_link: "https://store.steampowered.com/app/1245620/Elden_Ring",
  trailer_url: "https://www.youtube.com/embed/AvxCjTdxD5s",
  easter_eggs: <<~TEXT
    • Hidden dragon boss if you return to the temple after sunset.
    • New armor set unlocked by defeating every NPC.
  TEXT,
  user: user # Associate the game with the user
)

Game.create!(
  title: "Legend of Zelda: Echoes",
  release_date: Date.new(2025, 5, 20),
  cover_url: "https://i.pinimg.com/originals/3d/2b/bb/3d2bbb3856b81c7a53cf63a26573885a.jpg",
  platforms: "Nintendo Switch",
  buy_link: "https://www.nintendo.com/store/products/the-legend-of-zelda-tears-of-the-kingdom-switch/",
  trailer_url: "https://www.youtube.com/embed/1rPxiXXxftE",
  easter_eggs: <<~TEXT
    • Secret tune unlocks fairy portal.
    • Majora's Mask appears in a cave.
  TEXT,
  user: user # Associate the game with the user
)

Game.create!(
  title: "Halo: Rebooted",
  release_date: Date.new(2025, 7, 10),
  cover_url: "https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/36430ba3b7418b62b71ad889e1b70e57.jpg",
  platforms: "Xbox Series X, PC",
  buy_link: "https://store.steampowered.com/app/1240440/Halo_Infinite/",
  trailer_url: "https://www.youtube.com/embed/hXD-Xk0pL9g",
  easter_eggs: <<~TEXT
    • Playable grunt mode.
    • Cortana's hidden voice line in mission 5.
  TEXT,
  user: user # Associate the game with the user
)

Game.create!(
  title: "Final Fantasy XVI",
  release_date: Date.new(2025, 4, 8),
  cover_url: "https://image.api.playstation.com/vulcan/img/cfn/11307o7zo0muamWcb1CwZL0mVTD61U9Vvn9WCeVr7ooCkxN1qD.jpg",
  platforms: "PlayStation 5",
  buy_link: "https://store.playstation.com/en-us/product/UP0082-PPSA13802_00-FF16THEGAME00001",
  trailer_url: "https://www.youtube.com/embed/oZDF4p3OS-A",
  easter_eggs: <<~TEXT
    • Moogles will dance if you idle long enough.
    • FF7 posters hidden in scene 3.
  TEXT,
  user: user # Associate the game with the user
)

Game.create!(
  title: "Stardew Valley Mobile",
  release_date: Date.new(2024, 12, 1),
  cover_url: "https://upload.wikimedia.org/wikipedia/en/thumb/3/31/Stardew_Valley_cover_art.png/220px-Stardew_Valley_cover_art.png",
  platforms: "Mobile",
  buy_link: "https://play.google.com/store/apps/details?id=com.chucklefish.stardewvalley",
  trailer_url: "https://www.youtube.com/embed/ot7uXNQskhs",
  easter_eggs: <<~TEXT
    • Pet the dog 100 times to unlock a golden bone.
    • Mermaid cutscene appears on rainy Wednesdays.
  TEXT,
  user: user # Associate the game with the user
)

Game.create!(
  title: "Cyberpunk 2099",
  release_date: Date.new(2025, 11, 30),
  cover_url: "https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/64ee0b9e7117c1a3b04822196adf89d2.jpg",
  platforms: "PlayStation 5, Xbox Series X, PC",
  buy_link: "https://store.steampowered.com/app/1091500/Cyberpunk_2077/",
  trailer_url: "https://www.youtube.com/embed/qIcTM8WXFjk",
  easter_eggs: <<~TEXT
    • Blade Runner reference in Alley 9.
    • A glitch portal reveals a secret timeline.
  TEXT,
  user: user # Associate the game with the user
)

# Create a notification
Notification.create!(
  title: "Your watched game 'Elden Ring DLC' now has a trailer!",
  body: "FromSoftware has released a new trailer for the Shadow of the Erdtree DLC.",
  link: "https://www.youtube.com/watch?v=V9V7XX0QSRs"
)
