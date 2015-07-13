module ApplicationHelper
  # returns full page title on a per-page basis
  def full_title(page_title)
    base_title = "ImmuCal"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # returns within-30-day alerts for the current_user
  def current_alerts(user)
    alert_msg = "There are no alerts"
    child_cnt = 0
    due_cnt = 0
    user.children.each do |child|
      curr_due = child.vaccinations.find_all_by_status("duenow")
      if curr_due.count > 0
        child_cnt += 1
        due_cnt += curr_due.count
      end
    end
    if due_cnt > 0
      alert_msg = "You have #{pluralize(due_cnt, "due")} across #{pluralize(child_cnt, "child")}"
    end
    return alert_msg
  end

end
