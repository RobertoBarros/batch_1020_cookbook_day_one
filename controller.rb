require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Pegar todas as recipes do cookbook
    recipes = @cookbook.all

    # 2. Mandar a view exibir as recipes
    @view.display_list(recipes)

  end

  def create
    # 1. Perguntar o nome da receita
    name = @view.ask_name

    # 2. Perguntar a descrição da receita
    description = @view.ask_description

    # 3. Criar um objeto recipe
    new_recipe = Recipe.new(name, description)

    # 4. Inserir a recipe no cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # 1. Mostrar as receitas
    list

    # 2. Perguntar o index da receita para apagar
    index = @view.ask_index

    # 3. Mandar o cookbook apagar a receita pelo index
    @cookbook.remove_recipe(index)
  end

end
