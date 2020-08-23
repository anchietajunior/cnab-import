class ImportsController < ApplicationController
  
  before_action :check_cnab_file

  def import_cnab_file
    result = Transactions::Imports::TransactionsService.call(File.read(params[:cnab_file]))
    if result.success?
      redirect_to stores_url, notice: "Success"
    else
      redirect_to stores_url, notice: "Failure when importing"
    end
  end

  private

  def check_cnab_file
    redirect_to home_url, notice: "Cnab file needed" unless params[:cnab_file].present?
  end
end
