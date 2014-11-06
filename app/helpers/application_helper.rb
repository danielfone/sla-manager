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

end
