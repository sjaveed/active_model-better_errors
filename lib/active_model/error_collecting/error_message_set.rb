module ActiveModel
  module ErrorCollecting
    class ErrorMessageSet
      include Enumerable
      extend  Forwardable

      def_delegators :@set, :each, :length, :size, :clear

      def initialize(attribute, errors=[])
        @attribute = attribute
        @set  = Set.new
        errors.each { |error| add *error }
      end

      def add(message, options=nil)
        error_message = ErrorMessage.build(@attribute, message, options)
        @set << error_message
        error_message
      end

      def <<(error)
        add *error
      end

      def to_a
        @set.to_a
      end

      def empty?
        @set.length == 0
      end
      alias_method :blank?, :empty?

    end
  end
end
