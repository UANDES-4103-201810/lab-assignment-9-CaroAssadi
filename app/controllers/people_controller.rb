class PeopleController < ApplicationController

  def index
    @directors = Director.all
    @actors = Actor.all
  end
  def new

  end
  def create

  end
end