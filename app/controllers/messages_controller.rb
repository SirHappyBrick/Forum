class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]
  def index
    @messages = Message.all.order("created_at DESC")
    # list in descending order (must be plural)
  end
  
  def show
    
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

  def edit
    #edit only finds and shows the post
  end 

  def update
    #update saves new params of the post 
    if @message.update(message_params)
      redirect_to message_path
    else 
      render 'edit'
    end
  end 

  def destroy
    @message.destroy 
    redirect_to root_path
  end

  private 

  def message_params
    (params.require(:message).permit(:title, :description))
  end

  def find_message
    @message = Message.find(params[:id])
  end 
end
