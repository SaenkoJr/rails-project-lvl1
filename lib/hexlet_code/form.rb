# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(model)
      @model = model
      @inputs = []
    end

    def input(name, attrs = {})
      type = attrs.fetch(:as, :input)
      value = @model[name]
      @inputs << HexletCode::Tag.build('label', for: name) { name.capitalize }
      @inputs << if type == :text
                   HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: name) { value }
                 else
                   HexletCode::Tag.build('input', name: name, type: 'text', value: value)
                 end
    end

    def submit(value = 'Save')
      @inputs << HexletCode::Tag.build('input', name: 'commit', value: value, type: 'submit')
    end
  end
end
