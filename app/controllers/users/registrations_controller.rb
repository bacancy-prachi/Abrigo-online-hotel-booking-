class Users::RegistrationsController < Devise::RegistrationsController
    def after_update_path_for(resource)
        case resource
        when :user, User
          resource.customer? ? another_path : root_path
        else
          super
        end
      end
end