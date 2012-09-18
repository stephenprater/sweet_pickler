require 'active_support/concern'

module Gherkin
  module Formatter
    module Extension
      module Feature
        extend ActiveSupport::Concern

        module ClassMethods
          def build name, &block
            feature_holder = Struct.new(
              comments: [],
              tags: [],
              description: "",
              keyword: "Feature",
              name: name,
            )
            proxy_feature.instance_eval(&block)
          end
        end
        
        attr_accessor :background

        def scenarios
          @scenarios ||= []
        end

        def replay formatter
          super

          background and background.replay(formatter)

          scenarios.each do |scen|
            scen.replay(formatter)
          end
        end
      end
    end
  end
end
