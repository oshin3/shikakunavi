class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @messages = pagy(Message.order(id: :desc), items:7)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = '資格が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = '資格が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      flash[:success] = '資格は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = '資格は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @message.destroy

    flash[:success] = '資格は正常に削除されました'
    redirect_to messages_url
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :title)
  end
end