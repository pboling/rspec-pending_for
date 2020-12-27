# Rspec::PendingFor

Easiest to just show you:

```ruby
it('blah is blah') do
  pending_for(:engine => 'rbx')
  pending_for(:engine => 'ruby', :versions => '2.1.5')
  pending_for(:engine => 'jruby', :versions => '2.2.2', :reason => 'due to a bug in Ruby')
  pending_for(:engine => 'ruby', :versions => '2.0.0', :reason => "because I don't have the time")
  expect('blah').to eq 'blah'
end
```

Requires Ruby 1.9+ (any engine)

| Project                 |  Rspec::PendingFor |
|------------------------ | ----------------------- |
| gem name                |  [rspec-pending_for](https://rubygems.org/gems/rspec-pending_for) |
| license                 |  [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) |
| download rank           |  [![Downloads Today](https://img.shields.io/gem/rd/rspec-pending_for.svg)](https://github.com/pboling/rspec-pending_for) |
| version                 |  [![Version](https://img.shields.io/gem/v/rspec-pending_for.svg)](https://rubygems.org/gems/rspec-pending_for) |
| dependencies            |  [![Depfu](https://badges.depfu.com/badges/79867e590f063376f40b031a1447c215/count.svg)](https://depfu.com/github/pboling/rspec-pending_for?project_id=5865) |
| CI > ruby 2.0.0         |  [![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fpboling%2Frspec-pending_for%2Fbadge&style=flat)](https://actions-badge.atrox.dev/pboling/rspec-pending_for/goto) |
| CI <= ruby 2.0.0        |  [![Build Status](https://travis-ci.com/pboling/rspec-pending_for.svg?branch=master)](https://travis-ci.com/pboling/rspec-pending_for) |
| test coverage           |  [![Test Coverage](https://api.codeclimate.com/v1/badges/266bc0935f185153cce4/test_coverage)](https://codeclimate.com/github/pboling/rspec-pending_for/test_coverage) |
| maintainability         |  [![Maintainability](https://api.codeclimate.com/v1/badges/266bc0935f185153cce4/maintainability)](https://codeclimate.com/github/pboling/rspec-pending_for/maintainability) |
| code triage             |  [![Open Source Helpers](https://www.codetriage.com/pboling/rspec-pending_for/badges/users.svg)](https://www.codetriage.com/pboling/rspec-pending_for) |
| homepage                |  [on Github.com][homepage], [on Railsbling.com][blogpage] |
| documentation           |  [on RDoc.info][documentation] |
| Spread ~♡ⓛⓞⓥⓔ♡~      |  [🌏](https://about.me/peter.boling), [👼](https://angel.co/peter-boling), [:shipit:](http://coderwall.com/pboling), [![Tweet Peter](https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow)](http://twitter.com/galtzo), [🌹](https://nationalprogressiveparty.org) |

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

The gem auto-configures itself for use in your Rspec suite.  Just add this line to yous `spec_helper.rb`:

```ruby
require 'rspec/pending_for'
```

To mark a spec pending for a specific ruby engine, and/or versions:

```ruby
it('blah is blah') do
  pending_for(:engine => 'ruby', :versions => '2.1.5')
  expect('blah').to eq 'blah'
end
```

To skip a spec for a specific ruby engine, and/or versions:

```ruby
it('blah is blah') do
  skip_for(:engine => 'ruby', :versions => '2.1.5')
  expect('blah').to eq 'blah'
end
```

To mark a spec pending for all versions of a given engine:

```ruby
it('blah is blah') do
  pending_for(:engine => 'jruby')
  expect('blah').to eq 'blah'
end
```

To mark a spec pending for a custom reason (overriding the default message):

```ruby
it('blah is blah') do
  pending_for(:engine => 'jruby', :reason => 'This does not work on JRuby')
  expect('blah').to eq 'blah'
end
```

To mark a spec pending or skipped for multiple engines and versions, just what you would expect:

```ruby
it('blah is blah') do
  skip_for(:engine => 'jruby', :reason => 'This does not work on JRuby so skipping for now') # All JRuby versions will be skipped
  pending_for(:engine => 'rbx', :reason => 'This does not work on Rubinius so pending for now') # All rbx versions will be pending
  pending_for(:engine => 'ruby', :versions => %w(1.9.3 2.0.0 2.1.0)) # uses the default message
  expect('blah').to eq 'blah'
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

Bug reports and pull requests are welcome on GitHub at https://github.com/pboling/rspec-pending_for. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Rspec::PendingFor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pboling/rspec-pending_for/blob/master/CODE_OF_CONDUCT.md).

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

For example in a `Gemfile`:

    gem 'rspec-pending_for', '~> 0.1', group: :test

or in a `gemspec`

    spec.add_dependency 'rspec-pending_for', '~> 0.1'

## Legal

* MIT License - See [LICENSE][license] file in this project [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
* Copyright (c) 2015 - 2018 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[semver]: http://semver.org/
[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[documentation]: http://rdoc.info/github/pboling/rspec-pending_for/frames
[homepage]: https://github.com/pboling/rspec-pending_for
[blogpage]: http://www.railsbling.com/tags/rspec-pending_for/
[license]: LICENSE
[railsbling]: http://www.railsbling.com
[peterboling]: https://about.me/peter.boling
[refugees]: https://www.crowdrise.com/helprefugeeswithhopefortomorrowliberia/fundraiser/peterboling
[gplus]: https://plus.google.com/+PeterBoling/posts
[topcoder]: https://www.topcoder.com/members/pboling/
[angellist]: https://angel.co/peter-boling
[coderwall]: http://coderwall.com/pboling
[twitter]: http://twitter.com/galtzo
