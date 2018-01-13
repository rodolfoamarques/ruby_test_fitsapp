class MessagesController < ApplicationController

  before_action :logged_in_user, only: [:index, :new, :create, :destroy]


  def new
    @message = Message.new
  end

  def show
    @message = Message.find( params[:id] )
  end

  def create
    @message = Message.new( message_params )
    if @message.save
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def index
    @messages = Message.sender( current_user.id ).ordered()
  end


  private

    def message_params
      params
        .require( :message )
        .permit( :message, :from_user_id, :to_user_id )
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
