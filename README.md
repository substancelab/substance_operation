SubstanceOperation
==================

Make it easier to create user based operations

[![Build Status](https://travis-ci.com/substancelab/substance_operation.svg?branch=master)](https://travis-ci.com/substancelab/substance_operation)


Usage examples
--------------

Create a class based on the Substance::Operation class, with its bespoke process method:

    class UserOperation < Substance::Operation
      def process(*)
        true
      end
    end

Initialize it with a user and run it with the necessary parameters for the operation:

    operation = UserOperation.new(user)
    operation.process(params)
    result = operation.success?

License
-------

SubstanceOperation is licensed under the MIT license. See LICENSE for details.
