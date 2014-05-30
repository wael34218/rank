class Api::V1::ApiApplicationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :check_user

  layout false

  private

  def check_user
    @account = Account.find_by_token(params[:token])
    if @account.blank? or params[:token].blank?
      @message = "Invalid token"
      render 'api/v1/error', :status => :unauthorized
      return
    end
  end
end
