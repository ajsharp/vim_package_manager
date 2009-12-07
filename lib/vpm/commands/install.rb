require 'fileutils'

module Vpm
  module Commands
    class Install < Vpm::Command
      attr_reader :plugin_name

      def initialize(args)
        @plugin_name = args.shift
      end

      def display_results!
        @output = "#{@plugin_name} install successfully" if copy_vim_file(plugin_name).nil?
        $stdout.puts output unless Vpm::Command.muted?
      end

      private
        def copy_vim_file(original)
          FileUtils.cp(File.expand_path(original), File.expand_path("~/.vim/plugin/"))
        end
    end
  end
end
