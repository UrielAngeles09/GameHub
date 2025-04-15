require 'rspec/expectations'
World(RSpec::Matchers)

Given("a game exists with title {string}") do |title|
  Game.create!(
    title: title,
    release_date: Date.today,
    cover_url: "https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/example.jpg",
    platforms: "PC",
    buy_link: "https://store.example.com/#{title.parameterize}",
    trailer_url: "https://www.youtube.com/embed/test123",
    easter_eggs: "• Sample easter egg for #{title}"
  )
end

When("I visit the home page") do
  visit home_path
end

When("I click on {string}") do |text|
    begin
      # Try to find a game card by text content and click it
      find(".game-card", text: text, match: :first).click
    rescue Capybara::ElementNotFound
      puts "❌ Could not find .game-card containing '#{text}'"
      puts "Here’s what the page looks like:\n\n"
      puts page.body
      raise
    end
  end
  

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should see the trailer iframe for {string}") do |trailer_url|
  expect(page).to have_css("iframe[src='#{trailer_url}']")
end

Then("I should see a buy link for {string}") do |game_title|
  game = Game.find_by(title: game_title)
  expect(page).to have_link("Buy This Game", href: game.buy_link)
end
