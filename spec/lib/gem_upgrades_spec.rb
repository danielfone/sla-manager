RSpec.describe GemUpgrades do

  it 'should return a hash of upgrade data' do
    expect(GemUpgrades.parse example).to eq({
      "bcrypt" => {
        from: Gem::Version.new("3.1.7"),
        to:   Gem::Version.new("3.1.9"),
      },
      "mime-types" => {
        from: Gem::Version.new("2.1.0"),
        to:   Gem::Version.new("2.5.0"),
      },
    })
  end

  def example
    <<-LOGS
    Using rake 10.3.2
    Installing mime-types 2.4.3 (was 2.4.2)
    Installing mime-types 2.4.2 (was 2.1.0)
    Installing mime-types 2.5.0 (was 2.4.3)
    Using bcrypt 3.1.9 (was 3.1.7)
    LOGS
  end
end
