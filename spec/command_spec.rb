require 'spec_helper'

module Vpm
  
  describe Command do
    before :each do
      @command = Vpm::Command.new ['list']
    end
    
    it "should save the command passed in" do
      @command.command.should == 'list'
    end
  end
  
end