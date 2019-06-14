require 'pp'

module Monikers
  module Generator
    CSV_FILE_PATH = '../../data/monikers_list.csv'.freeze
    OUT_FILE_PATH = '../../data/monikers_hash.rb'.freeze

    def self.generate_cache
      monikers = {}

      File.open(Monikers::Generator::CSV_FILE_PATH, 'r') do |file_handle|
        file_handle.each do |line|
          split_line = line.split(/,/)

          name = split_line[1].strip.downcase
          moniker = split_line[2].strip.downcase

          if monikers.key?(name)
            monikers[name] << moniker unless monikers[name].include?(moniker)
          else
            monikers[name] = [] << moniker
          end

          if monikers.key?(moniker)
            monikers[moniker] << name unless monikers[moniker].include?(name)
          else
            monikers[moniker] = [] << name
          end
        end
      end

      File.open(OUT_FILE_PATH, 'w') { |out_file| PP.pp(monikers, out_file) }

      monikers
    end
  end
end
