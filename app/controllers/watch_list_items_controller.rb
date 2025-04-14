def create
    @game = Game.find(params[:game_id])
    @watch_list_item = current_user.watch_list_items.create(game: @game)
  
    # Create a notification when a game is added to the watch list
    Notification.create!(
      user: current_user,
      title: "You've added #{ @game.name } to your watch list!",
      body: "We'll notify you about future updates for this game.",
      read: false
    )
  
    redirect_to watch_list_path(current_user), notice: "#{@game.name} added to your watch list!"
  end