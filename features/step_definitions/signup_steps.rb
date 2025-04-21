Given('I am on the signup page') do

    visit '/signup' # Or the actual path if different

end

 

When('I fill in signup {string} with {string}') do |field, value|

    fill_in field, with: value

end

 

When('I press {string}') do |button_text|

    click_button button_text

end

 

Then('I should be on the home page') do

    expect(page).to have_current_path('/home') # Adjust if different

end

 

Then('I should see {string}') do |text|

    expect(page).to have_content(text)

end

 

Given('a user already exists with email {string}') do |email|

    User.create!(email_address: email, password: "securepass", password_confirmation: "securepass")

end

