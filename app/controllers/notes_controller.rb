class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @note.update_attributes(params[:note])
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @note.destroy

    redirect_to notes_url
  end
end
