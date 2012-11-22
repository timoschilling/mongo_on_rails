module MongoOnRails
  module Instrumenter
    def self.instrument name, payload = {}
      start_time = Time.now
      ret = yield
      runtime = (Time.now - start_time) * 1000
      MongoOnRails::Logger.runtime += runtime
      ret
    end
  end
end
