require 'spec_helper'

describe Vpm::Command do
  it "should have a List command" do
    Vpm::Commands::List.should respond_to(:new)
  end

  it "should have a Search command" do
    Vpm::Commands::Search.should respond_to(:new)
  end
end
