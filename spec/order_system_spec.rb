require 'order_system'

RSpec.describe OrderSystem do
    it "displays available dishes" do
      dish_1 = double :dish, name: "Coffee", price: "£2.50"
      dish_2 = double :dish, name: "Ham Sandwich", price: "£4.95"
      dish_3 = double :dish, name: "Biscuit", price: "£0.50"
      my_menu = double :menu 
      expect(my_menu).to receive(:view_dishes).and_return([dish_1, dish_2, dish_3])
      io = double :terminal
      expect(io).to receive(:puts).with("1. Coffee - £2.50")
      expect(io).to receive(:puts).with("2. Ham Sandwich - £4.95")
      expect(io).to receive(:puts).with("3. Biscuit - £0.50")
      get_food = OrderSystem.new(my_menu)

      get_food.view_menu(io)
    end

    it "provides an itemised receipt once dishes have been selected" do
    
    
    end
end