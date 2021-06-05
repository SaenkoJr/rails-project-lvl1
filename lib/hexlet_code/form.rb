# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(model, attrs)
      @model = model
      @attributes = attrs
      @inputs = []
    end

    def state
      {
        type: :form,
        attributes: @attributes,
        inputs: @inputs
      }
    end

    def input(name, as: :string, **attrs) # rubocop:disable Naming/MethodParameterName
      value = @model[name]
      @inputs << {
        type: as,
        attributes: { value: value, name: name, **attrs }
      }
    end

    def submit(attrs = {})
      @inputs << { type: :submit, attributes: attrs }
    end
  end
end
