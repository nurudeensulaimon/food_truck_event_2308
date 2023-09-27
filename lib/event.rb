class Event 
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name 
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    food_truck_names = []
    @food_trucks.each do |food_truck|
      food_truck_names << food_truck.name
    end
    food_truck_names
  end

   def food_trucks_that_sell(item)
     item_carriers = []
     @food_trucks.each do |food_truck|
         if food_truck.inventory.include?(item)
          item_carriers << food_truck
         end
     end
      item_carriers
   end
end