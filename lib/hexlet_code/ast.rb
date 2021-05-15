# frozen_string_literal: true

module HexletCode
  class AST
    class << self
      def build(tag, tag_type, options = {})
        {
          tag: tag,
          tag_type: tag_type,
          meta: options,
          children: (yield [] if block_given?)
        }
      end
    end
  end
end
