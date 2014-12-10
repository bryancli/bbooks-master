class AuthorsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @authors = Author.order("lastName asc").page(params[:page]).per(10)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new

    @author.firstName = params[:firstName]

    @author.lastName = params[:lastName]

    @author.shortBio = params[:shortBio]



    if @author.save
      redirect_to "/authors", :notice => "Author created successfully."
    else
      render 'new'
    end

  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])


    @author.firstName = params[:firstName]

    @author.lastName = params[:lastName]

    @author.shortBio = params[:shortBio]



    if @author.save
      redirect_to "/authors", :notice => "Author updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy


    redirect_to "/authors", :notice => "Author deleted."

  end
end
