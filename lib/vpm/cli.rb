require 'optparse'

module Vpm
  class Cli
    def self.start(args)
      puts "Starting vpm"
      Vpm::Command.new(args)
    end
  end
end
