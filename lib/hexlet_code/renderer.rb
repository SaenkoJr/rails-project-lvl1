# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Tags, 'hexlet_code/tags/tags'

  class Renderer
    class << self
      def render(state)
        type, attributes = state.values_at(:type, :attributes)
        tag = Tags.select_by_type(type)

        if type == :form
          value = state[:inputs]
                  .map { |input| render(input) }
                  .flatten
                  .join

          return tag.build(value: value, **attributes)
        end

        pp '=================================================='
        pp tag
        pp attributes
        pp '=================================================='
        tag.build(attributes)
      end
    end
  end
end
