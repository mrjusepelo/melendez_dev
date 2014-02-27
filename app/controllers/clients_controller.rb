class ClientsController < ApplicationController

 
  def verify_client

puts "******varificliente**********"


  	@cities = Client.all

  	@client = Client.where(document: params[:cclient])
  	if @client.count > 0
  		@response_client = @client.last

  	
  	end

    respond_to do |format|
      format.json { render :json => @response_client}     
    end

  end

  def index
  end

  def show
  end
end
