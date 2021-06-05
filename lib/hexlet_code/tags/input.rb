# frozen_string_literal: true

module HexletCode
  module Tags
    class Input
      class << self
        DEFAULT_ATTRIBUTES = {
          type: 'text'
        }.freeze

        def render(attrs)
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          [
            Tag.build('label', for: attributes[:name]) { attributes[:name].capitalize },
            Tag.build('input', attributes)
          ].join
        end
      end
    end
  end
end
