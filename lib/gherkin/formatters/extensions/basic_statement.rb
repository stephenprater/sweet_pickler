require 'active_support/core_ext'

module Gherkin
  module Formatter
    module Model
      class BasicStatement < Hashable
        def initialize_with_extension *args
          $stderr.puts "initializing with extension"
          initialize_without_extension(*args)
          begin
            extension_class = self.class.to_s.split('::').last
            extension_module = Gherkin::Formatter::Extension.const_get(extension_class)
            self.extend extension_module
          rescue NameError
            #there's no extension module for that class
          end
        end
        alias_method_chain :initialize, :extension
      end
    end
  end
end
