class TheLog < ApplicationRecord
  enum calculation_method: %w[exact calculated]
end
