require 'rails_helper'

RSpec.describe "the_logz/index", type: :view do
  before(:each) do
    assign(:the_logz, [
      TheLog.create!(
        :year => 2,
        :population => ""
      ),
      TheLog.create!(
        :year => 2,
        :population => ""
      )
    ])
  end

  it "renders a list of the_logz" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
