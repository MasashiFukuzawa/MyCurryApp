module ApplicationHelper
  def full_title(page_title="", base_title = "Spiceful days")
    return base_title if page_title.empty?
    "#{page_title} | #{base_title}"
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success", "notice"
        "success"
      when "error", "alert"
        "danger"
      else
        flash_type.to_s
    end
  end
end
