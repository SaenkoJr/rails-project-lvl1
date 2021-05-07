# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(_target)
    ['<form action="#" method="post">', '</form>'].join('\n')
  end
end
