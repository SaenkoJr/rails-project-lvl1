# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @ast = HexletCode::AST.build('form', type: :paired, action: '#', method: 'post') do |children|
      children << HexletCode::AST.build(tag: :input, type: :single, as: :string)
    end
  end

  def test_render
    result = HexletCode::Renderer.render(@ast)
    expected = File.read('fixtures/form.html').strip.gsub("\n", '\\n')

    assert_equal expected, result
  end
end
