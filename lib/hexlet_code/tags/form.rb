# frozen_string_literal: true

module HexletCode
  module Tags
    class Form
      class << self
        DEFAULT_ATTRIBUTES = {
          action: '#',
          method: 'post'
        }.freeze

        def render(value: '', **attrs)
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          Tag.build('form', attributes) { value }
        end
      end
    end
  end
end
