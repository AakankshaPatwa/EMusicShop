class PagesController < ApplicationController
  def home
    @messages = Message.last(8)
    @message = Message.new
  end
end
