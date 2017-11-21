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
end
