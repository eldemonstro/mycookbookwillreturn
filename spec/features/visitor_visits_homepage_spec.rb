require 'rails_helper'

feature 'Visitor visits homepage' do
  describe 'and sees header' do
    scenario 'sucessfully' do
      visit root_path

      within 'header.jumbotron' do
        expect(page).to have_css('h1', text: 'My CookBook')
        expect(page).to have_css('p.lead', text: 'O maior site de receitas.')
      end
    end
  end

  describe 'and sees recipes' do
    scenario 'sucessfully' do
      banana_assada = create(
        :recipe, title: 'Banana assada', recipe_type: 'Sobremesa',
                 cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 60,
                 servings: 6
      )

      bolo_laranja = create(
        :recipe, title: 'Bolo de laranja', recipe_type: 'Sobremesa',
                 cuisine: 'Brasileira', difficulty: 'Médio', cook_time: 60,
                 servings: 6
      )

      visit root_path

      within "div.card#recipe_#{banana_assada.id}" do
        within 'div.card-body' do
          expect(page).to have_css('h4.card-title', text: banana_assada.title)
          expect(page).to have_css('dl')
          expect(page).to have_css('dt', text: 'Tipo de receita')
          expect(page).to have_css('dd', text: banana_assada.recipe_type)
          expect(page).to have_css('dt', text: 'Cozinha')
          expect(page).to have_css('dd', text: banana_assada.cuisine)
          expect(page).to have_css('dt', text: 'Dificuldade')
          expect(page).to have_css('dd', text: banana_assada.difficulty)
          expect(page).to have_css('dt', text: 'Tempo de preparo')
          expect(page).to have_css('dd', text: "#{banana_assada.cook_time} \
minutos")
          expect(page).to have_css('dt', text: 'Serve')
          expect(page).to have_css('dd', text: "#{banana_assada.servings} pratos")
        end
      end

      within "div.card#recipe_#{bolo_laranja.id}" do
        within 'div.card-body' do
          expect(page).to have_css('h4.card-title', text: bolo_laranja.title)
          expect(page).to have_css('dl')
          expect(page).to have_css('dt', text: 'Tipo de receita')
          expect(page).to have_css('dd', text: bolo_laranja.recipe_type)
          expect(page).to have_css('dt', text: 'Cozinha')
          expect(page).to have_css('dd', text: bolo_laranja.cuisine)
          expect(page).to have_css('dt', text: 'Dificuldade')
          expect(page).to have_css('dd', text: bolo_laranja.difficulty)
          expect(page).to have_css('dt', text: 'Tempo de preparo')
          expect(page).to have_css('dd', text: "#{bolo_laranja.cook_time} \
minutos")
          expect(page).to have_css('dt', text: 'Serve')
          expect(page).to have_css('dd', text: "#{banana_assada.servings} pratos")
        end
      end
    end

    scenario 'and do not see any recipe' do
      visit root_path

      expect(page).to have_content('Nenhuma receita encontrada')
    end
  end
end
