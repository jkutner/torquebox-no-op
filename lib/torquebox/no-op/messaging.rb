module TorqueBox
  module Messaging
    module Backgroundable
      def background(options = { })
        # no-op
        # todo: set a global option to run the method synchronously?
      end
      
      module ClassMethods
        def always_background(*methods)
          # no-op
        end
      end
    end
  end
end