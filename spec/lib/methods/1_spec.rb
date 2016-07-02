require 'interview_helper'

describe '#sum' do
  it { expect(sum(1, 4)).to eq 10 }
  it { expect(sum(1, 10)).to eq 55 }
  it { expect(sum(2, 5)).to eq 14 }
end
