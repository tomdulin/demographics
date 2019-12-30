class TheLogzController < ApplicationController
  # GET /the_logz
  # GET /the_logz.json
  def index
    @the_logz = TheLog.all.order(created_at: :desc)
    @the_countz = AggregateKnownYears.call || []
  end
end
