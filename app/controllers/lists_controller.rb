class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create 
    @list = List.new(list_params)
    
  # エラーメッセージを扱うときにはrender, それ以外はredirect_to
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
  # ここでredirect_toを使うと@listがnewアクション中でリセットされ、エラーを取得できない
    end
  end
  
  def index
    @lists = List.all 
  end
  
  
  def show
    # 下のfindはListモデルのidが引数と等しいレコードを取得する
    # この場合引数はparams[:id]でこれはurlからidを抜き出す動作に等しいため、
    # url="lists/1"の時、Listモデルのid=1のレコードが呼び出される
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
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  # 以下の関数はこのコントローラーからからしか呼び出せない、またアクションとして認識されない
  private 
  # ストロングパラメータ:攻撃を防ぐため、保存できるデータのモデルとカラムを絞る
  def list_params
    params.require(:list).permit(:title, :body, :image)
    # paramsはformで送信されたデータが格納されている
    # requireで指定のモデルに対応するデータ(この場合title, body)のみに
    # permitで保存できるカラムを指定
  end 
end
