# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_build
    assert_equal '<div></div>', HexletCode::Tag.build('div')
    assert_equal '<p></p>', HexletCode::Tag.build('p')
    assert_equal '<img>', HexletCode::Tag.build('img')
  end

  def test_build_with_attributes
    assert_equal '<label for="email"></label>', HexletCode::Tag.build('label', for: 'email')
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal '<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image')
  end

  def test_build_with_attributes_and_bodies
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end
end
