class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    # ActionCable.server.broadcast "chat", {
    #   message: render_message(message)
    # }
    # ActionCable.server.broadcast 'chat', message: render_message(message)
    ActionCable.server.broadcast("hypothetical_channel", message: message)
  end

  private
  def render_message(message)
    # MessageController.render(
    #   partial: 'message',
    #   locals: {
    #     message: message
    #   }
    # )
    MessageController.render(partial: 'message', locals: {message: message})
  end
end




  