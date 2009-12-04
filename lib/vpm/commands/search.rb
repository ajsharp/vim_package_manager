module Vpm
  module Commands
    class Search < Vpm::Command
      attr_reader :results, :installed_plugins, :query

      def initialize(args)
        @installed_plugins = Vpm::Commands::List.new.entries
        @query = first_arg_is_query_term?(args) ? args[0] : args[1]
      end


      def display_results!
        $stdout.puts results unless Vpm::Command.muted?
      end

      def results
        merge_with_installed_plugins
      end

      private
        def first_arg_is_query_term?(args)
          args[0].scan(/^[-]/).empty?
        end

        def merge_with_installed_plugins
          installed_plugins.grep(/#{query}/)
        end
      
    end
  end
end
