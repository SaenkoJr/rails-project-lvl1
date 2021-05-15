# frozen_string_literal: true

module HexletCode
  class Renderer
    class << self
      def render(ast)
        tag = ast[:tag]
        tag_type = ast[:tag_type]
        meta = ast[:meta]
        children = ast[:children]

        if tag_type == :paired
          render_paired_tag(tag, children, **meta)
        else
          render_single_tag(tag, meta)
        end
      end

      private

      def render_paired_tag(tag, _children, body:, **attrs)
        open_tag = "<#{tag}#{build_attr_string(attrs)}>"
        close_tag = "</#{tag}>"

        return [open_tag, body, close_tag].join unless body.nil?

        [
          "<#{tag}#{build_attr_string(attrs)}>",
          "</#{tag}>"
        ].join('\n')
      end

      def render_single_tag(tag, attrs)
        "<#{tag}#{build_attr_string(attrs)}>"
      end

      def build_attr_string(attrs)
        attrs
          .map { |key, value| " #{key}=\"#{value}\"" }
          .join
      end
    end
  end
end
