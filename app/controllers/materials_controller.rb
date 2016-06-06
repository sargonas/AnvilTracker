class MaterialsController < ApplicationController
  #before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all.where(:user_id => current_user.id)
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    @material = current_user.materials.find(params[:id])
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
    @material = current_user.materials.find(params[:id])
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    @material.user_id = current_user.id

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    @material = current_user.materials.find(params[:id])
    @material.user_id = current_user.id
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material = current_user.materials.find(params[:id])
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_material
    #  @material = Material.find(params[:id])
    #end

    def material_params
      params.require(:material).permit(:name, :manufacturer, :description, :extruder_temp, :bed_temp, :notes, :density, :user_id)
    end
    
    rescue_from ActiveRecord::RecordNotFound do
        flash[:notice] = 'You do not have access to do that'
        redirect_to materials_path
    end
end