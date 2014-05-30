class Api::V1::AccountsController < Api::V1::ApiApplicationController
  skip_before_filter :check_user, only: [:create]

  def create
    @account = Account.new(account_params)
    @account.generate_token!
    if @account.save
      render 'show'
    else
      @message = @account.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  private

  def account_params
    params.permit(:first_name, :last_name, :nickname, :phone, :avatar)
  end
end
