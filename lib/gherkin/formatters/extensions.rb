require 'gherkin/formatters/extensions/basic_statement'

module Gherkin
  module Formatter
    module Extension
      autoload :Background,        'gherkin/formatters/extensions/background'
      autoload :Feature,           'gherkin/formatters/extensions/feature'
      autoload :Scenario,          'gherkin/formatters/extensions/scenario'
      autoload :ScenarioOutline,   'gherkin/formatters/extensions/scenario_outline'
      autoload :Step,              'gherkin/formatters/extensions/step'
    end
  end
end

