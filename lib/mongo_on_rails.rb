require "mongo_on_rails/version"
require "mongo_on_rails/logger"
require "mongo_on_rails/instrumenter"
require "mongo_on_rails/controller_runtime"
require "mongo_on_rails/railtie"
require "mongo"

Mongo::Logging.instrumenter = MongoOnRails::Instrumenter
