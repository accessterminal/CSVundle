# CSVundle
CSVundle is a utility for Access Terminal. It assists in the generation of CSV's for a given set properties.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csvundle', git: 'https://github.com/cometaworks/csvundle.git', :branch => 'master'
```

And then execute:

    $ bundle

## Usage
The API is in progress. Currently, these features are supported:

- Know proper liencloud csv format headers
- Know proper lumentum csv format headers
- Normalize column names to ruby style (lower-case snakecase)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/csvundle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

