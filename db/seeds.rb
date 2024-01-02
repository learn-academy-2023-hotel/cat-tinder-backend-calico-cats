user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")



user1 = [
          { 
            name: 'Jazz',
            age: 3,
            enjoys: 'Sleeping and messing with her younger brother',
            image: 'https://pixabay.com/photos/cat-russian-blue-gray-cat-2761187/'
          },
          { 
            name: 'Moose',
            age: 3,
            enjoys: 'Barking at the mailman',
            image: 'https://pixabay.com/photos/shepherd-dog-german-shepherd-dog-4074699/'
          }
        ]

user2 = [
          { 
            name: 'Ruka',
            age: 6,
            enjoys: 'Stealing food from peoples plates',
            image: 'https://pixabay.com/photos/rhodesian-ridgeback-dog-guard-dog-2727035/'
          },
          { 
            name: 'Max',
            age: 5,
            enjoys: 'Going on walks at the beach',
            image: 'https://pixabay.com/photos/dog-labrador-swim-water-summer-1196417/'
          }
]

user1.each do |pet| 
	Pet.create(pet)
  puts "creating pet #{pet}"
end

user2.each do |pet| 
	Pet.create(pet)
  puts "creating pet #{pet}"
end
