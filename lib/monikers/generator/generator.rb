require 'pp'

module Monikers
  module Generator
    CSV_FILE_PATH = '../../data/monikers_list.csv'.freeze
    OUT_FILE_PATH = '../../data/monikers_hash.rb'.freeze

    def self.generate_cache
      monikers = Hash.new

      File.open(Monikers::Generator::CSV_FILE_PATH, 'r') do |file_handle|
        file_handle.each do |line|
          split_line = line.split(/,/)

          name = split_line[1].strip.downcase
          moniker = split_line[2].strip.downcase

          if monikers.key?(name)
            if !monikers[name].include?(moniker)
              monikers[name]<< moniker
            end
          else
            monikers[name] = Array.new<< moniker
          end

          if monikers.key?(moniker)
            if !monikers[moniker].include?(name)
              monikers[moniker]<< name
            end
          else
            monikers[moniker] = Array.new<< name
          end
        end
      end

      File.open(OUT_FILE_PATH, 'w') { |out_file| PP.pp(monikers, out_file) }

      return monikers
    end

  end
end