module MongoOnRails
  module Logger
    THREAD_KEY = "mongo_on_rails_runtime"

    def self.runtime= value
      Thread.current[THREAD_KEY] = value
    end

    def self.runtime
      Thread.current[THREAD_KEY] ||= 0
    end

    def self.reset_runtime
      rt, self.runtime = runtime, 0
      rt
    end
  end
end
