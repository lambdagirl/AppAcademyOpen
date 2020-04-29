#When we write unit tests, each of  specs should test just one thing. 
#This can be a little complicated when we write classes that interact with other classes. 
#Here an Order object needs a Customer object
class Order
  def initialize(customer)
    @customer = customer
  end

  def send_confirmation_email
    email(
      to: @customer.email_address,
      subject: "Order Confirmation",
      body: self.summary
    )
  end
end

#This is troublesome because a spec for #send_confirmation_email should only test the #send_confirmation_email method, not Customer#email_address. But the way we've written this spec, if there's a problem with Customer#email_address, a spec for Order#send_confirmation_email will also break, even though it should have nothing to do with Customer#email_address. This will clutter up your log of spec failures.
#Another problem is if Order and Customer both have methods that interact with the other. 

Rspec.describe Order do
  subject(:order) do
    customer = Customer.new(
      :first_name = "Ned",
      :last_name  = "Rugger",
      :email_address = "ds@appacadey.io"
    )
    Order.new(customer)
  end

  it "sends email successfully" do
    expect do 
      subject.send_confirmation_email
    end.not to raise_exception
  end
end



#Test doubles 
#A test double (also called a mock) is a fake object that we can use to create the desired isolation. 
#A double takes the place of outside, interacting objects, such as Customer. We could write the example above like so:


#IMPLEMENTATION
class Order
  def initialize(customer, product)
      @customer = customer
      @product = product
  end

  def send_confirmation_email
    email(
      to: @customer.email_address,
      subject: "Order Confirmation",
      body: self.summary
    )
  end

  def charge_customer
      @customer.debit_account(@product.cost)
  end
end

Rspec.describe Order do
  let(:customer) {double("customer")}
  subject(:order){Order.new(customers)}

  it "sends email successfully" do
    allow(customer).to receive(:email_address).and_return("ds@appacadey.io")
    
    expect do
      order.send_confirmation_email
    end.to_not raise_exception
  end
end
#We create the double by simply calling the double method (we give it a name for logging purposes). This creates an instance of RSpec::Mocks::Mock. The double is a blank slate, waiting for us to add behaviors to it.

#Method Expectations

#
Notice that we set the message expectation before we actually kick off the #charge_customer method. Expectations need to be set up in advance.
RSpec.describe Order
  let(:customer) { double('customer') }
  let(:product) { double('product', :cost => 5.99) }
  subject(:order) { Order.new(customer, product) }

  it "subtracts item cost from customer account" do
    expect(customer).to receive(:debit_account).with(5.99)
    order.charge_customer
  end
end

###Integration tests