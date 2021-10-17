class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC")
    # list in descending order (must be plural)
  end
  
  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end
    
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else 
      render 'new' #cuz redirect deletes session
    end
  end 

  private 

  def message_params
    (params.require(:message).permit(:title, :description))
  end
end
