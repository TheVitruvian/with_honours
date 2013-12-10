class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    #insert bespoke sorting algorithum
# SELECT id, title FROM videos ORDER BY LOG10(ABS(up_votes_count - down_votes_count) + 1) * SIGN(up_votes_count - down_votes_count) + (UNIX_TIMESTAMP(created_at) / 300000) DESC LIMIT 50

# or:
# SELECT Title, LOG10(up_votes_count - down_votes_count + 1) * 287015 + UNIX_TIMESTAMP(created_at) AS Hotness
# ORDER BY Hotness DESC

  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
      @question = Question.new(params[:question])
      @question.owner_id = current_user.id
      @question.owner_type = current_user.class.to_s

      respond_to do |format|
        if @answer.save
          format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        else
          format.html { render action: "new" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    @post = Post.find(params[:id])
    authorize! :update, @post

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

end

