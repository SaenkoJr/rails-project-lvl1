# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_build
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end
end
