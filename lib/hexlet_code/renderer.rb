# frozen_string_literal: true

module HexletCode
  autoload :Tags, 'hexlet_code/tags/tags'

  class Renderer
    class << self
      def render(state)
        type, attributes = state.values_at(:type, :attributes)
        tag = Tags.select_by_type(type)

        if type == :form
          value = state[:inputs]
                  .map { |input| render(input) }
                  .join

          return tag.render(value: value, **attributes)
        end

        tag.render(**attributes)
      end
    end
  end
end
