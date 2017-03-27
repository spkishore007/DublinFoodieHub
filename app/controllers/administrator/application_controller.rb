require 'graph'
class Administrator::ApplicationController < ApplicationController
  
  # GET /cars/1
  # GET /cars/1.json
  def order
      y_name_1 = "Actual Price"
      y_name_2 = "Sold Price"
      chart_type = "spline"
      y_data_1 = Order.select("mrpPrice").group_by{|o| o.mrpPrice}.keys
      puts(y_data_1)
      y_data_2 = Order.select("soldPrice").group_by{|o| o.soldPrice}.keys
      puts(y_data_1)
      x_name = Order.select("orderId").group_by{|o| o.orderId}.keys
      y_data_3 = Order.select("offerGiven").group_by{|o| o.offerGiven}.keys
      y_name_3 = "Offer Given?"
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      #@chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
  end
  
  def sales
      y_name_1 = "Non veg"
      y_name_2 = "Veg"
      chart_type = "pie"
      y_data_1 = DaySale.select("nonVeg").group_by{|o| o.nonVeg}.keys
      puts(y_data_1)
      y_data_2 = DaySale.select("veg").group_by{|o| o.veg}.keys
      puts(y_data_1)
      x_name = DaySale.select("id").group_by{|o| o.id}.keys
      y_data_3 = DaySale.select("totalSale").group_by{|o| o.totalSale}.keys
      y_name_3 = "Total sale"
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      #@chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
  end
  
  def food
      y_name_1 = "Actual Price"
      y_name_2 = "Offer Price"
      chart_type = "pie"
      y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
      puts(y_data_1)
      y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
      puts(y_data_1)
      x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
      y_data_3 = Food.select("quantityAvailable").group_by{|o| o.quantityAvailable}.keys
      y_name_3 = "Quantity Available"
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      #@chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
  end
  
  def customer
      y_name_1 = "Actual Price"
      y_name_2 = "Offer Price"
      chart_type = "pie"
      y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
      puts(y_data_1)
      y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
      puts(y_data_1)
      x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
      y_data_3 = [30,40,60]
      y_name_3 = "extra info"
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      #@chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
  end
  
  def extra
      y_name_1 = "Actual Price"
      y_name_2 = "Offer Price"
      chart_type = "pie"
      y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
      puts(y_data_1)
      y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
      puts(y_data_1)
      x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
      y_data_3 = [30,40,60]
      y_name_3 = "extra info"
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      #@chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
  end
  
end
