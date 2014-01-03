class NumbersController < ApplicationController  
  # GET /numbers
  def index
  end
  
  # GET /numbers/1
  def show
  end
  
  # GET /numbers/new
  def new
    @number = Number.new
  end
  
  # GET /numbers/1/edit
  def edit
  end

  # POST /numbers
  def create
    value = params[:number][:value]
    
    @number = Number.new

    respond_with(@number) do |format|
      if value.sub!("int: ", "") != nil
        @number.encode(value)
      elsif value.sub!("hex: ", "") != nil
        bytes = value.scan(/../)
        @number.decode(bytes[0], bytes[1])
      else
         format.html { render :action => :new }
      end
    end
  end
  
  # PATCH /numbers/1
  def update
  end
  
  # DELETE /numbers/1
  def destory
  end
end
