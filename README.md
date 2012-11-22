# MongoOnRails

A Rails Railtie that use the Mongo Instrumenter API to log the Mongo runtime into the Rails Controller Runtime Logger like:

    Completed 200 OK in 31ms (Views: 23.1ms | Mongo: 3.2ms)

## Installation

Add this line to your application's Gemfile:

    # currently we need a specific version of the mongo driver, until 1.7.2 is released
    gem 'mongo', :git => "git://github.com/mongodb/mongo-ruby-driver.git", :commit => "7eac82b"
    gem 'mongo_on_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_on_rails

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
