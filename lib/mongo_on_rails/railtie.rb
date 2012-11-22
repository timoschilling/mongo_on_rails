require "mongo_on_rails"

module MongoidOnRails
  class Railtie < Rails::Railtie
    initializer "mongo_on_rails.log_runtime" do |app|
      ActiveSupport.on_load(:action_controller) do
        include MongoOnRails::ControllerRuntime
      end
    end
  end
end
