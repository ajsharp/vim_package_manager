module Vpm
  module Commands
    # Use `vpm list` to get a listing of currently installed plugins
    class List < Vpm::Command
      def display_results!
        @output = build_message
        $stdout.puts @output unless Vpm::Command.muted?
      end
      
      def entries
        @entries ||= remove_hidden(vim_plugins)
      end

      private
        def build_message
          msg = ["Listing all plugins...\n"]
          msg << entries.join("\n")
          msg << "\nNumber of plugins found = #{entries.size}"
          msg.join("\n")
        end

        def vim_plugins
          Dir.entries(File.join(ENV['HOME'], ".vim", "plugin"))
        end

        def remove_hidden(contents)
          contents.reject { |entry| entry =~ /^[.]/ }
        end
    end
  end
end
