module External
  class Engine < ::Rails::Engine
    isolate_namespace External
  end
end
