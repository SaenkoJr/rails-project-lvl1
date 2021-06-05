# frozen_string_literal: true

module HexletCode
  module Tags
    autoload :Form, 'hexlet_code/tags/form'
    autoload :Input, 'hexlet_code/tags/input'
    autoload :TextArea, 'hexlet_code/tags/textarea'
    autoload :Submit, 'hexlet_code/tags/submit'

    class << self
      TYPES = {
        form: Form,
        string: Input,
        text: TextArea,
        submit: Submit
      }.freeze

      def select_by_type(type)
        TYPES[type]
      end
    end
  end
end
