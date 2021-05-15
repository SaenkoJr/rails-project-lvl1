# frozen_string_literal: true

module HexletCode
  module Inputs
    class Input
      DEFAULT_ATTRIBUTES = {
        type: 'text'
      }.freeze

      def initialize(attrs)
        @name = 'input'
        @attrs = DEFAULT_ATTRIBUTES.merge(attrs)
      end

      def ast
        HexletCode::AST.build(@name, :single, @attrs)
      end
    end
  end
end
