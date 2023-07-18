# CapybaraHaveTableRow

Adds the matcher `have_table_row` to rspec capybara.

## Usage

Expectations are written as `expect(table).to have_table_row({"A" => "A1", "B" => "B1"})`

an array of row values can also be matched `expect(table).to have_table_row(["A1", "B1"])`

Note: because of the way that matchers splat keyword arguments upstream you must pass a hash if you wish to match headers. 
This: `have_table_row("A" => "A1", "B" => "B1")` will not work.

Provides a nice table print out if the matcher fails.
```bash
expected to find table_row {"A"=>"wrong", "B"=>"B1"} within #<Capybara::Node::Simple tag="table" path="/html/body/table[2]"> but there were no matches in: 

      +----+----+----+
      | D  | E  | F  |
      +----+----+----+
      | D1 | E1 | C1 |
      +----+----+----+
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capybara_have_table_row. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/capybara_have_table_row/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CapybaraHaveTableRow project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/capybara_have_table_row/blob/main/CODE_OF_CONDUCT.md).
