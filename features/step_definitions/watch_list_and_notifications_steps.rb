
# Step for logging in the user
Given('I am logged in as a user') do
    @user = FactoryBot.create(:user)  # Create a user using FactoryBot
    login_as(@user, scope: :user)     # Assuming you use Warden for login (Devise integration)
  end
  
  # Step for visiting the watch list page
  Given('I am on the watch list page') do
    visit watch_list_path(@user)  # Assuming your watch list page is set up this way
  end
  
  # Step for adding a game to the watch list
  When('I add a game to my watch list') do
    @game = FactoryBot.create(:game)  # Create a game using FactoryBot
    visit game_path(@game)             # Go to the game page
    click_button 'Add to Watch List'   # Simulate the user clicking the button
  end
  
  # Step for verifying that the game shows up in the watch list
  Then('I should see the game in my watch list') do
    visit watch_list_path(@user)
    expect(page).to have_content(@game.name)  # Check that the game appears in the watch list
  end
  
  # Step for verifying the notification about the game
  Then('I should receive a notification about the game') do
    @user.reload  # Make sure the notifications are updated
    notification = @user.notifications.last
    expect(notification.title).to eq("New update on #{@game.name}")
    expect(notification.body).to include(@game.name)
  end
  
  # Step for creating a new notification for the user
  Given('I have a new notification') do
    @notification = FactoryBot.create(:notification, user: @user, title: "New update", body: "A new patch is available for the game.")
  end
  
  # Step for visiting the notifications page
  When('I visit my notifications page') do
    visit notifications_path(@user)  # Assuming there's a path to view notifications
  end
  
  # Step for clicking on a notification's link
  When('I click on a notification link') do
    click_link @notification.title  # Simulate clicking the notification's title (which should be a link)
  end
  
  # Step for verifying that the full notification details are shown
  Then('I should see the full notification details') do
    expect(page).to have_content(@notification.title)
    expect(page).to have_content(@notification.body)
  end
  