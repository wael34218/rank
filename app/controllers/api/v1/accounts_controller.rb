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

  def tags
    @account.tag_list = params[:tags]
    if @account.save
      render 'show', locals: { object: @account}
    else
      @message = @account.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def tag_leaders
    per_page = params[:per_page] || 10
    page = params[:page] || 1
    @accounts = Account.tagged_with(params[:tag]).order("social_score desc").page(page).per(per_page)
    render 'index'
  end

  def friends
    per_page = params[:per_page] || 10
    page = params[:page] || 1
    if params[:account_id].present?
      account = Account.where(id: params[:account_id]).first
      if account.present?
        @friends = aaccount.friends.order('rank asc nulls last').page(page).per(per_page)
        @accounts = Account.ordered_by_rank(@friends.map(&:friend_id))
      else
        @message = "Account not found .. you areh allucinating! I know a great doctor that could help out"
        render 'api/v1/error', :status => :not_found and return
      end
    else
      @friends = @account.friends.order('rank asc nulls last').page(page).per(per_page)
      @accounts = Account.ordered_by_rank(@friends.map(&:friend_id))
    end
    render 'index'
  end

  def ranked_friends
    per_page = params[:per_page] || 10
    page = params[:page] || 1
    @friends = Account.find(params[:id]).friends.where("rank is not NULL").order('rank asc').page(page).per(per_page)
    @accounts = Account.ordered_by_rank(@friends.map(&:friend_id))
    render 'index'
  end

  private

  def account_params
    params.permit(:first_name, :last_name, :nickname, :phone, :avatar)
  end
end
