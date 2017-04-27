# CSVundle
[ ![Codeship Status for cometaworks/CSVundle](https://codeship.com/projects/d9fe0ac0-5a29-0133-81d7-0e6f49d10408/status?branch=master)](https://codeship.com/projects/110270)

CSVundle is a utility for Access Terminal. It assists in the generation of CSV's for a given set properties.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csvundle', git: 'https://github.com/accessterminal/csvundle.git', branch: 'master'
```

And then execute:

    $ bundle

## Usage

```ruby
# It is quite a simple utility, with an exposed but uneeded API. In it's final implementation,
# the functionality needed will simply be:
# csv = CSVundle.csv_for(my_data, :lienalytics)
# However, the internal API has an `AccessCSV` class that can be used like so:
csv = CSVundle::AccessCSV.new
csv.colums << ["batHeads", "TOES", "ViciousFoes", "friends", "number of jerrys"]
csv.rows <<   [1, 6, 1, 99, "3.14159365358979323846264338327950288419"]
csv.rows <<   [2, 4, 14, 3, "3.14159365358979323846264338327950288419"]
csv.rows_for("number of jerrys")
# => { "number of jerrys": ["3.14159365358979323846264338327950288419", "3.14159365358979323846264338327950288419"] }
csv.normalized_columns
# => [:bat_heads, :toes, :vicious_foes, :friends, :"number of jerrys"]
csv.viperize(:BatFarts)
# => :bat_farts
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/csvundle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

