class Menu
  def initialize
    @menu = []
  end

  def add_dish(dish) # dish is an instance of Dish class
    @menu << dish
  end

  def view_dishes
    fail "No dishes have been added to the menu." if @menu.empty?
    return @menu
  end
end