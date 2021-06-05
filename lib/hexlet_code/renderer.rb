# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Tags, 'hexlet_code/tags/tags'

  class Renderer
    class << self
      def render(state)
        type, attributes = state.values_at(:type, :attributes)
        tag = Tags.select_by_type(type)

        pp '=================================================='
        pp tag
        pp state
        pp '=================================================='
        if type == :form
          value = state[:inputs]
                  .map { |input| render(input) }
                  .flatten
                  .join

          return tag.render(value: value, **attributes)
        end

        tag.render(**attributes)
      end
    end
  end
end
