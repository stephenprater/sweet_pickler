module Gherkin
  module Formatter
    module Extension
      module Feature
        attr_accessor :background

        def scenarios
          scenarios ||= []
        end

        def replay formatter
          super
          scenarios.each do |scen|
            scen.replay(formatter)
          end
        end
      end
    end
  end
end
