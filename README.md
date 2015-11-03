# Gemsupport
[![Build Status](https://travis-ci.org/mdouchement/gemsupport.svg?branch=master)](https://travis-ci.org/mdouchement/gemsupport)

# Requirements
- Ruby >= 2.0 (Refinements needed)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gemsupport'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gemsupport

## Usage

- Included modules
```rb
module MyModule # or class
  include Gemsupport::Console # capture stdout/stderr
  include Gemsupport::Error # suppress error & silent exit
end
```

- Refinements
```rb
module MyModule # or class
  using Gemsupport::Blank # methods #blank? & #present?
  using Gemsupport::HashKeys # Symbolization & stringification of Hash keys
  using Gemsupport::DeepMerge # Deep merge a Hash
  using Gemsupport::DeepClone # Deep clone an object
  using Gemsupport::StringInteractions # methods #underscore, #camelize, #unindent & #unindent!
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gemsupport/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
