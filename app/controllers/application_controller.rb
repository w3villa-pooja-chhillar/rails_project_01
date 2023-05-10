class ApplicationController < ActionController::Base
    def hello
        render html: "hello world! there"
    end
end
