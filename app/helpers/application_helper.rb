module ApplicationHelper

  def parse_note(entry)
    case entry.entry_type
    when 'gems'
      describe_gem_upgrades entry.note
    else
      first_line entry.note
    end
  end

  def first_line(string)
    lines = String(string).split("\n")
    initial = truncate lines.first, length: 100
    more = lines.count > 1 ? content_tag(:span, "+ #{lines.count-1} more lines", class: 'text-muted') : ""
    safe_join [initial, more.html_safe]
  end

  def describe_gem_upgrades(note)
    upgrades = GemUpgrades.parse(note)
    return first_line(note) if upgrades.empty?

    first_gem_name, first_gem_versions = upgrades.first
    initial = "#{first_gem_name}: #{first_gem_versions[:from]} → #{first_gem_versions[:to]}\n"
    more =  upgrades.count > 1 ? content_tag(:span, "+ #{upgrades.count-1} more gems", class: 'text-muted') : ""
    safe_join [initial, more.html_safe]
  end

  def time_ago_or_nil(datetime)
    datetime ? time_ago_span(datetime) : content_tag(:span, '-', class: 'text-muted')
  end

  def time_ago_span(datetime)
    content_tag :span, "#{time_ago_in_words datetime} ago", title: datetime
  end

  def render_month(date)
    date.strftime '%b %Y'
  end

 def submenu_item(name, target, active=nil)
    active = request.fullpath == target if active.nil?
    html_class = active ? 'active' : ''
    content_tag :li, class: html_class do
      link_to name, target
    end
  end

end
