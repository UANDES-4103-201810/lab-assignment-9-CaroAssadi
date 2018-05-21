class PeopleController < ApplicationController

  def index
    
    
    if params[:q]=='actor'
     	@actors = Actor.all
    else if params[:q] =='director'
     	@directors = Director.all
    else
	@actors = Actor.all
	@directors = Director.all
    
    end
    end

  end
  def new

  end
  def create
 	
	if params[:role]== "actor"
      @actor = Actor.create(first_name:params[:first_name],last_name:params[:last_name],birth_date:params[:birth_name],description: params[:description])
      redirect_to '/persons?q=actor'

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
def person_params
      params.require(:person).permit(:first_name, :last_name, :birth_date, :description)
    end
end
