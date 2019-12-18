require 'rails_helper'

RSpec.describe TheLog, type: :model do
  let(:math_calculated) { described_class.new(calculation_method: 1) }
  let(:math_exact) { described_class.new(calculation_method: 0) }

  it 'should render enum value for calculated' do
    expect(math_calculated.calculation_method).to eql('calculated')
  end
  
  it 'should render enum value for exact' do
    expect(math_exact.calculation_method).to eql('exact')
  end
end
