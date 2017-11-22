require 'rails_helper'

feature 'visitor sees recipe' do
  scenario 'sucessfully' do
    banana_assada = create(
      :recipe, title: 'Banana assada', recipe_type: 'Sobremesa',
               cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 60,
               ingredients: 'Banana', method: 'Asse a banana por 60 minutos',
               servings: 6
    )

    visit root_path
    click_on banana_assada.title

    expect(page).to have_css('h1', text: banana_assada.title)
    expect(page).to have_css('dl')
    expect(page).to have_css('dt', text: 'Tipo de receita')
    expect(page).to have_css('dd', text: banana_assada.recipe_type)
    expect(page).to have_css('dt', text: 'Cozinha')
    expect(page).to have_css('dd', text: banana_assada.cuisine)
    expect(page).to have_css('dt', text: 'Dificuldade')
    expect(page).to have_css('dd', text: banana_assada.difficulty)
    expect(page).to have_css('dt', text: 'Tempo de preparo')
    expect(page).to have_css('dd', text: "#{banana_assada.cook_time} minutos")
    expect(page).to have_css('dt', text: 'Serve')
    expect(page).to have_css('dd', text: "#{banana_assada.servings} pratos")
    expect(page).to have_css('dt', text: 'Ingredientes')
    expect(page).to have_css('dd', text: banana_assada.ingredients)
    expect(page).to have_css('h2', text: 'Como preparar')
    expect(page).to have_css('p', text: banana_assada.method)
  end

  scenario 'and returns to homepage' do
    banana_assada = create(
      :recipe, title: 'Banana assada', recipe_type: 'Sobremesa',
               cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 60,
               ingredients: 'Banana', method: 'Asse a banana por 60 minutos'
    )

    visit root_path
    click_on banana_assada.title
    click_on 'Voltar para a página inicial'

    expect(current_path).to eq(root_path)
  end

  scenario 'and there is no recipe' do
    visit recipe_path(15)

    expect(current_path).to eq(root_path)
    expect(page).to have_css('div.alert.alert-danger',
                             text: 'Receita não existente')
  end
end
