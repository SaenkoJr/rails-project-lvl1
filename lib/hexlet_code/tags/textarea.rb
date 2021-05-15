# frozen_string_literal: true

module HexletCode
  module Tags
    class TextArea < HexletCode::Tag
      DEFAULT_ATTRIBUTES = {
        cols: 20,
        rows: 40
      }.freeze

      def initialize(attrs)
        super('textarea', DEFAULT_ATTRIBUTES.merge(attrs))
      end

      def build_ast
        HexletCode::AST.build(@name, :paired, value: @body, **@attrs)
      end
    end
  end
end
