require 'interview_helper'

describe '#plus' do
  it { expect(plus(1, 1)).to eq 2 }
  it { expect(plus(2, 3)).to eq 5 }
  it { expect(plus(5, 5)).to eq 10 }
end
