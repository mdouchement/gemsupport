module Gemsupport
  module Error
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def silent_exit
        suppress(SystemExit) { yield }
      end

      # rubocop:disable HandleExceptions
      def suppress(*exception_classes)
        yield
      rescue *exception_classes
      end
      # rubocop:enable HandleExceptions
    end
  end
end
