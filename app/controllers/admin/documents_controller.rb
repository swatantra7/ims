class Admin::DocumentsController < AdminController

  include GallaryController

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to admin_documents_path
    else
      render 'new'
    end
  end

  private

  def document_params
    params.require(:document).permit(
      :document_list
    )
  end

end
