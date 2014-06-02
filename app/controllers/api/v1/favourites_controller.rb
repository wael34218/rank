class Api::V1::FavouritesController < Api::V1::ApiApplicationController

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.account_id = @account.id
    if @favourite.save
      render 'show'
    else
      @message = @favourite.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def update
    @favourite = Favourite.where(id: params[:id], account_id: @account.id).first
    if @favourite.blank?
      @message = "There is no such favourite!! Or this favourite record is not for you!!"
      render 'api/v1/error', :status => :not_found
      return
    end

    if @favourite.update(favourite_params)
      render 'show'
    else
      @message = @favourite.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.where(id: params[:id], account_id: @account.id).first
    if @favourite.blank?
      @message = "There is no such favourite!! Or this favourite record is not for you!!"
      render 'api/v1/error', :status => :not_found
      return
    end

    @favourite.destroy
    @response = { message: 'Favourite destroyed successfully.'}
    render 'api/v1/custom_response'
  end

  def index
    params[:account_id] = @account.id if params[:account_id].blank?
    account = Account.where(id: params[:account_id]).first
    if account.present?
      @favourites = Favourite.search(params.slice(:account_id, :favourite_category_id))
    else
      @message = "Huh! There is no such user!!"
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def categories
    @favourite_categories = FavouriteCategory.all
  end

  def presets
    @favourites = FavouritePreset.where(favourite_category_id: params[:id]).
                      where(["title like ?", params[:q].to_s+"%"])
    render 'index'
  end

  private

  def favourite_params
    params.permit(:title, :photo, :favourite_category_id, :favourite_preset_id)
  end

end
