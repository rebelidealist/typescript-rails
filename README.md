# TypeScript for Rails 

This is a wrapper for the [TypeScript](http://www.typescriptlang.org/), JavaScript superset language by Microsoft.

It enables you to use the `.ts` extension in the Asset Pipeline and also in ActionView Templates.

The credit for the overall structure and the tests goes to the people that wrote the [coffee-rails](https://github.com/rails/coffee-rails) Gem, since I shamelessly copy&pasted some of their code.

## Requirements

The current version requires that [tsc](http://www.typescriptlang.org/) is
installed on the system.
This gem uses `tsc` directly.

## Installation

Add this line to your application's Gemfile:

    gem 'typescript-rails'

And then execute:

    $ bundle

## Usage

Just add a `.js.ts` file in your `app/assets/javascripts` directory and include it just like you are used to do.

Configurations:

```
# Its defaults are `--target ES5 --noImplicitAny --removeComments`.
Typescript::Rails::Compiler.default_options = [ ... ]
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Maintainers

FUJI Goro <gfuji@cpan.org>

## Authors

Klaus Zanders <klaus.zanders@gmail.com>

