module SweetPickler
  class SweetPickler
    def initialize file 
      @ast = Gherkin::Formatter::ModelFormatter.new
      parser = Gherkin::Parser::Parser.new(@ast)
      parser.parse(IO.read(file),file,0)
    end

    def add_feature file
      parser = Gherkin::Parser::Parser.new(@ast)
      parser.parse(IO.read(file),file,0)
    end

    def pretty
      require 'gherkin/formatter/pretty_formatter'
      io = StringIO.new
      pretty = Gherkin::Formatter::PrettyFormatter.new(io, true, false)
      @ast.replay(pretty)
      io.string
    end
  end
end
