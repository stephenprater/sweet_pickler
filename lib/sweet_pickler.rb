require "sweet_pickler/version"

require 'gherkin'
require 'gherkin/formatter/model_formatter'
require 'gherkin/parser/parser'

module SweetPickler
  # Your code goes here...
  autoload :SweetPickler, 'sweet_pickler/sweet_pickler'

  def pickle file
    SweetPickler.new(file)
  end
  module_function :pickle
end

module OtherThing
  def okay
    puts "yeah, I'm okay"
  end
  module_function :okay
end