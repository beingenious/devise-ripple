module Devise
  module Orm
    module Ripple

      module Hook
        def devise_modules_hook!
          include Compatibility
          yield
        end
      end

      module Compatibility
        extend ActiveSupport::Concern

        module ClassMethods

          def validates_uniqueness_of(*fields)
            # TODO
            true
          end

        end
      end

    end
  end
end

Ripple::Document::ClassMethods.class_eval do
  include Devise::Models
  include Devise::Orm::Ripple::Hook
end