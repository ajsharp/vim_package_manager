require 'spec_helper'

describe Vpm::Commands::Search, "-l" do
  before :each do
    Vpm::Command.muted = true
    @list = Vpm::Commands::List.new

    Vpm::Commands::List.stub(:new).
      and_return(mock("List", :entries => ['surround.vim', 'rails.vim']))
  end

  it "should have a @query variable which captures the query string" do
    @search = Vpm::Commands::Search.new(["-l", "surround"])
    @search.query.should == "surround"
  end

  it "should still capture the query string if the -l or -r flag is left out" do
    pending
  end

  it "should search local plugins that match the string" do
    @search = Vpm::Commands::Search.new(["-l", "surround"])
    @search.results.should == ["surround.vim"]
  end

  it "should return surround.vim and rails.vim when i search 's'" do
    @search = Vpm::Commands::Search.new(["-l", "s"])
    @search.stub(:installed_plugins).and_return(["surround.vim", "rails.vim"])
    @search.results.should == ["surround.vim", "rails.vim"]
  end

end
