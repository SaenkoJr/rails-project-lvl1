# frozen_string_literal: true

module HexletCode
  module Tags
    class Form
      DEFAULT_ATTRIBUTES = {
        action: '#',
        method: 'post'
      }.freeze

      class << self
        def build(value: '', **attrs)
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          Tag.build('form', attributes) { value }
        end
      end
    end
  end
end
