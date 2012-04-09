module Gherkin
  module Formatter
    module Extension
      module Scenario
        def steps
          @steps ||= []
        end

        def new_step step_obj
          unless self.steps.empty?
            step_obj.previous_step = self.steps.last
          end
          self.steps << step_obj
        end

        def replay formatter
          super
          @steps.reach do |step|
            step.replay(formatter)
          end
        end
      end
    end
  end
end
