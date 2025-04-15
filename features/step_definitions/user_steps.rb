require 'rspec/expectations'
World(RSpec::Matchers)

def create_test_user
  User.find_or_create_by!(email_address: "test@example.com") do |user|
    user.password = "password"
    user.password_confirmation = "password"
  end
end

def login_as(user)
  visit new_session_path
  fill_in "email_address", with: user.email_address
  fill_in "password", with: "password"
  click_button "Sign In"
end

Given("the user is on the GameHub home page") do
  user = create_test_user
  login_as(user)

  Game.find_or_create_by!(title: "Elden Ring 2") do |game|
    game.release_date = Date.today + 30
    game.platforms = "PC"
    game.cover_url = "https://example.com/test.jpg"
  end

  visit home_path
end

Then("they should see trending games") do
  expect(page).to have_css(".game-card")
end

Then("they should see upcoming releases") do
  expect(page).to have_content("Release")
end

When("they click on {string}") do |game_title|
  begin
    find(".game-card", text: game_title, match: :first).click
  rescue Capybara::ElementNotFound
    puts "❌ Could not find game card with title: #{game_title}"
    puts page.body
    raise
  end
end

When("they click the {string} button") do |label|
  begin
    click_button(label)
  rescue Capybara::ElementNotFound
    click_link(label)
  end
end

Then("they should see the game detail view for {string}") do |game_title|
  expect(page).to have_current_path(/games\/\d+/)
  expect(page).to have_content(game_title)
  expect(page).to have_content("Release Date")
end

Then("they should see their personalized dashboard") do
  expect(page).to have_css("#dashboard-view")
  expect(page).to have_content("Welcome back, Gamer!")
end

Given("the user is on the dashboard") do
  user = create_test_user

  Notification.find_or_create_by!(
    user: user,
    title: "Elden Ring 2"
  ) do |note|
    note.body = "This is a notification about Elden Ring 2."
    note.link = "https://store.steampowered.com/app/123456"
  end

  login_as(user)
  visit dashboard_path
end

Then("they should see a notification about {string}") do |game|
  within(".dashboard-section") do
    expect(page).to have_content(game)
  end
end
