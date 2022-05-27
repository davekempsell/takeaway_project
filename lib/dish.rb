class Dish
  def initialize(name, price) #name is a string, price is a float
    @name = name
    @price = price
  end

  def name
    return @name
  end

  def price
    return "£#{"%.2f" % @price}"
  end

  def value
    return @price
  end
end
