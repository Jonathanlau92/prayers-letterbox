class AdminPolicy < ApplicationPolicy
    attr_reader :current_user
    def initialize(current_user, _)
        @current_user = current_user
    end
    
    def admin?
      current_user.has_role? :admin  
    end

    # def method_missing(name, *args)
    #     current_user.has_role? :admin
    # end
    # Struct.new(:user, :admin) do
    #     def method_missing(_name)
    #       user.has_role? :admin
    #     end
    #   end
end