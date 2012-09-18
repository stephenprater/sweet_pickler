require 'active_support/core_ext'

module Gherkin
  module Formatter
    module Model
      class BasicStatement < Hashable
        attr_writer :comments, :keyword, :name

        class << self
          def build klass, holder
            klass.new(*holder.values)
          end
        end

        def initialize_with_extension *args
          initialize_without_extension(*args)
          
          begin
            extension_class = self.class.to_s.split('::').last
            extension_module = Gherkin::Formatter::Extension.const_get(extension_class)
            # we have to use extend to override the instance methods
            # since modules go in after those defined in the class
            self.extend extension_module
            unless self.class.respond_to? :build
              self.class.extend extension_module::ClassMethods
            end
          rescue NameError
            #there's no extension module for that class
          end
        end
        alias_method_chain :initialize, :extension
      end
    end
  end
end
