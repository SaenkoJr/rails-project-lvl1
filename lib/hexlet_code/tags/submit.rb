# frozen_string_literal: true

module HexletCode
  module Tags
    class Submit
      class << self
        DEFAULT_ATTRIBUTES = {
          type: 'submit',
          value: 'Save',
          name: 'commit'
        }.freeze

        def render(attrs)
          attributes = DEFAULT_ATTRIBUTES.merge(attrs)
          Tag.build('input', attributes)
        end
      end
    end
  end
end
