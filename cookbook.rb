require 'csv'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    recipes = []
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      new_recipe = Recipe.new(name, description)
      recipes << new_recipe
    end
    recipes
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
