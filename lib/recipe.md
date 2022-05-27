{{PROBLEM}} Takeaway Project Design Recipe
1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the Class System
* see a list of dishes with prices
* order a meal, some number of dishes
* see an itemised receipt, with total
* receive a confirmation text, with ETA

┌───────────────────┐      ┌─────────────────────────┐
│ Menu              │      │  Dish                   │
│ ----              │      │  ----                   │
│                   ◄──────┤  returns name as string │
│ add dish w/ price │      │  returns price as £GBP  │
│ view entire menu  │      └─────────────────────────┘
│                   │
│                   │
└──────┬────────────┘
       │
       │OrderSystem
       │shows customer
       │menu on request
       │
       │                                    ┌─────────────┐
     ┌─▼────────────────────────┐           │             │
     │                          │Text called│ Text        │
     │ Order System             │through    │ ----        │
     │ ------------             │OrderSystem│             │
     │                          ◄───────────┤ use Twilio  │
     │ view list of dishes      │           │ include ETA │
     │ select dishes            │           │             │
     │ produce itemised receipt │           └─────────────┘
     │ send text                │
     │                          │
     └─────▲────────────────────┘
           │
           │OrderSystem uses SelectDishes
           │class to take input from terminal
           │
       ┌───┴──────────────────┐
       │                      │
       │ SelectDishes         │
       │ ------------         │
       │                      │
       │ run method to create │
       │ interactive ordering │
       │ through the terminal │
       └──────────────────────┘

- Also design the interface of each class in more detail.

class Dish
  def initialize(name, price) #name is a string, price is a float
   
  end

  def name
    # returns name as a string
  end

  def price
    # returns price as £GBP
  end
end
  

class Menu
  def initialize
    @menu = []
    # create list of dishes
  end

  def add_dish(dish) #dish is an instance of Dish
    #add item to list within Menu class
  end

  def view_dishes
    # show list of dishes in menu
  end
end

class Text
  def send_message(delivery_time) #delivery_time is an integer
    #uses Twilio to send message, inc. ETA of delivery
  end
end

class SelectDishes
  def initialize(io) 
    @io = io
    #sets io variable to Kernal by default
  end
  
  def run
    #user can enter dishes they'd like to order
    #user can finish and see itemised receipt
  end
end

class OrderSystem
  def initialize
    #create list of selected dishes
  end

  def view_menu
    #displays dishes and prices for customer, with order number
  end
  
  def select_dishes(io = Kernel)
    #instantiates an instance of SelectDishes
    #user can select dishes from menu for order
    #when selected, customer is shown itemised receipt for confirmation
  end

  def place_order(phone_number) #phone_number is mobile number for customer
    #customer confirms order
    customer is sent text confirming order and giving delivery ETA
  end

  private

  def produce_receipt
    #an itemised receipt is produced with selected dishes, prices, and total
  end
end


3. Create Examples as Integration Tests
- Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Displays available dishes
my_menu = Menu.new
dish_1 = Dish.new("Coffee", 2.50)
dish_2 = Dish.new("Ham Sandwich", 4.95)
dish_3 = Dish.new("Biscuit", 0.50)
my_menu.add_dish(dish_1)
my_menu.add_dish(dish_2)
my_menu.add_dish(dish_3)
get_food = OrderSystem.new
OrderSystem.view_menu # =>
  "1. Coffee - £2.50"
  "2. Ham Sandwich" - £4.95"
  "3. Biscuit - £0.50"

# Customer can select dishes and see receipt
my_menu = Menu.new
dish_1 = Dish.new("Coffee", 2.50)
dish_2 = Dish.new("Ham Sandwich", 4.95)
dish_3 = Dish.new("Biscuit", 0.50)
my_menu.add_dish(dish_1)
my_menu.add_dish(dish_2)
my_menu.add_dish(dish_3)
get_food = OrderSystem.new
get_food.select_dishes # =>
  "Please add a dish to your order by entering it's number"
  "2"
  "You have added a Coffee, enter another dish, or press enter for receipt"
  "3"
  "You have added a Biscuit, enter another dish, or press enter for receipt"
  <enter>
  "Your order:
  Coffee - £2.50
  Biscuit - £0.50
  TOTAL - £3.00

# customer receives confirmation text when order is place
my_menu = Menu.new
dish_1 = Dish.new("Coffee", 2.50)
dish_2 = Dish.new("Ham Sandwich", 4.95)
dish_3 = Dish.new("Biscuit", 0.50)
my_menu.add_dish(dish_1)
my_menu.add_dish(dish_2)
my_menu.add_dish(dish_3)
get_food = OrderSystem.new
get_food.select_dishes # =>
  "Please add a dish to your order by entering it's number"
  "2"
  "You have added a Coffee, enter another dish, or press enter for receipt"
  "3"
  "You have added a Biscuit, enter another dish, or press enter for receipt"
  <enter>
get_food.place_order(#customer number???) # =>
SMS "Thank you! Your order was placed and will be delivered before 12:55"


4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Text class
# sends SMS giving estimated delivery time
message = Text.new
message.send_message(45) # =>
SMS "Thank you! Your order was placed and will be delivered before 12:36"

# Menu class
# added dishes are shown in array
my_menu = Menu.new
my_menu.add_dish("Coffee", 2.50)
my_menu.add_dish("Ham Sandwich", 4.95)
my_menu.view_dishes # => ["Coffee": 2.50, "Ham Sandwich": 4.95]

# returns name as string
my_menu = Menu.new
my_menu.add_dish("Coffee", 2.50)
my_menu.name(0) # => "Coffee"
my_menu.price(1) # => "

# returns price as formatted string
my_menu = Menu.new
my_menu.add_dish("Coffee", 2.50)
my_menu.add_dish("Ham Sandwich", 4.95)
my_menu.price(1) # => "£4.95"

# fails if view_dishes called on empty menu
my_menu = Menu.new
my_menu.view_dishes # => "No dishes have been added to menu"

# OrderSystem class
# customer is told no dishes available if menu is empty
get_food = OrderSystem.new
get_food.view_menu # => "No dishes are currently available"

# customer cannot select dishes if menu is empty
get_food = OrderSystem.new
get_food.select_dishes # => FAIL "No dishes are currently available"

# customer cannot place order if no dishes selected
get_food = OrderSystem.new
get_food.place_order(07900123456) # => FAIL "No dishes have been selected"

# customer cannot place order without mobile number
get_food = OrderSystem.new
get_food.place_order # => FAIL "Please enter mobile number when ordering to receive confirmation text"


5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

