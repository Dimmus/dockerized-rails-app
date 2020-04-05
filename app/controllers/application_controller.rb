# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    include Auth0Helper
end