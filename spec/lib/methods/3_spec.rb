require 'interview_helper'

describe '#reverse_order' do
  it { expect(reverse_order([1, 5, 7, 3, 0])).to eq [7, 5, 3, 1, 0] }
  it { expect(reverse_order([7, 4, 5])).to eq       [7, 5, 4]       }
  it { expect(reverse_order([-1, -5, 3])).to eq     [3, -1, -5]     }
end
