module Gherkin
  module Formatter
    module Extension
      module Step
        attr_accessor :previous_step, :next_step

        def first?
          previous_step.nil?
        end

        def last?
          next_step.nil?
        end

        def replay formatter
          super
        end

        def next_step= step
          step.previous_step = self
          @next_step = step
        end

        def previous_step= step
          step.next_step = self
          @previous_step = step
        end
      end
    end
  end
end

