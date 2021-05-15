# frozen_string_literal: true

require 'hexlet_code/tags/input'
require 'hexlet_code/tags/textarea'

module HexletCode
  class Form
    INPUT_TYPES = {
      string: HexletCode::Tags::Input,
      text: HexletCode::Tags::TextArea
    }.freeze

    DEFAULT_ATTRIBUTES = {
      method: 'post',
      action: '#'
    }.freeze

    def initialize(model, url:, **attrs)
      @model = model
      @attrs = DEFAULT_ATTRIBUTES.merge({ action: url }, **attrs)
      @body = []
    end

    def build_ast
      HexletCode::AST.build('form', :paired, @attrs) do |children|
        children.concat @body
      end
    end

    # rubocop:disable Naming/MethodParameterName
    def input(name, as: :string, **attrs)
      # rubocop:enable Naming/MethodParameterName

      value = @model[name]
      label = HexletCode::Tag.new('label', body: value, for: name).build_ast
      input = INPUT_TYPES[as].new(value: name).build_ast
      @body << label
      @body << input
    end

    def submit(value = 'Save'); end
  end
end
