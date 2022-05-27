require 'select_dishes'

RSpec.describe SelectDishes do
  it "allows customer to select multiple dishes" do
    dish_1 = double :dish, name: "Coffee"
    dish_2 = double :dish, name: "Ham Sandwich"
    my_menu = double :menu, view_dishes: [dish_1, dish_2]
    io = double :terminal
    expect(io).to receive(:puts).with("Please add a dish to your order by entering it's number.")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have added a Coffee.")
    expect(io).to receive(:puts).with("Enter another dish, or press enter for receipt.")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("You have added a Ham Sandwich.")
    expect(io).to receive(:puts).with("Enter another dish, or press enter for receipt.")
    expect(io).to receive(:gets).and_return("")
    order_1 = SelectDishes.new(io)

    order_1.run(my_menu)
  end

  it "prompts user to enter a number if one isn't entered" do
    dish_1 = double :dish, name: "Coffee"
    my_menu = double :menu, view_dishes: [dish_1]
    io = double :terminal
    expect(io).to receive(:puts).with("Please add a dish to your order by entering it's number.")
    expect(io).to receive(:gets).and_return("Coffee")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("You have added a Coffee.")
    expect(io).to receive(:puts).with("Enter another dish, or press enter for receipt.")
    expect(io).to receive(:gets).and_return("")
    
    order_1 = SelectDishes.new(io)
    order_1.run(my_menu)
  end
end
