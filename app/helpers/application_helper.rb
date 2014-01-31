module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-info"
    end
  end
end
