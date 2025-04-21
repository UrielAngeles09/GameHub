Given('the user {string} with password {string} exists') do |email, password|

    User.create!(email_address: email, password: password, password_confirmation: password)

end

 

Given('I am on the login page') do

    visit '/login' # Adjust this if your route is different

end

 

When('I fill in login {string} with {string}') do |field, value|

    fill_in field, with: value

end

 

 

When('I click on login {string}') do |button_text|

    click_button button_text

end

 

Then('I should be redirected to the home page') do

    expect(page).to have_current_path('/home') # Change if your home route is different

end

 

Then('I should see {string}') do |message|

    expect(page).to have_content(message)

end

 