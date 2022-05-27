require 'dish'

RSpec.describe Dish do
  it "returns name and price" do
    dish_1 = Dish.new("Coffee", 2.50)
    expect(dish_1.name).to eq "Coffee"
    expect(dish_1.price).to eq "£2.50"
  end
end