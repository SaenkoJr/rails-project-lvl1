# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attrs = {})
      body = yield if block_given?

      tag = Tag.new(name, body: body, **attrs)
      ast = tag.build_ast

      HexletCode::Renderer.render(ast)
    end

    def initialize(name, body: nil, **attrs)
      @name = name
      @body = body
      @attrs = attrs
    end

    def build_ast
      if @body.nil?
        HexletCode::AST.build(@name, :single, **@attrs)
      else
        HexletCode::AST.build(@name, :paired, body: @body, **@attrs)
      end
    end
  end
end
