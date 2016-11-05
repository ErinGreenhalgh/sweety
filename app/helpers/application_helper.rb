module ApplicationHelper
  def format_date(date)
    if date.is_a?(String)
      DateTime.parse(date).strftime("%m-%d-%Y")
    else
      date.strftime("%m-%d-%Y")
    end
  end

  def format_as_month(date)
    DateTime.parse(date).strftime("%B %Y")
  end
end
