require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "Should validate name exists in database entry" do
    pet = Pet.create(age:3, enjoys:'Barking at the mailman', image:'https://somepetpic.com')
    expect(pet.errors[:name]).to_not be_empty
  end
  it "Should validate age exists in database entry" do
    pet = Pet.create(name:'Moose', enjoys:'testings using Rspec', image:'https://random.com')
    expect(pet.errors[:age]).to_not be_empty
  end
  it "Should validate enjoys exists in the database entry" do
    pet =Pet.create(name:"Junior", age:3, image:'https://randomwebpage.com')
    expect(pet.errors[:enjoys]).to_not be_empty
  end
  it "Should validate image exists in database entry" do
    pet = Pet.create(name:"Moose", age:3, enjoys:"Sleeping all day")
    expect(pet.errors[:image]).to_not be_empty
  end
  it "should not be valid if enjoys is > 10 characters" do 
    pet = Pet.create(name:"Jazz", age:1, enjoys:'12345678', image:'https://random.com')
    expect(pet.errors[:enjoys]).to_not be_empty
  end
end
