# frozen_string_literal: true

module HexletCode
  autoload :Version, 'hexlet_code/version'
  autoload :Renderer, 'hexlet_code/renderer'
  autoload :Form, 'hexlet_code/form'

  class << self
    def form_for(model, url: '#', **kwargs)
      form = Form.new(model, action: url, **kwargs)
      yield form

      Renderer.render form.state
    end
  end
end
