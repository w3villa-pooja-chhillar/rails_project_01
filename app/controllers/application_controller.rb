class ApplicationController < ActionController::Base
    def hello
        render html: "hello world! there"
    end
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:id]) if session[:id]
      end
      def logged_in?
        !!current_user
      end
      def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
      end
end

