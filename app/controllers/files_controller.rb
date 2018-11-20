class FilesController < ApplicationController
  before_action :set_user_file


  def destroy
    file = @user_file.files.select { |f| f.blob.id == params[:id].to_i }.first
    file.purge
    redirect_back fallback_location: root_path, notice: 'File was successfully destroyed.'
  end

  private
  def set_user_file
    @user_file = UserFile.find(params[:user_file_id])
  end
end
