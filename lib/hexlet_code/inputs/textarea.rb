# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextArea
      DEFAULT_ATTRIBUTES = {
        cols: 20,
        rows: 40
      }.freeze

      def initialize(value: '', **attrs)
        @name = 'textarea'
        @attrs = DEFAULT_ATTRIBUTES.merge({ inner_text: value }, attrs)
      end

      def ast
        HexletCode::AST.build(@name, :paired, @attrs)
      end
    end
  end
end
