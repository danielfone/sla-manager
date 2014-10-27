module ApplicationHelper

  def first_line(string)
    lines = String(string).split("\n")
    initial = truncate lines.first, length: 100
    more = lines.count > 1 ? content_tag(:span, "+ #{lines.count-1} more lines", class: 'text-muted') : ""
    safe_join [initial, more.html_safe]
  end

end
