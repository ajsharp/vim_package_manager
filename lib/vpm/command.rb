module Vpm
  
  class Command
    @@muted = false
    attr_accessor :output
    
    def initialize(*args)
      args.flatten!
      @command = args.shift
      @output  = ""
      execute!
    end
    
    def execute!
      case @command
      when 'list'
        Vpm::Commands::List.new
      else
        fail "Command #{@command} not recognized!"   
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
