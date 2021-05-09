# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/form'

module HexletCode
  class << self
    def form_for(model)
      HexletCode::Tag.build('form', action: '#', method: 'post') do
        inputs = yield HexletCode::Form.new(model)
        inputs.join
      end
    end
  end
end
