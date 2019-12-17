class ApplicationController < ActionController::Base
  # generic dry ajax show
  def ajax_data(show_container_id = 'results_container')
    render template: 'shared/_ajax_data.js',
           locals: { show_container_id: show_container_id,
                     show_path: "#{controller_name}/show" }
  end
end
