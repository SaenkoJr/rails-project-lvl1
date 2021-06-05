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
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          [
            Tag.build('label', for: attributes[:name]) { attributes[:name].capitalize },
            Tag.build('textarea', attributes) { value }
          ].join
        end
      end
    end
  end
end
