require 'monikers/version'

module Monikers
  # rubocop:disable Security/Eval
  @dataset = eval(File.read(File.expand_path('../lib/data/monikers_hash.rb', __dir__)))
  # rubocop:enable Security/Eval

  def self.list(name)
    name_down = name.downcase

    return @dataset[name_down].dup << name_down if @dataset.key?(name.downcase)

    [] << name_down
  end

  def self.equivalents?(name1, name2)
    name1_down = name1.downcase
    name2_down = name2.downcase

    return true if name1_down == name2_down
    return true if @dataset.key?(name1_down) && @dataset[name1_down].include?(name2_down)
    return true if @dataset.key?(name2_down) && @dataset[name2_down].include?(name1_down)

    false
  end
end
