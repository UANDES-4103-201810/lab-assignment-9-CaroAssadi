class PeopleController < ApplicationController

  def index
    @directors = Director.all
    @actors = Actor.all

  end
  def new

  end
  def create
	if params[:type]== "Actor"
      @actor = Actor.create(first_name:params[:first_name],last_name:params[:last_name],birth_date:params[:birth_name],description: params[:description])

	respond_to do |format|
      	      if @actor.save
		  format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
		  format.json { render :show, status: :created, location: @actor }
	      else
		format.html { render :new }
		format.json { render json: @actor.errors, status: :unprocessable_entity }
	      end
	end
    else
      @director = Director.create(first_name:params[:first_name],last_name:params[:last_name],birth_date:params[:birth_name],description: params[:description])
	respond_to do |format|
      if @director.save
        format.html { redirect_to @director, notice: 'Director was successfully created.' }
        format.json { render :show, status: :created, location: @director }
      else
        format.html { render :new }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
     end
    end

  end
end
