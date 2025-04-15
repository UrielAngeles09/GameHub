require 'rspec/expectations'
World(RSpec::Matchers)

Given("the user is on the GameHub home page") do
  visit home_path
end

Then("they should see trending games") do
  # Expect at least one game card to appear
  expect(page).to have_css(".game-card")
end

Then("they should see upcoming releases") do
  # You can customize this if you render upcoming games differently
  expect(page).to have_content("Release")
end

When("they click on {string}") do |game_title|
  find(".game-card", text: game_title).click
end

Then("they should see the game detail view for {string}") do |game_title|
  expect(page).to have_current_path(/games\/\d+/)
  expect(page).to have_content(game_title)
  expect(page).to have_content("Release Date")
end

When("they click on {string}") do |game_title|
    begin
      card = find(".game-card", text: game_title, match: :first)
      card.click
    rescue Capybara::ElementNotFound
      puts "❌ Could not find game card with title: #{game_title}"
      puts page.body # helpful for debugging
      raise
    end
  end
  

Then("they should see their personalized dashboard") do
  expect(page).to have_css("#dashboard-view")
  expect(page).to have_content("Welcome back, Gamer!")
end

Given("the user is on the dashboard") do
  visit home_path
  click_link("Dashboard")
end

Then("they should see a notification about {string}") do |game_title|
  within(".dashboard-content") do
    expect(page).to have_content(game_title)
  end
end
