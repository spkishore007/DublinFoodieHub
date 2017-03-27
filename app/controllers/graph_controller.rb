#require 'graph'
class GraphController < ApplicationController
  def getdata
  end

  def showdata
    chart_type = params[:chart]
    @table = params[:table]
    case @table 
    when 'order'
        y_name_1 = "Actual Price"
        y_name_2 = "Offer Price"
        y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        puts(y_data_1)
        y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        puts(y_data_1)
        x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        y_data_3 = [30,40,60]
        y_name_3 = "extra info"
    when 'sales'
        y_name_1 = "Actual Price"
        y_name_2 = "Offer Price"
        y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        puts(y_data_1)
        y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        puts(y_data_1)
        x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        y_data_3 = [30,40,60]
        y_name_3 = "extra info"
    when 'food'
        y_name_1 = "Actual Price"
        y_name_2 = "Offer Price"
        y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        puts(y_data_1)
        y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        puts(y_data_1)
        x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        y_data_3 = [30,40,60]
        y_name_3 = "extra info"
    when 'customer_count'
        y_name_1 = "Actual Price"
        y_name_2 = "Offer Price"
        y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        puts(y_data_1)
        y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        puts(y_data_1)
        x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        y_data_3 = [30,40,60]
        y_name_3 = "extra info"
    when ''
        y_name_1 = "Actual Price"
        y_name_2 = "Offer Price"
        y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        puts(y_data_1)
        y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        puts(y_data_1)
        x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        y_data_3 = [30,40,60]
        y_name_3 = "extra info"
    end
    if params[:commit] == 'view'
      if params[:singleChart].to_s.length > 0 then
        @chart1 = Charting.singlechart(x_name, y_data_1, y_name_1, chart_type)
        #render getdata
      else
        @chart1 = ""
      end
      if params[:doubleChart].to_s.length > 0 then
      @chart2 = Charting.doublechart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      else
        @chart2 = ""
      end
      if params[:tripleChart].to_s.length > 0 then
      @chart3 = Charting.multichart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, y_data_3, y_name_3, chart_type)
      else
        @chart3 = ""
      end
      if params[:multiChart].to_s.length > 0 then
      @chart4 = Charting.function_chart(x_name, y_data_1, y_name_1, y_data_2, y_name_2, chart_type)
      else
        @chart4 = ""
      end
    end
  end
end
