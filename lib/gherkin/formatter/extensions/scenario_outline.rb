module Gherkin
  module Formatter
    module Extension
      module ScenarioOutline 
        def steps
          @steps ||= []
        end

        def examples
          @examples ||= []
        end

        def replay formatter
          super
        
          steps.each do |scen|
            scen.replay(formatter)
          end

          examples.each do |ex|
            ex.replay(formatter)
          end
        end

        def expand
          names = examples.rows.shift.cells
          values = examples.rows.each_with_object [] do |r,memo|
            memo << Hash[names.zip(r.cells)]
          end

          args = @comments, @keyword, @name, @description, @line, @id
          expanded_scenario =  Gherkin::Formatter::Model::Scenario.new(*args)  
          
          values.each do |row|
            current_scenario.steps.each do |step|
              new_step = step.clone

              row.each do |k,v|
                new_step.name.gsub!(/<#{k}>/,v)
              end

              expanded_scenario.new_step new_step
            end
          end
        end
      end
    end
  end
end

