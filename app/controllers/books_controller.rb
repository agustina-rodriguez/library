class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
    @books = @books.where(["title LIKE :filter", :filter => ("%" + params[:filter] + "%")]) unless params[:filter].blank?
    # Esto sirve para pasarle un literal, es decir, el LIKE es para que el filter al que hacíamos referencia antes tenga ese valor
    # ES DECIR, poniendo 'filter = cera' me va a aparecer el libro Sinceramiento porque contiene en su nombre,'cera'.
    # A esto se le llama búsqueda blanda.



    # @books = @books.where(:title => params[:filter]) unless params[:filter].blank?
    # Donde el título sea igual a algo que le pase por parámetro a no ser que el parámetro esté en blanco.
    # Si no pasamos ningún param. entonces muestra todo.
    # Vos pedís que el filtro se llame 'filter', se puede cambiar.
    # Si en lugar de  filter pusiera chocolate, entonces tambiéns sería un filtro pero con el nombre elegido por mí.
    # A esto se le llama búsqueda estricta.
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :category_id)
    end
end
