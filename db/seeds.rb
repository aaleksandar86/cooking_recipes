
User.create([{ username: 'john007', email: 'john@example.com',
               first_name: 'John', last_name: 'Doe',
               password: 'abcdefgh', password_confirmation: 'abcdefgh' },
             { username: 'jessica2020', email: 'jessica@example.com',
               first_name: 'Jessica', last_name: 'Smith',
               password: '123456', password_confirmation: '123456' }])

User.first.recipes.create({ title: 'Chicken with rice',
                            description: 'Chicken drumsticks with rice' })

User.second.recipes.create({ title: 'Meatball and garlic bread',
                             description: 'Make this comforting meatball and garlic bread traybake.' })

Recipe.first.ingredients.create({ ingredient_name: 'Chicken' })
Recipe.first.ingredients.create({ ingredient_name: 'Rice' })
Recipe.first.ingredients.create({ ingredient_name: 'Vegetables' })

Recipe.first.istructions.create({ body: 'Boil chicken drumsticks' })
Recipe.first.istructions.create({ body: 'Put rice in oven' })
Recipe.first.istructions.create({ body: 'Put chicken together with the rice to bake for 20 minutes' })

Recipe.second.ingredients.create({ ingredient_name: '350g turkey thigh mince' })
Recipe.second.ingredients.create({ ingredient_name: '150g ball mozzarella' })
Recipe.second.ingredients.create({ ingredient_name: '4 garlic breadsticks or garlic bread slices' })

Recipe.second.istructions.create({ body: 'Heat the oven to 200C, bake for 15-20 mins' })
Recipe.second.istructions.create({ body: 'Heat the remaining oil in the pan and add the onion. Cook until softened.' })
Recipe.second.istructions.create({ body: 'Put the meatballs on top of the sauce,add the mozzarella and garlic bread.' })
