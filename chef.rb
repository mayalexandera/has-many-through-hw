class Chef
  @@all =[]

  attr_reader :name, :recipes

  def initialize(name)
    @name = name
    @recipes = []
    @@all << self
  end

  def recipes
    recipes = Recipe.all.select{|recipe|recipe.chef == self}
    recipes.map{|recipe| recipe.name}
  end

  def new_recipe(name, ingredients)
    Recipe.new(name, self, ingredients)
  end

end


class Recipe
  attr_reader :name, :chef, :ingredients
  @@all = []

  def initialize(name, chef, ingredients=[])
    @name = name
    @chef = chef
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end
end


chef1 = Chef.new("chuck")
recipe1 = Recipe.new('sushi', chef1, ['rice', 'seaweed', 'fish'])
recipe2 = Recipe.new('lasagna', chef1, ['noodles', 'sauce', 'cheese', 'beef'])
chef2 = Chef.new('Amelia')
recipe3 = Recipe.new('cake', chef2, ['flour', 'sugar', 'milk', 'eggs'])

chef1.recipes
chef2.recipes
recipe1.ingredients
Recipe.all