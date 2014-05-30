class MomentCategoriesController < ApplicationController
  before_action :set_moment_category, only: [:show, :edit, :update, :destroy]

  # GET /moment_categories
  # GET /moment_categories.json
  def index
    @moment_categories = MomentCategory.all
  end

  # GET /moment_categories/1
  # GET /moment_categories/1.json
  def show
  end

  # GET /moment_categories/new
  def new
    @moment_category = MomentCategory.new
  end

  # GET /moment_categories/1/edit
  def edit
  end

  # POST /moment_categories
  # POST /moment_categories.json
  def create
    @moment_category = MomentCategory.new(moment_category_params)

    respond_to do |format|
      if @moment_category.save
        format.html { redirect_to @moment_category, notice: 'Moment category was successfully created.' }
        format.json { render :show, status: :created, location: @moment_category }
      else
        format.html { render :new }
        format.json { render json: @moment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moment_categories/1
  # PATCH/PUT /moment_categories/1.json
  def update
    respond_to do |format|
      if @moment_category.update(moment_category_params)
        format.html { redirect_to @moment_category, notice: 'Moment category was successfully updated.' }
        format.json { render :show, status: :ok, location: @moment_category }
      else
        format.html { render :edit }
        format.json { render json: @moment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moment_categories/1
  # DELETE /moment_categories/1.json
  def destroy
    @moment_category.destroy
    respond_to do |format|
      format.html { redirect_to moment_categories_url, notice: 'Moment category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment_category
      @moment_category = MomentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moment_category_params
      params.require(:moment_category).permit(:text, :photo)
    end
end
