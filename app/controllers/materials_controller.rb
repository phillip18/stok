class MaterialsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :find_material, only: [:edit, :show, :update, :destroy, :complete]

  def index
    @material = Material.all.order('created_at DESC')
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    
    if @material.save
      redirect_to materials_path
    else
      render new
  end
  end

  def show
  end

  def edit
  end

  def update
  	if @material.update(params[:material].permit(:nome))
			redirect_to @material
		else
			render 'edit'
		end
  end

  def destroy
  	@material.destroy
  	redirect_to root_path
  end

  private

  def material_params
    params.require(:material).permit(:nome, :quantity)
  end

  def find_material
    @material = Material.find(params[:id])
  end

end
