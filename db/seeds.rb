User.destroy_all
u1 = User.create :name => 'Betty Shaw', :email => 'betty@shaw.com', :password => 'chicken'
u2 = User.create :name => 'Peter Selke', :email => 'peter@selke.com', :password => 'chicken'
u3 = User.create :name => 'Meera Patel', :email => 'meera@patel.com', :password => 'chicken'

Recipe.destroy_all
r1 = Recipe.create :name => "I can't Believe They're Paleo! Banana Cinnamon Muffins", :image => 'http://paleofever.com/images/muffincut.jpg', :video => '', :servings => '12', :preparation_time => '45', :ingredients => '3 ripe bananas (chopped small, or roughly mashed with a fork), 3 large eggs, 65g melted coconut oil or melted ghee, 2 tbsp coconut milk, 100g tapioca starch, 100g coconut flour, 120g coconut sugar or rapadura sugar, 2 tsp baking powder, 3/4 tsp ground cinnamon, 1/2 tsp ground cardamon', :method => 'Grease a 12 hole muffin tin, and set oven to 180ºC.

Combine dry ingredients (Tapioca startch, coconut flour, baking powder, sugar and xanthan gum) in a bowl and whisk until all lumps are gone.

In another bowl, whisk together the eggs, oil and milk, then add to the dry ingredients.

Mix until combined, do not over mix. Add bananas and combine.

Divide mixture between the 12 muffin cups and bake for 30-35 minutes, or until spongy and skewer comes out clean.

Let them cool completely before eating.', :tips => 'You can use almond milk instead of coconut milk, and leave out the cardamon if you want a milder flavour.'
r2 = Recipe.create :name => 'Easy Peasy Pancakes', :image => 'http://paleofever.com/images/pancakes.jpg', :video => '', :servings => '10', :preparation_time => '15', :ingredients => '3 ripe bananas (2 if really big), 3 eggs, 1 tbsp coconut flour, 2 tbsp coconut milk', :method => '', :tips => 'Use any milk if you do not have coconut milk. Can also add 1/4 tsp cinnamon or 1 tsp vanilla essence'
r3 = Recipe.create :name => 'Monster Green Smoothie', :image => '', :video => 'https://youtu.be/fuSLy8HAxSs', :servings => '3', :preparation_time => '5', :ingredients => 'Bowl of Spinach leaves, 1 green apple, 1 red apple, 1 banana, 1 ripe pear, 1.5 cups orange juice,', :method => 'throw it all into a blender and whizz up for a few seconds until smooth', :tips => 'can use most fruit'
r4 = Recipe.create :name => 'Chicken and Zucchini Bites', :image => 'http://paleofever.com/images/chicken_zucchini.jpg', :video => 'https://youtu.be/fuSLy8HAxSs', :servings => '5', :preparation_time => '15', :ingredients => '450g chicken mince, 2 grated zucchini, 3 spring onions - chopped, handful Fresh coriander - chopped, garlic clove - minced, 1/2 tsp ground cumin, 3/4 tsp salt, 1/4 tsp black pepper, 1 eggcoconut oil or ghee for frying', :method => 'Mix it all up really well with hands.

Take a bit in your wet hands, can use an ice cream scoop or table spoon to get an idea of amount, shape into mini patties and fry in the oil or ghee for a few minutes, turning over as you go. *It is worth just cooking one first, then having a little nibble. This will indicate if you need to adjust the seasoning at all.

Serve hot or cold, on alone or with an avocada dip, salsa, garlic mayo or home made ketchup.

They can be frozen after and taken out and reheated as needed.

For lunch boxes, either put them straight into a food Thermos after frying or cool and put into a regular lunch box with ice pack.

Yummy x', :tips => 'Eat them while they are hot, or cool and freeze!'

Category.destroy_all
c1 = Category.create :recipe_type => 'Beverages'
c2 = Category.create :recipe_type => 'Canapes'
c3 = Category.create :recipe_type => 'Breakfasts'
c4 = Category.create :recipe_type => 'Entrees'
c5 = Category.create :recipe_type => 'Mains'
c6 = Category.create :recipe_type => 'Desserts'
c7 = Category.create :recipe_type => 'Snacks'

u1.recipes << r1
u2.recipes << r2 << r3
u3.recipes << r4

c1.recipes << r3
c6.recipes << r4
c7.recipes << r1
c3.recipes << r2
