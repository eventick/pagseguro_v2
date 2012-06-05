require "spec_helper"

describe PagseguroV2::Checkout do
  before do
    @checkout = PagseguroV2::Checkout.new
    @product = {:price => 9.90, :description => "Ruby 1.9 PDF", :id => 1}
  end

  it "should set order id when instantiating object" do
    @checkout = PagseguroV2::Checkout.new("ABCDEF")
    @checkout.id.should == "ABCDEF"
  end
end
