# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/form'
require 'hexlet_code/ast'
require 'hexlet_code/renderer'

module HexletCode
  class << self
    def form_for(model, url: '#', &block)
      form = HexletCode::Form.new(model, url: url)
      yield form
      pp form.build_ast

      # HexletCode::Renderer.render form.build_ast
    end
  end
end
