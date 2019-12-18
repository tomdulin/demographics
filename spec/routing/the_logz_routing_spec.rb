require 'rails_helper'

RSpec.describe TheLogzController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/the_logz').to route_to('the_logz#index')
    end
  end
end
