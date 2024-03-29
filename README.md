### Hexlet tests and linter status:
[![Actions Status](https://github.com/SaenkoJr/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/SaenkoJr/rails-project-lvl1/actions)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)
[![ruby-check](https://github.com/SaenkoJr/rails-project-lvl1/actions/workflows/rubocop.yml/badge.svg?branch=main)](https://github.com/SaenkoJr/rails-project-lvl1/actions/workflows/rubocop.yml)

# HexletCode

Form generator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Saenkojr/hexlet_code.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

input -> { type, value, name, class }
textarea -> { value, name, class }
label -> { for, value, class }
form -> { action, method, class }
