class Api::V1::ActivitiesController < Api::V1::ApiApplicationController

  def comment
    @activity = Activity.find(params[:id])
    @activity.add_comment(@account.id, params[:message])
    render 'show'
  end

  def like
    @activity = Activity.find(params[:id])
    if @activity.add_like(@account.id)
      render 'show'
    else
      @message = "You liked this post already!"
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def index
    per_page = params[:per_page] || 10
    page = params[:page] || 1
    @activities = Activity.for(@account).prioritize.page(page).per(per_page)
  end

end
