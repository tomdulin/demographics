require 'rails_helper'

RSpec.describe "the_logz/index", type: :view do
  before(:each) do
    assign(:the_logz, [
      TheLog.create!(
        :year => 1990,
        :population => "",
        :calculation_method => 0
      ),
      TheLog.create!(
        :year => 2,
        :population => "",
        :calculation_method => 1
      )
    ])
    assign(:the_countz, [
      [1990,1]
    ])
  end

  it "renders a list of the_logz" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 1
    assert_select "tr>td", :text => "".to_s, :count => 2
  end

end
