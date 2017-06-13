class HomeController < ApplicationController
  def index
  	@messages = Message.all
  end

  def create_message
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  @message.body,
                                   email: @message.user.email
    end
 
    respond_to do |format|
      format.js
    end
  end
 
  private
 
  def message_params
    params.permit(:user_id, :body)
  end

end
