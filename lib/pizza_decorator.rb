
class SimplePizza
	def initialize(price,name,allergens,ingredients,calorie)
		@price = price
		@name = name
		@allergens = allergens
		@ingredients = ingredients
		@calorie = calorie
	end
	
	def price
		return @price
	end
	
	def description
		return @name
	end
	
    def allergens
		return @allergens
	end
	
	def ingredients
		return @ingredients
	end	
	
	def calorie
		return @calorie
	end
end

class PizzaDecorator
	def initialize(real_pizza)
		@real_pizza = real_pizza
		@extra_price = 0
		@description = "No Toppings"
		@allergens=""
		@ingredients=""
		@calorie=""
	end


	def price
		return @extra_price + @real_pizza.price
	end

	def description
		return @description + " " + @real_pizza.description
	end
	
    def allergens
		return @allergens + " " + @real_pizza.allergens
	end
	
	def ingredients
		return @ingredients+" " +@real_pizza.ingredients
	end	
	
	def calorie
		return @calorie +" "+ @real_pizza.calorie
	end
	
end


class MozarellaDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@description = "Added Mozzarella Toppings"
		@extra_price = 100
		@allergens="Ristorante Pizza Mozzarella WHEAT,MOZZARELLA CHEESE,EDAM CHEESE"
		@ingredients="Mozzarella wheat,tomato puree,vegetable oil,yeast,basil,hydrolysed vegetable protein"
		@calorie=10
	end

end


class ParmesanDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@description = "Added Parmesan Toppings"
		@extra_price = 100
		@allergens="Milk"
		@ingredients="Chicken,Provolone,oregano"
		@calorie=15
	end
end

class PepperoniDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
	    @description = "Added Pepperoni Toppings"
		@extra_price = 120
		@allergens="Gluten,Mustard"
		@ingredients="Ricotta Cheese,Chopped fresh thyme,pepperoni-salami"
		@calorie=20
	end
	
end
	
class CapicolloDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@description = "Added Toppings"
		@extra_price = 80
		@allergens="yeast,wheat"
		@ingredients="Enriched wheat flour, water, canola oil, yeast, salt, sugar."
		@calorie=25
	end
	

end

class ChipotleDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
	    @description = "Added Toppings"
		@extra_price = 80
		@allergens="poblano pepper,black beans"
		@ingredients="black beans,corn,chopped cilantro,poblano pepper and mix."
		@calorie=22
	end
	end
	
	class PestoDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
	    @description = "Added Pesto Toppings"
		@extra_price = 75
		@allergens="bell peppers"
		@ingredients="bell peppers,artichoke hearts and feta cheese."
		@calorie=13
	end
	end
	
	class BruschettaDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@description = "Added Bruschetta Toppings"
		@extra_price = 120
		@allergens="garlic,olive oil"
		@ingredients="combine tomatoes, onion, garlic, olive oil"
		@calorie=15
	end
	

end

class BbqDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
	    @description = "Added Bbq Toppings"
		@extra_price = 70
		@allergens="Wheat"
		@ingredients="Brisket burnt ends,bacon, drizzled Cola BBQ sauce"
		@calorie=28
	end
	

end


