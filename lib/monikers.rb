require "monikers/version"

module Monikers
  def initialize
    @dataset = eval(File.read(File.expand_path("../../data/.rb",  __FILE__)))
  end

  def moniker_list(name)
    name_down = name.downcase

    if @dataset.key?(name.downcase)
      return @dataset[name_down]<< name_down
    else
      return Array.new<< name_down
    end
  end

  def moniker_equivalents?(name1, name2)
    name1_down = name1.downcase
    name2_down = name2.downcase

    if name1_down == name2_down
      return true
    end

    if @dataset.key?(name1_down)
      if @dataset[name1_down].include?(name2_down)
        return true
      end
    end

    if @dataset.key?(name2_down)
      if@dataset[name2_down].include?(name1_down)
        return true
      end
    end

    return false
  end
end
