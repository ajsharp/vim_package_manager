When /^I run vpm$/ do
  system "./bin/vpm > tmp"
  #run "./bin/vpm"
end

Then /^I should see "(.+)"$/ do |output|
  f = File.new("./tmp")
  f.read.should =~ /#{output}/
  f.close
  #last_stdout.should == output
end
