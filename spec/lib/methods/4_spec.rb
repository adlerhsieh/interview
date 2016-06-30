n = __FILE__[__FILE__ =~ /\d_spec.rb/]
require 'spec_helper'
require_relative "../../../tmp/methods/#{n}"

describe '#prices' do
  it "lists prices" do
    items = [
      { name: 'laptop', price: 20000 },
      { name: 'mouse',  price: 1500  },
      { name: 'screen', price: 6000  }
    ]
  	expect(prices(items)).to eq [20000, 1500, 6000]
  end
  it "lists prices" do
    items = [
      { name: 'earphones', price: 800  },
      { name: 'keyboard',  price: 2000 },
      { name: 'battery',   price: 200  }
    ]
  	expect(prices(items)).to eq [800, 2000, 200]
  end
end
