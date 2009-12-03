require 'spec_helper'

module Vpm
  module Commands
    describe List do
      
      before :each do
        Dir.should_receive(:entries).and_return(['vim-ruby', 'surround'])
        @list = Vpm::Commands::List.new
        @list.execute!
      end
      
      it "should return 2 @entries" do
        @list.should have(2).entries
      end
      
      it "should display a list of all of the plugins" do
        @list.output.should == %Q{Listing all plugins...\n
vim-ruby
surround

Number of plugins found = 2}
      end
    end
  end
end