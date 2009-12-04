module Vpm
  
  class Command
    @@muted = false
    attr_accessor :output
    
    def execute!
      display_results!
      self
    end
    
    def self.execute_command!(argv)
      command = argv.shift
      case command
      when 'list'
        Vpm::Commands::List.new.execute!
      when 'search'
        Trollop::options do
          banner "Usage: search [option] term"
          opt :local, "Search for local plugins", :short => "-l"
        end
        Vpm::Commands::Search.new(argv).execute! unless args.first == "-h"
      else
        Trollop::die "Unknown subcommand #{command}"
      end
    end

    def self.muted?
      @@muted
    end

    def self.muted=(mute)
      @@muted = mute
    end
  end
  
end
