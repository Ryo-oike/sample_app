class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  #以下２章　保存機能を追加する　にて記述追加
  def create
    #1.2 データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #3   データをデータベースに保存するためのsaveメソッド
    list.save
    #4   トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def create
    @list =List.new(list_params)
    if @list.save
      rederect_to list_path(@list.id)
    else
      render :new
    end
    
    def create
      list = List.new(list_params)
      list.save
      flash[:notice] = "投稿が成功しました"
      redirect_to list_path(list.id)
  end
  
  def destory
    list = List.find(params[:id])
    list.destro
    redirect_to '/lists'
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  # ストロングパラメータ　セキュリティ対策コード
  # 一番下に書く！
end