require 'gherkin/formatter/extensions/basic_statement'

module Gherkin
  module Formatter
    module Extension
      autoload :Background,        'gherkin/formatter/extensions/background'
      autoload :Feature,           'gherkin/formatter/extensions/feature'
      autoload :Scenario,          'gherkin/formatter/extensions/scenario'
      autoload :ScenarioOutline,   'gherkin/formatter/extensions/scenario_outline'
      autoload :Step,              'gherkin/formatter/extensions/step'
    end
  end
end

