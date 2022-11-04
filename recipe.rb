class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end

# macarronada = Recipe.new('Macarronada', 'Macarrão e Molho')
# macarronada.name #=> Macarranada
# macarronada.description
