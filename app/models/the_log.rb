class TheLog < ApplicationRecord
  enum calculation_method: %w[exact logistical exponential linear uknown]
end
