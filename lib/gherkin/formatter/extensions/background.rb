module Gherkin
  module Formatter
    module Extension
      module Background
        def steps
          @steps ||= []
        end

        def replay formatter
          super
          steps.each do |step|
            step.replay(formatter)
          end
        end
      end
    end
  end
end

