Given("I am logged in") do
    user = User.create!(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  
    visit new_session_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: "password"
    click_button "Sign In"
  end
  
  Given("I am on the home page") do
    Game.create!(
      title: "Cucumber Test Game",
      release_date: Date.today,
      platforms: "PC",
      cover_url: "https://example.com/cover.jpg"
    )
  
    visit home_path
  end
  
  Then("I should see the text {string}") do |text|
    expect(page).to have_content(text)
  end
  
  Then("I should see at least 1 game card") do
    expect(page).to have_css("[data-testid='game-card']", minimum: 1)
  end
  