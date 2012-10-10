class NewsController < ApplicationController
  load_and_authorize_resource

  def create
    @news.created_by = current_user.id
    @news.updated_by = current_user.id
    if @news.save
      redirect_to @news, notice: 'News was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @news.updated_by = current_user.id
    if @news.update_attributes(params[:news])
      redirect_to @news, notice: 'News was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_url
  end

  def latest
    @news = News.where("updated_at > ?", current_user.last_sign_in_at).order("updated_at DESC")
  end

  def display
    @news = News.order("updated_at DESC")
  end
end
