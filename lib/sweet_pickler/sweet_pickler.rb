require 'forwardable'

module SweetPickler
  class SweetPickler
    extend Forwardable

    def_delegators :@ast, :features, :feature

    def initialize file 
      @ast = Gherkin::Formatter::ModelFormatter.new
      parser = Gherkin::Parser::Parser.new(@ast)
      parser.parse(IO.read(file),file,0)
    end

    def add_feature file
      parser = Gherkin::Parser::Parser.new(@ast)
      parser.parse(IO.read(file),file,0)
    end

    def pretty color = false
      require 'gherkin/formatter/pretty_formatter'
      io = StringIO.new
      pretty = Gherkin::Formatter::PrettyFormatter.new(io, !color, false)
      @ast.replay(pretty)
      pretty.replay
      io.string
    end
  end
end
