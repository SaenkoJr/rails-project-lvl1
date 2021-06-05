# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', job: 'hexlet')
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    expected = File.read('test/fixtures/form.html').strip

    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    assert_equal expected, result
  end

  def test_form_for_with_attributes
    expected = File.read('test/fixtures/form2.html').strip

    result = HexletCode.form_for @user, url: '/somewhere' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 20
      f.submit 'Wow'
    end

    assert_equal expected, result
  end
end
