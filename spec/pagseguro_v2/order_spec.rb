require "spec_helper"

describe PagSeguroV2::Order do
  before do
    @order = PagSeguroV2::Order.new
    @product = {:price => 9.90, :description => "Ruby 1.9 PDF", :id => 1}
  end

  it "should set order id when instantiating object" do
    @order = PagSeguroV2::Order.new("ABCDEF")
    @order.id.should == "ABCDEF"
  end
end
