
module Vpm
  class Cli
    def self.start(argv)
      Vpm::Command.execute_command!(argv)
    end
  end
end

Trollop::options do
  version "Vim Package/Plugin Manager by Alex Sharp\n"
  banner <<-EOS
  Usage: vpm [options] command [command options]

  EOS

  opt :dry_run, "Don't actually do anything", :short => "-p"
  stop_on ['list', 'search']
end


