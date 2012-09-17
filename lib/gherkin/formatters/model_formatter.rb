require 'gherkin/formatters/extensions'

module Gherkin
  module Formatter
    class ModelFormatter
      attr_accessor :project
      attr_reader :uris, :current_uri
      attr_reader :current_feature, :current_scenario, :current_step
      attr_reader :current_background
      
      def initialize
        @uris = {} 
      end

      def uri uri
        @uris[uri] = nil #will always be a feature
        @current_uri = uri
        uri
      end

      def replay formatter
        $stderr.puts "replay formatter"
        features.each do |feature|
          feature.replay(formatter)
        end
      end

      def features
        $stderr.puts "features?"
        uris.values
      end

      def feature feature_obj
        $stderr.puts "feature emit"
        uris[current_uri] = feature_obj
        @current_feature = feature_obj
      end

      def background background_obj
        $stderr.puts "background emit"
        current_feature.background = background_obj
        @current_background = background_obj
      end

      def scenario scenario_obj
        $stderr.puts "scenario emit"
        current_feature.scenarios << scenario_obj
        @current_scenario = scenario_obj 
      end

      # do we want to expand this here or convert it into steps
      # so that we wind up with multiple todos. i think maybe the latter
      def scenario_outline scenario_outline_obj
        $stderr.puts "scenario outline emit"
        current_feature.scenarios << scenario_outline_obj
        @current_scenario = scenario_outline_obj
      end

      def examples examples_obj
        $stderr.puts "examples emit"
        current_scenario.examples << examples_obj
        #examples is always the last thing
        @current_scenario = nil
      end

      def tag tag_obj
        $stderr.puts "tag emit"
        debugger
      end

      def step step_obj
        $stderr.puts "step emit"
        if current_scenario
          current_scenario.steps << step_obj
        elsif current_background
          current_background.steps << step_obj
        end
      end
      
      def eof
      end
    end
  end
end

