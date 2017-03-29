require 'graph'
class BasicGraph
	def initialize(chartType)
		@chartType = chartType
	end
	
	def singleChart
		return @chartType
	end
	
	def doubleChart
		return @chartType
	end
	
	def multipleChart
		return @chartType
	end
	
end

# decorator class -- this serves as the superclass for all the concrete decorators
class GraphDecorator
	def initialize(real_graph)
		@real_graph = real_graph
	end

	def singleChart
		return Charting.singlechart(@x_name, @y_data_1, @y_name_1, @real_graph.singleChart)
	end
	
	def doubleChart
		return Charting.doublechart(@x_name, @y_data_1, @y_name_1, @y_data_2, @y_name_2, @real_graph.doubleChart)
	end
	
	def multipleChart
		return Charting.multichart(@x_name, @y_data_1, @y_name_1, @y_data_2, @y_name_2, @y_data_3, @y_name_3, @real_graph.multipleChart)
	end
end


# a concrete decorator
class SalesDecorator < GraphDecorator
	def initialize(real_graph)
	  super(real_graph)
	  @y_name_1 = "Non veg"
      @y_name_2 = "Veg"
      @y_name_3 = "Total sale"
      @y_data_1 = DaySale.select("nonVeg").group_by{|o| o.nonVeg}.keys
      @y_data_2 = DaySale.select("veg").group_by{|o| o.veg}.keys
      @x_name = DaySale.select("id").group_by{|o| o.id}.keys
      @y_data_3 = DaySale.select("totalSale").group_by{|o| o.totalSale}.keys
	end
end

# another concrete decorator
class OrderDecorator < GraphDecorator
	def initialize(real_graph)
		super(real_graph)
		@y_name_1 = "Actual Price"
        @y_name_2 = "Sold Price"
        @y_data_1 = Order.select("mrpPrice").group_by{|o| o.mrpPrice}.keys
        @y_data_2 = Order.select("soldPrice").group_by{|o| o.soldPrice}.keys
        @x_name = Order.select("orderId").group_by{|o| o.orderId}.keys
        @y_data_3 = Order.select("offerGiven").group_by{|o| o.offerGiven}.keys
        @y_name_3 = "Offer Given?"
	end
end

# another concrete decorator
class FoodDecorator < GraphDecorator
	def initialize(real_graph)
		super(real_graph)
		@y_name_1 = "Actual Price"
        @y_name_2 = "Offer Price"
        @y_data_1 = Food.select("actualPrice").group_by{|o| o.actualPrice}.keys
        @y_data_2 = Food.select("offerPrice").group_by{|o| o.offerPrice}.keys
        @x_name = Food.select("foodName").group_by{|o| o.foodName}.keys
        @y_data_3 = Food.select("quantityAvailable").group_by{|o| o.quantityAvailable}.keys
        @y_name_3 = "Quantity Available"
	end
end