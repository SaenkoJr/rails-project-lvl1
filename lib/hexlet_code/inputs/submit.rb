# frozen_string_literal: true

module HexletCode
  module Inputs
    class Submit
      DEFAULT_ATTRIBUTES = {
        type: 'submit',
        value: 'Save',
        name: 'commit'
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
