# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    expected = ['<form action="#" method="post">', '</form>'].join('\n')
    assert_equal expected, HexletCode.form_for(name: 'bob')
  end
end
