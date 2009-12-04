require 'spec_helper'

module Vpm
  module Commands
    describe List do
      
      before :each do
        Vpm::Command.muted = true
        Dir.should_receive(:entries).and_return(['vim-ruby', 'surround'])
        @list = Vpm::Commands::List.new
      end

      it "should not output anything if muted is set" do
        @list.execute!
      end
      
      it "should return 2 @entries" do
        @list.execute!.should have(2).entries
      end

      it "should have an array of installed plugins" do
        @list.execute!.entries.should be_instance_of Array
      end
      
      it "should display a list of all of the plugins" do
        @list.execute!.output.should == %Q{Listing all plugins...\n
vim-ruby
surround

Number of plugins found = 2}
      end
    end
  end
end
