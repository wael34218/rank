class Api::V1::MessagesController < Api::V1::ApiApplicationController

  def create
    @message = Message.new(message_params)
    @message.subject_id = @account.id
    if @message.save
      render 'show'
    else
      @message = @message.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:message, :private, :photo, :target_id)
  end
end
