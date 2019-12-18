require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let!(:a_utc_time){Date.parse("2019-12-18 00:00:14.702034")}

  describe "#to_pst" do
    it "returns pst time" do
      expect(helper.to_pst(a_utc_time)).to eql("12/17/19 05:00 PM")
    end
  end
end
