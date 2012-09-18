module Gherkin
  module Formatter
    module Extension
      module Scenario
        attr_writer :tags, :description, :id

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
          $stderr.puts "replaying #{self.id}"
          super
          steps.each do |step|
            step.replay(formatter)
          end
        end
      end
    end
  end
end
