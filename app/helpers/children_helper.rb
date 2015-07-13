module ChildrenHelper

  def get_status_class(status)
    status_class_map = {
      "notgiven" => "status_notgiven",
      "skipped" => "status_skipped",
      "duenow" => "status_duenow",
      "given" => "status_given",
    }
    return status_class_map[status]
  end

  def get_vaccination_due_desc(vaccination)
    if vaccination.due_start == vaccination.due_end
      due_end = vaccination.due_end.strftime("%b %e %Y")
      return "on #{due_end}"
    else
      due_start = vaccination.due_start.strftime("%b %e %Y")
      due_end = vaccination.due_end.strftime("%b %e %Y")
      return "between #{due_start} and #{due_end}"
    end
  end
  
end
