class HomeController < ApplicationController
    def index
        @articles = Services::HomeControllerService.index
    end
end