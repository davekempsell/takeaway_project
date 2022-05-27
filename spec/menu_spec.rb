require 'menu'

RSpec.describe Menu do
  it "shows added dishes in list" do
    dish_1 = double :dish
    dish_2 = double :dish
    my_menu = Menu.new
    my_menu.add_dish(dish_1)
    my_menu.add_dish(dish_2)
    expect(my_menu.view_dishes).to eq [dish_1, dish_2]
  end

  it "fails if view_dishes called on empty menu" do
    my_menu = Menu.new
    expect { my_menu.view_dishes}.to raise_error "No dishes have been added to the menu."
  end
end