class ImportsController < ApplicationController
  def import_cnab_file
    file = File.read(params[:cnab_file])
    p "READING FILE ========================================="
    file.each_line do |line|
      p "====================="
      p line[62..80]
      p "====================="
    end
    redirect_to home_path
  end
end
