FactoryBot.define do
  factory :recipe do
    title 'Bolo de cenoura'
    recipe_type 'Sobremesa'
    cuisine
    difficulty 'Médio'
    cook_time 50
    ingredients 'Cenoura, farinha, fermento'
    servings 6
    add_attribute(:method) { 'Mistura tudo e coloca no forno' }
  end
end
