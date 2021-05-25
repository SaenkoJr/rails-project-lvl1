# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(name, attrs = {})
        body = yield if block_given?

        if body.nil?
          render_single_tag(name, attrs)
        else
          render_paired_tag(name, body: body, **attrs)
        end
      end

      private

      def render_paired_tag(tag, body: '', **attrs)
        open_tag = "<#{tag}#{build_attr_string(attrs)}>"
        close_tag = "</#{tag}>"

        %(#{open_tag}#{body}#{close_tag})
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
