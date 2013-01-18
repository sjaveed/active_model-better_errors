require 'forwardable'
require 'active_model/error_collecting'
require 'active_model/validations'

module ActiveModel
  module Validations
    def errors
      @errors ||= ErrorCollecting::Errors.new(self)
    end
  end
end
