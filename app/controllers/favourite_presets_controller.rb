class FavouritePresetsController < ApplicationController
  before_action :set_favourite_preset, only: [:show, :edit, :update, :destroy]

  # GET /favourite_presets
  # GET /favourite_presets.json
  def index
    @favourite_presets = FavouritePreset.all
  end

  # GET /favourite_presets/1
  # GET /favourite_presets/1.json
  def show
  end

  # GET /favourite_presets/new
  def new
    @favourite_preset = FavouritePreset.new
  end

  # GET /favourite_presets/1/edit
  def edit
  end

  # POST /favourite_presets
  # POST /favourite_presets.json
  def create
    @favourite_preset = FavouritePreset.new(favourite_preset_params)

    respond_to do |format|
      if @favourite_preset.save
        format.html { redirect_to @favourite_preset, notice: 'Favourite preset was successfully created.' }
        format.json { render :show, status: :created, location: @favourite_preset }
      else
        format.html { render :new }
        format.json { render json: @favourite_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourite_presets/1
  # PATCH/PUT /favourite_presets/1.json
  def update
    respond_to do |format|
      if @favourite_preset.update(favourite_preset_params)
        format.html { redirect_to @favourite_preset, notice: 'Favourite preset was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite_preset }
      else
        format.html { render :edit }
        format.json { render json: @favourite_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_presets/1
  # DELETE /favourite_presets/1.json
  def destroy
    @favourite_preset.destroy
    respond_to do |format|
      format.html { redirect_to favourite_presets_url, notice: 'Favourite preset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_preset
      @favourite_preset = FavouritePreset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_preset_params
      params.require(:favourite_preset).permit(:title, :favourite_category_id)
    end
end
