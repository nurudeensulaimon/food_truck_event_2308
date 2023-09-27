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

   def total_inventory  
    outcome = {}
    food_trucks.map do |food_truck|
      food_truck.inventory.each do |item, v|
        outcome[item] = {total: 0, food_trucks: []} unless outcome.has_key?(item)
        outcome[item][:total] += food_truck.inventory[item]
        outcome[item][:food_trucks] << food_truck.name unless outcome[item].has_key?(food_truck) || outcome[item].has_value?(0)
      end
    end
    outcome 
  end

  def overstocked_items
    overstocked =  []
    total_inventory.each do |item, element|
      overstocked << item if element[:total] > 50 && element[:food_trucks].length > 1
    end
    overstocked
  end

  def sorted_item_list 
    item_names = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, value|
        item_names << item.name
      end
    end
    item_names.sort
  end
end