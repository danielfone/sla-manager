module GemUpgrades
  module_function

  VERSION_REGEX = /(\S+) ([\d\.]+) \(was ([\d\.]+)\)/

  def parse(text)
    upgrades = text.scan(VERSION_REGEX).each_with_object({}) do |(gem_name, to, from), hash|
      hash[gem_name] ||= Upgrades.new
      hash[gem_name].all_from << from
      hash[gem_name].all_to << to
    end

    upgrades.update(upgrades) { |_, upgrade| upgrade.as_hash }
  end

  class Upgrades
    attr_reader :all_from, :all_to

    VERSIONIFY = lambda { |v| Gem::Version.new v }

    def initialize
      @all_from = []
      @all_to = []
    end

    def from
      from_versions.min.to_s
    end

    def to
      to_versions.max.to_s
    end

    def from_versions
      @from_versions ||= all_from.map &VERSIONIFY
    end

    def to_versions
      @to_versions ||= all_to.map &VERSIONIFY
    end

    def as_hash
      {
        from: from,
        to: to,
      }
    end
  end

end
