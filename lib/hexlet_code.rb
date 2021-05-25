# frozen_string_literal: true

require 'hexlet_code/version'

module HexletCode
  autoload :AST, 'hexlet_code/ast'
  autoload :Renderer, 'hexlet_code/renderer'
  autoload :Form, 'hexlet_code/form'
  autoload :Tag, 'hexlet_code/tag'

  class << self
    def form_for(model, url: '#', **kwargs)
      form = Form.new(model, url: url, **kwargs)
      yield form

      Renderer.render form.ast
    end
  end
end
