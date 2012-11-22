require "active_support/core_ext/module/attr_internal"

module MongoOnRails
  module ControllerRuntime
    extend ActiveSupport::Concern

  protected

    attr_internal :mongo_runtime

    def process_action(action, *args)
      # We also need to reset the runtime before each action
      # because of queries in middleware or in cases we are streaming
      # and it won't be cleaned up by the method below.
      MongoOnRails::Logger.reset_runtime
      super
    end

    def cleanup_view_runtime
      db_rt_before_render = MongoOnRails::Logger.reset_runtime
      runtime = super
      db_rt_after_render = MongoOnRails::Logger.reset_runtime
      self.mongo_runtime = db_rt_before_render + db_rt_after_render
      runtime - db_rt_after_render
    end

    def append_info_to_payload(payload)
      super
      payload[:mongo_runtime] = (mongo_runtime || 0) + MongoOnRails::Logger.reset_runtime
    end

    module ClassMethods
      def log_process_action(payload)
        messages, mongo_runtime = super, payload[:mongo_runtime]
        messages << ("Mongo: %.1fms" % mongo_runtime.to_f) if mongo_runtime
        messages
      end
    end
  end
end
