# Rspec::PendingFor

Easiest to just show you:

```ruby
it("blah is blah") do
  pending_for(engine: "ruby", version: "2.1.5")
  pending_for(engine: "jruby", version: "2.2.2")
  expect("blah").to eq "blah"
end
```

Requires Ruby 1.9+ (any engine)

| Project                 |  Rspec::PendingFor |
|------------------------ | ------------------ |
| gem name                |  rspec-pending_for |
| license                 |  MIT               |
| version                 |  [![Gem Version](https://badge.fury.io/rb/rspec-pending_for.png)](http://badge.fury.io/rb/rspec-pending_for) |
| dependencies            |  [![Dependency Status](https://gemnasium.com/pboling/rspec-pending_for.png)](https://gemnasium.com/pboling/rspec-pending_for) |
| code quality            |  [![Code Climate](https://codeclimate.com/github/pboling/rspec-pending_for.png)](https://codeclimate.com/github/pboling/rspec-pending_for) |
| inline documenation     |  [![Inline docs](http://inch-ci.org/github/pboling/rspec-pending_for.png)](http://inch-ci.org/github/pboling/rspec-pending_for) |
| continuous integration  |  [![Build Status](https://secure.travis-ci.org/pboling/rspec-pending_for.png?branch=master)](https://travis-ci.org/pboling/rspec-pending_for) |
| homepage                |  [https://github.com/pboling/rspec-pending_for][homepage] |
| documentation           |  [http://rdoc.info/github/pboling/rspec-pending_for/frames][documentation] |
| author                  |  [Peter Boling](https://coderbits.com/pboling) |
| Spread ~♡ⓛⓞⓥⓔ♡~      |  [![Endorse Me](https://api.coderwall.com/pboling/endorsecount.png)](http://coderwall.com/pboling) |

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

The gem auto-configures itself for use in your Rspec suite.  Just use it!

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


## Authors

[Peter H. Boling][peterboling] of [Rails Bling][railsbling] is the author.

## Contributors

See the [Network View](https://github.com/pboling/rspec-pending_for/network) and the [CHANGELOG](https://github.com/pboling/rspec-pending_for/blob/master/CHANGELOG.md)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
6. Create new Pull Request

Bug reports and pull requests are welcome on GitHub at https://github.com/pboling/rspec-pending_for.

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver].
Violations of this scheme should be reported as bugs. Specifically,
if a minor or patch version is released that breaks backward
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a
dependency on this gem using the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example:

    spec.add_dependency 'rspec-pending_for', '~> 1.1'

## Legal

* MIT License - See LICENSE file in this project
* Copyright (c) 2015 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74
[railsbling]: http://www.railsbling.com
[peterboling]: https://about.me/peter.boling
[documentation]: http://rdoc.info/github/pboling/rspec-pending_for/frames
[homepage]: https://github.com/pboling/rspec-pending_for
