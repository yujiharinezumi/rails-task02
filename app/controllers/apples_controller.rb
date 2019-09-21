class ApplesController < ApplicationController
  before_action :set_apple, only: [:show,:edit,:update,:destroy]

    def index
      @apples = Apple.all

    end


    def new
      @apple = Apple.new


    end

    def create
      @apple = Apple.create(apple_params)
      if params[:back]
        render :new
      else

        if @apple.save
          redirect_to apples_path,notice: "ブログを作成しました!"
        else
          render :new
        end
      end
    end

    def show
        @apple =  Apple.find(params[:id])
    end

    def edit
      @apple = Apple.find(params[:id])

    end

    def update
      @apple = Apple.find(params[:id])
      if @apple.update(apple_params)
        redirect_to apples_path, notice: "ブログを編集しました！"
      else
        render :edit
      end
    end

    def destroy
      @apple.destroy
      redirect_to apples_path, notice:" ブログの削除をしました！"
    end

    def confirm
      @apple = Apple.new(apple_params)
      render  :new if @apple.invalid?

    end

    private

    def apple_params
        params.require(:apple).permit(:name,:title,:content)
    end

    def set_apple
        @apple = Apple.find(params[:id])

    end
end
