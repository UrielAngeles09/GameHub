Given("a user exists with email {string} and password {string}") do |email, password|
    User.create!(email: email, password: password, password_confirmation: password)
end
  
When("I go to the login page") do
    visit new_user_session_path
end
  