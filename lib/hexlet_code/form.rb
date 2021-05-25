# frozen_string_literal: true

require 'hexlet_code/inputs/input'
require 'hexlet_code/inputs/textarea'
require 'hexlet_code/inputs/submit'

module HexletCode
  class Form
    INPUT_TYPES = {
      string: HexletCode::Inputs::Input,
      text: HexletCode::Inputs::TextArea
    }.freeze

    DEFAULT_ATTRIBUTES = {
      action: '#',
      method: 'post'
    }.freeze

    def initialize(model, url:, **attrs)
      @model = model
      @attrs = DEFAULT_ATTRIBUTES.merge({ action: url }, **attrs)
      @body = []
    end

    def ast
      AST.build('form', :paired, @attrs) do |children|
        children.concat @body
      end
    end

    def input(name, as: :string, **attrs) # rubocop:disable Naming/MethodParameterName
      value = @model[name]
      label = AST.build('label', :paired, inner_text: name.capitalize, for: name)
      input = INPUT_TYPES[as].new(value: value, name: name, **attrs).ast
      @body << label
      @body << input
    end

    def submit(attrs = {})
      @body << HexletCode::Inputs::Submit.new(attrs).ast
    end
  end
end
