# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_ast_build
    ast = HexletCode::AST.build('form', :paired, action: '#', method: 'post')
    expected = {
      tag: 'form',
      tag_type: :paired,
      meta: { action: '#', method: 'post' },
      children: nil
    }

    assert_equal expected, ast
  end

  def test_ast_with_block
    ast = HexletCode::AST.build(:form, :paired, action: '#', method: 'post') do |children|
      children << HexletCode::AST.build(:input, :single, value: 'hexlet')
    end

    expected = {
      tag: :form,
      tag_type: :paired,
      meta: { action: '#', method: 'post' },
      children: [
        {
          tag: :input,
          tag_type: :single,
          meta: { value: 'hexlet' },
          children: nil
        }
      ]
    }

    assert_equal expected, ast
  end
end
