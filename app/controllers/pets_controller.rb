class PetsController < ApplicationController

  def index 
    pets = Pet.all
    render json: pets 
  end

  def create
    pet = Pet.create(pet_params)
    render json: pet
  end

  def update 
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    render json: pet 
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    render json: pet
  end
  

  # strong params
  private
  def pet_params
    params.require(:pet).permit(:name, :age, :enjoys, :image)
  end
end
