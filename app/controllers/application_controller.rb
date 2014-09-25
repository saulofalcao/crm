class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 # include ReservasHelper
 # include SessionsHelper
 $base_name="Agendamento Médico"
end
