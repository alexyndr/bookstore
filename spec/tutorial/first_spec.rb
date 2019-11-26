# RSpec.describe "When the method is called multiple times" do
#   it "returns the specified values in order, then keeps returning the last value" do
#     dbl = double
#     allow(dbl).to receive(:foo)

#     expect(dbl.foo).to eq(1)
#   end
# end

RSpec.describe 'test' do
  shared_example 'a collection object' do
    expect(collection.to_a).to eq([1])
  end

  describe '<<' do
    let(:collection) { Array.new }

    it 'adds objects to the end of the collection' do
      collection << 1
      it_behaves_like 'a collection object'
    end
  end
end