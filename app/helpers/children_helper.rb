module ChildrenHelper

  def get_status_color_class(status)
    if status == "given"
      return "vacc_given"
    elsif status == "duenow"
      return "vacc_due"
    elsif status == "skipped"
      return "vacc_skipped"
    else
      return "vacc_notgiven"
    end
  end
end
