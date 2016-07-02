require 'interview_helper'

describe '#order' do
  it { expect(order([1, 5, 7, 3, 0])).to eq [0, 1, 3, 5, 7] }
  it { expect(order([7, 4, 5])).to eq       [4, 5 ,7]       }
  it { expect(order([-1, -5, 3])).to eq     [-5, -1, 3]     }
end
