# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(model, attrs)
      @model = model
      @attributes = attrs
      @inputs = []
    end

    def state
      pp '=================================================='
      pp 'StAte call'
      pp '=================================================='
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

    def submit(value = 'Save', **attrs)
      @inputs << {
        type: :submit,
        attributes: { value: value, **attrs }
      }
    end
  end
end
