require 'spec_helper'
require 'fileutils'

describe Vpm::Commands::Install, "/path/to/file.vim" do
  before :each do
  end

  it "should copy the contents of the directory tree to ~/.vim/plugins" do
    FileUtils.should_receive(:cp).with("/original/path/to/file.vim", "/Users/ajsharp/.vim/plugin").and_return(nil)
    Vpm::Commands::Install.new(["/original/path/to/file.vim"]).execute!
  end
end

describe Vpm::Commands::Install, "/path/to/file.vba" do
  it "should unpack the vimball" do
    pending
  end
end
