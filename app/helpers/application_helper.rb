module ApplicationHelper
  def state_icon(state)
    case state
    when :planned
      "sticky-note"
    when :in_progress
      "wrench"
    when :completed
      "check"
    else
      "exclamation-circle"
    end
  end

  def state_color(state)
    case state
    when :planned
      "#1fa0ff"
    when :in_progress
      "#c17aff"
    when :completed
      "#6dd345"
    else
      "red"
    end
  end
end
