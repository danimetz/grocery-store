# ID, a number
# Email address, a string
# Delivery address, a hash
#{street: "123 Main",city: "Seattle",state: "WA",zip: "98101"})
#Customer Class
require 'csv'
# require_relative '../data/customers.csv'
class Customer


attr_reader :id
attr_accessor :email , :address

  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all
    data = CSV.open('data/customers.csv', 'r').map do |line|
      line.to_a
    end
    all_customers = []
    data.each do |customer|
      all_customers << Customer.new(customer[0].to_i, customer[1], {street: customer[2], city: customer[3], state: customer[4], zip: customer[5]})
    end

    return all_customers
  end

  def self.find(id)
    all_customers = Customer.all
    all_customers.each do |customer|
      if customer.id == id
        return customer
      end
    end
    return nil
    #use enumerable find???
  end


end
