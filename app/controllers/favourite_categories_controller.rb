class FavouriteCategoriesController < ApplicationController
  before_action :set_favourite_category, only: [:show, :edit, :update, :destroy]

  # GET /favourite_categories
  # GET /favourite_categories.json
  def index
    @favourite_categories = FavouriteCategory.all
  end

  # GET /favourite_categories/1
  # GET /favourite_categories/1.json
  def show
  end

  # GET /favourite_categories/new
  def new
    @favourite_category = FavouriteCategory.new
  end

  # GET /favourite_categories/1/edit
  def edit
  end

  # POST /favourite_categories
  # POST /favourite_categories.json
  def create
    @favourite_category = FavouriteCategory.new(favourite_category_params)

    respond_to do |format|
      if @favourite_category.save
        format.html { redirect_to @favourite_category, notice: 'Favourite category was successfully created.' }
        format.json { render :show, status: :created, location: @favourite_category }
      else
        format.html { render :new }
        format.json { render json: @favourite_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourite_categories/1
  # PATCH/PUT /favourite_categories/1.json
  def update
    respond_to do |format|
      if @favourite_category.update(favourite_category_params)
        format.html { redirect_to @favourite_category, notice: 'Favourite category was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite_category }
      else
        format.html { render :edit }
        format.json { render json: @favourite_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_categories/1
  # DELETE /favourite_categories/1.json
  def destroy
    @favourite_category.destroy
    respond_to do |format|
      format.html { redirect_to favourite_categories_url, notice: 'Favourite category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_category
      @favourite_category = FavouriteCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_category_params
      params.require(:favourite_category).permit(:title, :photo)
    end
end
