require 'rails_helper'

feature 'User register recipes' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar uma receita'

    fill_in 'Título', with: 'Banana assada'
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Tipo de receita', with: 'Sobremesa'
    fill_in 'Porções', with: 6
    fill_in 'Tempo de preparo', with: 60
    select 'Médio', from: 'Dificuldade'
    fill_in 'Ingredientes', with: 'Banana'
    fill_in 'Como preparar', with: 'Assa a banana'
    click_on 'Cadastrar Receita'

    expect(page).to have_css('h1', text: 'Banana assada')
    expect(page).to have_css('dl')
    expect(page).to have_css('dt', text: 'Tipo de receita')
    expect(page).to have_css('dd', text: 'Sobremesa')
    expect(page).to have_css('dt', text: 'Cozinha')
    expect(page).to have_css('dd', text: 'Brasileira')
    expect(page).to have_css('dt', text: 'Dificuldade')
    expect(page).to have_css('dd', text: 'Médio')
    expect(page).to have_css('dt', text: 'Tempo de preparo')
    expect(page).to have_css('dd', text: "60 minutos")
    expect(page).to have_css('dt', text: 'Serve')
    expect(page).to have_css('dd', text: '6 pratos')
    expect(page).to have_css('dt', text: 'Ingredientes')
    expect(page).to have_css('dd', text: 'Banana')
    expect(page).to have_css('h2', text: 'Como preparar')
    expect(page).to have_css('p', text: 'Assa a banana')
  end
end
