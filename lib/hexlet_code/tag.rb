# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(name, attrs = {})
        inner_html = yield if block_given?
        inner_html.nil? ? render_single_tag(name, attrs) : render_paired_tag(name, inner_html, attrs)
      end

      def render_single_tag(name, attrs)
        "<#{name}#{build_attr_str(attrs)}>"
      end

      def render_paired_tag(name, inner_html, attrs)
        "<#{name}#{build_attr_str(attrs)}>#{inner_html}</#{name}>"
      end

      def build_attr_str(attrs)
        attrs
          .map { |key, value| " #{key}=\"#{value}\"" }
          .join
      end
    end
  end
end
