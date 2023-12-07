require 'rails_helper'

RSpec.describe "Pets", type: :request do
  describe "GET /index" do
    it 'gets a lsit of pets' do
    Pet.create(
            name: 'Felix',
            age: 4,
            enjoys: 'Meow Mix',
            image: 'http.//xxxxxxx'
    )

    get '/pets'

    pet = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(pet.length).to eq 2
    end
  end
  describe ' POST / create ' do
    it 'creates a new pet' do 
      pet_params = {
        pet: {
            name: 'Felix',
            age:4,
            enjoys: 'Meow Mix',
            image: 'http.//xxxxxxx'
            }
        }

     post '/pets', params: pet_params

     expect(response).to have_http_status(200)
     pet = Pet.last

     expect(pet.name).to eq 'Felix'
      expect(pet.age).to eq 4
      expect(pet.enjoys).to eq 'Meow Mix'
      expect(pet.image).to eq 'http.//xxxxxxx'
  end
end

  describe 'PATCH/ update' do
    it 'updates a pet' do
      pet_params = {
        pet: {
            name: 'Felix',
            age:4,
            enjoys: 'Meow Mix',
            image: 'http.//xxxxxxx'
            }
        }
        post '/pets', params: pet_params
        pet = Pet.last

        updated_params = {
          pet: {
            name: 'Buster',
            age: 4,
            enjoys: 'Meow Mix',
            image: 'http.//xxxxxxx'
          }
        }

        patch "/pets/#{pet.id}", params: updated_params

        updated_pet = Pet.find(pet.id)
        expect(response).to have_http_status(200)
        expect(updated_pet.name).to eq "Buster"
      end
    end

    describe 'DELETE / pets/:id' do 
      it 'deletes a pet' do
        pet_params = {
          pet: {
              name: 'Felix',
              age:4,
              enjoys: 'Meow Mix',
              image: 'http.//xxxxxxx'
              }
          }
          post '/pets', params: pet_params
          pet = Pet.last
      

          delete "/pets/#{pet.id}"
  
      expect(response).to have_http_status(200)
      deleted_pet = Pet.find_by(id: pet.id)
      expect(deleted_pet).to be_nil 
      end
    end



end

