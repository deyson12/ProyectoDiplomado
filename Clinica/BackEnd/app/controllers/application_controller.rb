class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :api_autentication, if: :json_request?

  	private 

  	def json_request?
  		request.format.json?
  	end

  	def api_autentication
  		if current_token.nil?
  			render json: {error: 'Token Invalid'}
  		else
        if current_token.estate_id == 1
  			 current_token.number_of_request += 1
  			 current_token.save
        else
          render json: {error: 'Token Inactivo'}
        end 
  		end
	end

	def current_token
		@token ||= Token.authenticate(token_param)
	end

	def token_param
		request.headers['token'] || params[:token]
	end
end
