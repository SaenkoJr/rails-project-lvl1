# frozen_string_literal: true

module HexletCode
  class Renderer
    class << self
      def render(ast)
        tag, tag_type, meta, children = ast.values_at(:tag, :tag_type, :meta, :children)
        inner_text = meta.delete(:inner_text) { '' }

        return HexletCode::Tag.build(tag, meta) if tag_type == :single
        return HexletCode::Tag.build(tag, meta) { inner_text } if children.nil?

        HexletCode::Tag.build(tag, meta) do
          children.map { |child| HexletCode::Renderer.render(child) }
                  .flatten
                  .join
        end
      end
    end
  end
end
