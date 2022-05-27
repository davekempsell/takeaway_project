$LOAD_PATH << File.dirname(__FILE__)
require "dish.rb"
require 'menu.rb'
require 'select_dishes'
require 'text'

class OrderSystem
  def initialize(menu)
    @menu = menu
    @order = []
  end

  def view_menu(io = Kernel)
    @io = io
    menu = @menu.view_dishes
    menu.each_with_index do |dish, index|
      @io.puts "#{index + 1}. #{dish.name} - #{dish.price}"
    end
  end
  
  def select_dishes(io = Kernel)
    new_order = SelectDishes.new(io)
    new_order.run(@menu)
    completed_order = new_order.selections
    produce_receipt(io, @menu, completed_order)
    #instantiates an instance of SelectDishes
    #user can select dishes from menu for order
    #when selected, customer is shown itemised receipt for confirmation
  end

  def place_order #phone_number is mobile number for customer
    puts "Would you like to place your order? (y/n)"
    
    while true do
      answer = gets.chomp
      if answer == 'y'
        puts "Thank you for your order. Please enter your number to receive a confirmation text."
        number = gets.chomp
        conf_text = SendText.new
        conf_text.run(number)
        break
      elsif answer == 'n'
        puts "No worries, thanks for browsing with us!"
        break
      else
        puts "Please answer with 'y or 'n'"
      end
    end
  end

  private

  def produce_receipt(io, menu, order)
    @io = io
    full_menu = menu.view_dishes
    total = []
    order.each do |dish_number|
      dish = full_menu[dish_number - 1]
      total << dish.value
      @io.puts "#{dish.name} - #{dish.price}"
    end
    @io.puts "TOTAL = £#{"%.2f" % total.sum}"
    #an itemised receipt is produced with selected dishes, prices, and total
  end
end

dish_1 = Dish.new("Coffee", 2.50)
dish_2 = Dish.new("Ham Sandwich", 4.95)
dish_3 = Dish.new("Biscuit", 0.50)
my_menu = Menu.new
my_menu.add_dish(dish_1)
my_menu.add_dish(dish_2)
my_menu.add_dish(dish_3)
get_food = OrderSystem.new(my_menu)
get_food.view_menu
get_food.select_dishes
get_food.place_order

