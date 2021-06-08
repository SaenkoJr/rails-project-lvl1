# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  include Rails::Dom::Testing::Assertions

  def test_tag_build
    assert_dom_equal '<input type="submit" value="Save">',
                     HexletCode::Tag.build('input', type: 'submit', value: 'Save')

    assert_dom_equal '<label for="email">Email</label>',
                     HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end
end
