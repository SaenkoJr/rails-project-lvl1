# frozen_string_literal: true

module HexletCode
  module Tags
    class Input < HexletCode::Tag
      DEFAULT_ATTRIBUTES = {
        type: 'text'
      }.freeze

      def initialize(attrs)
        super('input', DEFAULT_ATTRIBUTES.merge(attrs))
      end
    end
  end
end
