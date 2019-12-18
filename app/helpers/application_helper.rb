module ApplicationHelper
  def to_pst to_date_time
    my_time_string = Time.parse(to_date_time.to_s) + Time.zone_offset("PDT")
    my_time_string.strftime("%D %I:%M %p")
  end

end
