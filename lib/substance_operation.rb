# frozen_string_literal: true

# Operation
#
# A generic operation whose actual steps are to be implemented by base classes
module Substance
  class Operation
    # Returns the result of running the operation
    attr_reader :result

    def initialize(user)
      @user = user
    end

    def process(*)
      raise \
        NotImplementedError,
        "Operation classes must implement their own process"
    end

    # Has the operation completed succesfully?
    def success?
      success
    end

    protected

    attr_accessor :success
    attr_accessor :user

    attr_writer :result
  end
end
