class BloggersController < ApplicationController

    before_action :find_blogger, only: [:show, :create]

    def index
        @bloggers = Blogger.all
    end 

    def show
        @post = @blogger.most_likes
    end 

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end


    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end 
end
