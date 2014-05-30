class Api::V1::FriendsController < Api::V1::ApiApplicationController
  def create
    @response = {friends: []}
    params["friends"].each do |key, friend|
      friend_account = Account.where(phone: friend["phone"]).first_or_create(account_params(friend))
      if not @account.friends_with?(friend_account)
        Friend.create(:account_id=>@account.id, :friend_id=>friend_account.id, rank: friend[:rank])
      end
      @response[:friends] << {phone: friend_account.phone, id: friend_account.id}
    end
    render 'api/v1/custom_response'
  end

  def update
    if params[:id]
      friend_account = Account.where(id: params[:id]).first
    else
      friend_account = Account.where(phone: params[:phone]).first
    end

    if friend_account.blank?
      @message = "This is an imaginary friend of yours!"
      render 'api/v1/error', :status => :not_found and return
    end

    if @account.friends_with?(friend_account)
      @friend = Friend.where(account_id: @account.id, friend_id: friend_account.id).first
      @friend.rank = params[:rank]
      @friend.save
    else
      @friend = Friend.create(account_id: @account.id, friend_id: friend_account.id, rank: params[:rank])
    end
    render 'show'
  end

  private

  def account_params(pars)
    pars.slice(:first_name, :last_name, :phone)
  end
end
