# Rspec::PendingFor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rspec/pending_for`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-pending_for'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-pending_for

## Usage

To mark a spec pending for a specific ruby engine, and/or versions:

```ruby
it("blah is blah") do
  pending_for(engine: "ruby", version: "2.1.5")
  expect("blah").to eq "blah"
end
```

To skip a spec for a specific ruby engine, and/or versions:

```ruby
it("blah is blah") do
  skip_for(engine: "ruby", version: "2.1.5")
  expect("blah").to eq "blah"
end
```

To mark a spec pending for all versions of a given engine:

```ruby
it("blah is blah") do
  skip_for(engine: "jruby")
  expect("blah").to eq "blah"
end
```

To mark a spec pending for a custom reason (overriding the default message):

```ruby
it("blah is blah") do
  skip_for(engine: "jruby", reason: "This does not work on JRuby")
  expect("blah").to eq "blah"
end
```

To mark a spec pending or skipped for multiple engines and versions, just what you would expect:

```ruby
it("blah is blah") do
  skip_for(engine: "jruby", reason: "This does not work on JRuby so skipping for now") # All JRuby versions will be skipped
  pending_for(engine: "rbx", reason: "This does not work on Rubinius so pending for now") # All rbx versions will be pending
  pending_for(engine: "ruby", versions:%w(1.9.3 2.0.0 2.1.0)) # uses the default message
  expect("blah").to eq "blah"
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-pending_for.

