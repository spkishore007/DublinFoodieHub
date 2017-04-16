require 'singleton'

class MyLogger
include Singleton

def initialize
@log = File.open("pizzalog.txt", "a")
end

def logInformation(login)
@log.puts("login : " + login)
@log.flush
end

def profileInformation(profile)
@log.puts("profile : " + profile)
@log.flush
end

def storeInformation(store)
@log.puts("store : " + store)
@log.flush
end

def productInformation(product)
@log.puts("product : " + product)
@log.flush
end

def orderInformation(order)
@log.puts("order : " + order)
@log.flush
end

def cartInformation(cart)
@log.puts("cart : " + cart)
@log.flush
end


def paymentInformation(payment)
@log.puts("payment : " + payment)
@log.flush
end

end
