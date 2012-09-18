require File.expand_path(File.dirname(__FILE__) + '/../spec/spec_helper')
require 'sweet_pickler'


require 'pry'

describe SweetPickler do
  before do
    @test_feature = File.expand_path(File.dirname(__FILE__)) + '/../spec/features/test.feature' 
    @sweet_pickler = SweetPickler.pickle(@test_feature)
  end

  it "should parse a feature file correctly and be able to output it again" do
    @sweet_pickler.pretty.should == IO.read(@test_feature) 
  end

  it "should be able to add a feature to the file all model like" do
    @sweet_pickler.feature.build "Generated Feature" do
      comments = "I am a programmatically generated feature"
      tags = "tag 3"
      description = <<-DESC
      In order to see if I can programmatically generate a feature
      as a test
      i am going to add this one
      DESC
    end
  end
end
