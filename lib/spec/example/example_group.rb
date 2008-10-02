module Spec
  module Example
    # Base class for customized example groups. Use this if you
    # want to make a custom example group.
    class ExampleGroup
      extend Spec::Example::ExampleGroupMethods
      include Spec::Example::ExampleMethods

      def initialize(defined_description, &implementation)
        @_defined_description = defined_description
        @_implementation = implementation || pending_implementation
      end
      
    private
      
      def pending_implementation
        error = DefaultPendingError.new(caller)
        lambda { raise(error) }
      end
    end
  end
end

Spec::ExampleGroup = Spec::Example::ExampleGroup
