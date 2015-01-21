module Lotus
  module Validations
    # A single validation error for an attribute
    #
    # @since 0.1.0
    class Error
      # The name of the attribute
      #
      # @return [Symbol] the name of the attribute
      #
      # @since 0.1.0
      attr_reader :attribute

      # The name of the validation
      #
      # @return [Symbol] the name of the validation
      #
      # @since 0.1.0
      attr_reader :validation

      # The expected value
      #
      # @return [Object] the expected value
      #
      # @since 0.1.0
      attr_reader :expected

      # The actual value
      #
      # @return [Object] the actual value
      #
      # @since 0.1.0
      attr_reader :actual

      # Initialize a validation error
      #
      # @param attribute [Symbol] the name of the attribute
      # @param validation [Symbol] the name of the validation
      # @param expected [Object] the expected value
      # @param actual [Object] the actual value
      #
      # @since 0.1.0
      # @api private
      def initialize(attribute, validation, expected, actual)
        @attribute, @validation, @expected, @actual =
          attribute, validation, expected, actual
      end

      # Check if self equals to `other`
      #
      # @since 0.1.0
      def ==(other)
        other.is_a?(self.class) &&
          other.attribute  == attribute  &&
          other.validation == validation &&
          other.expected   == expected   &&
          other.actual     == actual
      end

      # Returns the de-namesapced attribute name
      #
      # In cases where the error was pulled up from nested validators,
      # `attribute` will be a namespaced string with the last element being the
      # actual attribute name
      #
      # @example
      #   error = Error.new('author.name', :presence, true, nil)
      #   error.attribute
      #   => "author.name"
      #   error.attribute_name
      #   => "name"
      #
      # @api public
      # @since x.x.x
      def attribute_name
        @attribute.to_s.split('.').last
      end
    end
  end
end
