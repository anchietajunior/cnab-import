class PagesController < ApplicationController

  before_action :set_store, only: [:store]

  def home;end

  def stores
    @stores = Store.all.order(:name)
  end

  def store

  end

  private

  def set_store
    @store = Store.includes(:transactions).find(params[:id])
  end
end
