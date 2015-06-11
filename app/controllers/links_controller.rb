class LinksController < ApplicationController

  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save

        format.html { redirect_to links_path, flash: { code: 'http://128.199.108.161/' + @link.code,
                  id: @link.code } }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :index }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  def redirect
    link = Link.find_by_code(params[:url])

    if link
      redirect_to link.given_url
    else
      render :index
    end
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:given_url, :uuid, :code)
    end
end
