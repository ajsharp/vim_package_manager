module Vpm
  module Commands
    class List < Vpm::Command      
      def execute!
        display!
      end
      
      def display!
        msg = ["Listing all plugins...\n"]
        msg << entries.join("\n")
        msg << "\nNumber of plugins found = #{entries.size}"
        puts @output = msg.join("\n")
      end
      
      def entries
        @entries ||= remove_hidden(Dir.entries(File.join(ENV['HOME'], ".vim", "plugin")))
      end

      private
        def remove_hidden(contents)
          contents.reject { |entry| entry =~ /^[.]/ }
        end
    end
  end
end