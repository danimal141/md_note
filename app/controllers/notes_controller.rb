class NotesController < ApplicationController
  before_action :set_note, only: [ :show, :edit, :update, :destroy ]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created!' }
        format.json { render :show, status: :created } #201
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity } #422
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated!' }
        format.json { head :no_content } #204
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  def rendering
    @note = Note.new do |n|
      n.raw_body = params[:raw_body]
    end
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :raw_body)
  end
end
