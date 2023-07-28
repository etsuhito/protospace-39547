class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype) #データベースへの保存に成功した場合は、作成されたコメントが紐づいているプロトタイプ（prototype）の詳細ページにリダイレクトする
    else
      @prototype = @comment.prototype  #失敗したコメントの紐づいているプロトタイプを取得し@prototype 変数に代入
      @comments = @prototype.comments #失敗したコメントの紐づいているプロトタイプに紐づく全てのコメントを取得し@comments 変数に代入
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    #comment_params メソッドは、ストロングパラメーターを使ってフォームからの入力を安全に受け取ります。content パラメーターを受け取り、その他に現在のユーザーのID (user_id) とプロトタイプのID (prototype_id) をマージして返します。
  end
end
