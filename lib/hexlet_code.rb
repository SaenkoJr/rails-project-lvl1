# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/form'
require 'hexlet_code/ast'
require 'hexlet_code/renderer'

module HexletCode
  class << self
    def form_for(model, url: '#')
      form = HexletCode::Form.new(model, url: url)
      yield form

      HexletCode::Renderer.render form.ast
    end
  end
end
