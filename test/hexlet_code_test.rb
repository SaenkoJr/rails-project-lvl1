# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    expected = File.read('fixtures/form.html').lines.map(&:strip).join

    result = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    assert_equal expected, result
  end
end
