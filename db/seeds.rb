
User.create([{ username: 'john007', email: 'john@example.com',
               first_name: 'John', last_name: 'Doe',
               password: 'abcdefgh', password_confirmation: 'abcdefgh' },
             { username: 'jessica2020', email: 'jessica@example.com',
               first_name: 'Jessica', last_name: 'Smith',
               password: '123456', password_confirmation: '123456' }])

User.find_by(username:'john007').recipes.create( title: 'Chicken with rice',
                           description: 'Chicken drumsticks with rice',
                           ingredients_attributes: [{ ingredient_name: 'Chicken' },{ ingredient_name: 'Rice' }],
                           instructions_attributes: [{ body: 'Boil chicken drumsticks' },{ body: 'Bake for 20 mins' }])

User.find_by(username:'john007').recipes.create( title: 'Meatball and garlic bread',
                                                description: 'Make this comforting meatball and garlic bread traybake.',
                                                ingredients_attributes: [{ ingredient_name: 'Meatballs' }, { ingredient_name: 'Garlic bread' }],
                                                instructions_attributes: [{ body: 'Heat the oven to 200C, bake for 15-20 mins' },
                                              { body: 'Put the meatballs on top of the sauce,add the mozzarella and garlic bread.' }])
