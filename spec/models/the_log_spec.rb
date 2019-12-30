require 'rails_helper'

RSpec.describe TheLog, type: :model do
  let(:math_logistical) { described_class.new(calculation_method: 1) }
  let(:math_exact) { described_class.new(calculation_method: 0) }

  it 'should render enum value for logistical' do
    expect(math_logistical.calculation_method).to eql('logistical')
  end
  
  it 'should render enum value for exact' do
    expect(math_exact.calculation_method).to eql('exact')
  end
end
