class PetsController < ApplicationController

  def index 
    pets = Pet.all
    render json: pets 
  end

  def create
    pet = Pet.create(pet_params)
      if pet.valid?
    render json: pet
      else
        render json: pet.errors, status: 422
      end
  end

  def update 
    pet = Pet.find(params[:id])
    pet.update(pet_params)
      if pet.valid?
    render json: pet
      else
      render json: pet.errors, status: 422
      end
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
