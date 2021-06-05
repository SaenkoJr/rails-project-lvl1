# frozen_string_literal: true

module HexletCode
  module Tags
    class TextArea
      class << self
        DEFAULT_ATTRIBUTES = {
          cols: 20,
          rows: 40
        }.freeze

        def render(value: '', **attrs)
          pp '=================================================='
          pp 'textarea build'
          pp value
          pp '=================================================='
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          Tag.build('textarea', attributes) { value }
        end
      end
    end
  end
end
