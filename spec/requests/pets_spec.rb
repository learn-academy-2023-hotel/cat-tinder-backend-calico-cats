require 'rails_helper'
require 'rspec'
require_relative 'rspec'

RSpec.describe "Pets", type: :request do
  describe "GET /index" do
    Pet.create(
            name: 'Jazz',
            age: 3,
            enjoys: 'Sleeping and messing with her younger brother',
            image: 'https://pixabay.com/photos/cat-russian-blue-gray-cat-2761187/'
    )

    get '/pets'

    pet = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(pet.length).to eq 1
    end
  end
end
