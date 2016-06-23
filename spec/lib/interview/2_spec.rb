n = __FILE__[__FILE__ =~ /\d_spec.rb/]
require 'spec_helper'
require_relative "../../../lib/interview/#{n}"

describe '#order' do
  it { expect(order([1, 5, 7, 3, 0])).to eq [0, 1, 3, 5, 7] }
  it { expect(order([7, 4, 5])).to eq       [4, 5 ,7]       }
  it { expect(order([-1, -5, 3])).to eq     [-5, -1, 3]     }
end

describe '#reverse_order' do
  it { expect(reverse_order([1, 5, 7, 3, 0])).to eq [7, 5, 3, 1, 0] }
  it { expect(reverse_order([7, 4, 5])).to eq       [7, 5, 4]       }
  it { expect(reverse_order([-1, -5, 3])).to eq     [3, -1, -5]     }
end