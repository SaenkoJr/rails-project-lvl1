# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  include Rails::Dom::Testing::Assertions

  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', job: 'hexlet')
    @form_with_defaults = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    @form_with_attributes = HexletCode.form_for @user, url: '/somewhere' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 20
      f.submit 'Wow'
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tags
    html = render_html @form_with_defaults

    assert_select html, 'form[method="post"][action="#"]' do
      assert_select 'label', 2
      assert_select 'input', 3
    end
  end

  def test_defaults_attributes # rubocop:disable Minitest/MultipleAssertions
    html = render_html @form_with_defaults

    assert_select html, 'form' do
      assert_select 'label[for="name"]', 'Name'
      assert_select 'input[name="name"][value="rob"]', 1
      assert_select 'input[type="submit"][value="Save"]', 1
    end
  end

  def test_form_textarea
    html = render_html @form_with_attributes

    assert_select html, 'form[action="/somewhere"]' do
      assert_select 'label[for="job"]', 'Job'
      assert_select 'textarea[rows=50][cols=20]', 'hexlet'
    end
  end

  def test_form_submit_tag
    html = render_html @form_with_attributes
    assert_select html, 'form input[type="submit"][value="Wow"]', 1
  end

  protected

  def render_html(html)
    fake_render(html)
  end

  def fake_render(content)
    Nokogiri::HTML::Document.parse(content)
  end
end
