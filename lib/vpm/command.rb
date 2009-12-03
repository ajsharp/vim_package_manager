module Vpm
  
  class Command
    attr_reader :command
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
  end
  
end