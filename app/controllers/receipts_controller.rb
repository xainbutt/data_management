# frozen_string_literal: true

class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[show edit update destroy]
  before_action :set_user_file

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.where(user_file_id: params[:user_file_id])
    @receipt = Receipt.new
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show; end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit; end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = @user_file.receipts.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to user_file_receipts_path, notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        @receipts = Receipt.where(user_file_id: params[:user_file_id])
        format.html { render :index }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to user_file_receipts_path, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to user_file_receipts_path, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  def set_user_file
    @user_file = UserFile.find(params[:user_file_id].to_i)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def receipt_params
    params.require(:receipt).permit(:amount)
  end
end
