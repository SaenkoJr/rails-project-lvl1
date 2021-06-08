# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  include Rails::Dom::Testing::Assertions
  # include Rails::Dom::Testing::Assertions::SelectorAssertions

  User = Struct.new(:name, :job, keyword_init: true)

  def setup # rubocop:disable Metrics/MethodLength
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
    render_html @form_with_defaults
    assert_select 'form[method="post"][action="#"]', 1
    assert_select 'form label', 2
    assert_select 'form input', 3
  end

  def test_defaults_attributes
    render_html @form_with_defaults
    assert_select 'form label[for="name"]', 'Name'
    assert_select 'form input[name="name"][value="rob"]', 1
    assert_select 'form input[type="submit"][value="Save"]', 1
  end

  def test_form_textarea
    render_html @form_with_attributes
    assert_select 'form[action="/somewhere"]'
    assert_select 'form label[for="job"]', 'Job'
    assert_select 'form textarea[rows=50][cols=20]', 'hexlet'
  end

  def test_form_submit_tag
    render_html @form_with_attributes
    assert_select 'form input[type="submit"][value="Wow"]', 1
  end

  protected

  def render_html(html)
    fake_render(html)
  end

  def fake_render(content)
    @html_element = Nokogiri::HTML::Document.parse(content)
  end

  def document_root_element
    @html_element.root
  end
end
