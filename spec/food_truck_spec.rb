require 'rspec'
require './lib/food_truck'
require './lib/item'
require 'pry'

RSpec.describe FoodTruck do 
  before(:each) do 
  @food_truck = FoodTruck.new("Rocky Mountain Pies")
  @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end 

  it 'exists' do 
    expect(@food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has attributes' do 
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check the stock' do 
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can stock items' do 
    @food_truck.stock(@item1, 30)

    expected_hash = {@item1 => 30}
    expect(@food_truck.inventory).to eq(expected_hash)
  end

  it 'can stock more items' do 
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq(55)
  end 
   
   it 'can stock different items' do
    @food_truck.stock(@item2, 12)
    expected_hash2 = {@item2 => 12}
    expect(@food_truck.inventory).to eq(expected_hash2)
    expect(@food_truck.check_stock(@item2)).to eq(12)
  end
end 