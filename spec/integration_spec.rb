require 'dish'
require 'menu'
require 'order_system'
require 'select_dishes'
# require 'text'

RSpec.describe 'integrations' do
  describe Menu do
    it "shows added dishes in list" do
      dish_1 = Dish.new("Coffee", 2.5)
      dish_2 = Dish.new("Ham Sandwich", 4.95)
      my_menu = Menu.new
      my_menu.add_dish(dish_1)
      my_menu.add_dish(dish_2)
      expect(my_menu.view_dishes).to eq [dish_1, dish_2]
    end
  end

  describe SelectDishes do
    it "allows user to select chosen dishes" do
      dish_1 = Dish.new("Coffee", 2.5)
      dish_2 = Dish.new("Ham Sandwich", 4.95)
      my_menu = Menu.new
      my_menu.add_dish(dish_1)
      my_menu.add_dish(dish_2)
      io = double :terminal
      expect(io).to receive(:puts).with("Please add a dish to your order by entering it's number.")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("You have added a Coffee.")
      expect(io).to receive(:puts).with("Enter another dish, or press enter for receipt.")
      expect(io).to receive(:gets).and_return("")
      order_1 = SelectDishes.new(io)

      order_1.run(my_menu)
    end
  end

  describe OrderSystem do
    it "displays available dishes" do
      dish_1 = Dish.new("Coffee", 2.50)
      dish_2 = Dish.new("Ham Sandwich", 4.95)
      dish_3 = Dish.new("Biscuit", 0.50)
      my_menu = Menu.new
      my_menu.add_dish(dish_1)
      my_menu.add_dish(dish_2)
      my_menu.add_dish(dish_3)
      io = double :terminal
      expect(io).to receive(:puts).with("1. Coffee - £2.50")
      expect(io).to receive(:puts).with("2. Ham Sandwich - £4.95")
      expect(io).to receive(:puts).with("3. Biscuit - £0.50")
      get_food = OrderSystem.new(my_menu)

      get_food.view_menu(io)
    end

    xit "returns an itemised receipt after user makes selections" do
      dish_1 = Dish.new("Coffee", 2.50)
      dish_2 = Dish.new("Ham Sandwich", 4.95)
      dish_3 = Dish.new("Biscuit", 0.50)
      my_menu = Menu.new
      my_menu.add_dish(dish_1)
      my_menu.add_dish(dish_2)
      my_menu.add_dish(dish_3)
      io = double :terminal

      get_food = OrderSystem.new(my_menu)

      get_food.select_dishes(io)
    end
  end
end