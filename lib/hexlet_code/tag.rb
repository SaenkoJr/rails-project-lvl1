# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAG_NAMES = %w[img br input].freeze

    def self.build(name, attrs = {})
      body = yield if block_given?

      tag = if single?(name)
              HexletCode::SingleTag.new(name, attrs)
            else
              HexletCode::PairTag.new(name, attrs, body)
            end

      tag.to_s
    end

    def self.single?(name)
      SINGLE_TAG_NAMES.include?(name)
    end
  end

  class SingleTag
    def initialize(name, attrs = {})
      @name = name
      @attrs = attrs
    end

    def build_attr_str
      @attrs
        .map { |key, value| " #{key}=\"#{value}\"" }
        .join
    end

    def to_s
      "<#{@name}#{build_attr_str}>"
    end
  end

  class PairTag
    def initialize(name, attrs = {}, content = '')
      @name = name
      @attrs = attrs
      @content = content
    end

    def build_attr_str
      @attrs
        .map { |key, value| " #{key}=\"#{value}\"" }
        .join
    end

    def to_s
      "<#{@name}#{build_attr_str}>#{@content}</#{@name}>"
    end
  end
end
