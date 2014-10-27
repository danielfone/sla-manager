module GemUpgrades
  module_function

  VERSION_REGEX = /(\S+) ([\d\.]+) \(was ([\d\.]+)\)/

  def parse(text)
    text.scan(VERSION_REGEX).each_with_object({}) do |match, hash|
      gem_name = match[0]
      from = Gem::Version.new(match[2])
      to   = Gem::Version.new(match[1])

      hash[gem_name] = update_versions hash[gem_name], from, to
    end
  end

  def update_versions(original, from, to)
    if original.nil?
      {from: from, to: to}
    else
      original[:from] = from if original[:from] >= from
      original[:to]   = to   if to              >= original[:to]
      original
    end
  end
end
