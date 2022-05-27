class SelectDishes
  def initialize(io = Kernel) 
    @io = io
    @selections = []
  end
  
  def run(menu)
    @io.puts "Please add a dish to your order by entering it's number."
    while true do
      input = @io.gets.chomp 
      if input == ""
        break
      elsif input != input.to_i.to_s
        @io.puts "Please enter a number"
      else
        number = input.to_i  
        @selections << number
        @io.puts "You have added a #{menu.view_dishes[number - 1].name}."
        @io.puts "Enter another dish, or press enter for receipt."
      end
    end
  end

  def selections
    return @selections
  end
end