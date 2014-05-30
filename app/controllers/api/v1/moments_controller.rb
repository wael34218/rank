class Api::V1::MomentsController < Api::V1::ApiApplicationController

  def create
    @moment = Moment.new(moment_params)
    @moment.subject_id = @account.id
    if @moment.save
      render 'show'
    else
      @message = @moment.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def categories
    @moment_categories = MomentCategory.where(["text like ?",params[:q].to_s+'%'])
  end

  private

  def moment_params
    params.permit(:message, :moment_category_id, :photo, :target_id)
  end
end
