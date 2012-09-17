require File.expand_path(File.dirname(__FILE__) + '/../spec/spec_helper')
require 'sweet_pickler'
require 'debugger'


describe SweetPickler do
  before do
    test_feature = File.expand_path(File.dirname(__FILE__)) + '/../spec/features/test.feature' 
    @sweet_pickler = SweetPickler.pickle(test_feature)
  end

  it "should detect the project" do
    @sweet_pickler.project.should == "/whatever"
  end
end
