class FinancesController < ApplicationController
  before_action :set_finance, only: %i[ show edit update destroy ]

  # GET /finances or /finances.json
  def index
    @finances = Finance.all
    @event_titles = Event.all.pluck(:title)
  end

  # GET /finances/1 or /finances/1.json
  def show
    @finance = Finance.find(params[:id])
    @event_titles = Event.all.pluck(:title)
  end

  # GET /finances/new
  def new
    @finance = Finance.new
    @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
    @event_titles = Event.all.pluck(:title)
  end 

  # GET /finances/1/edit
  def edit
    @finance = Finance.find(params[:id])
    @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
    @event_titles = Event.all.pluck(:title)
  end

  # POST /finances or /finances.json
  def create
    @finance = Finance.new(finance_params_without_receipt)
    @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
    @event_titles = Event.all.pluck(:title)

    encode_uploaded_images

    respond_to do |format|
      if @finance.save
        format.html do
 redirect_to finance_url(@finance), notice: "Finance was successfully created."
        end
        format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finances/1 or /finances/1.json
  def update
    @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
    @event_titles = Event.all.pluck(:title)

    encode_uploaded_images

    respond_to do |format|
      if @finance.update(finance_params_without_receipt)
        format.html do
 redirect_to finance_url(@finance), notice: "Finance was successfully updated."
        end
        format.json { render :show, status: :ok, location: @finance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finances/1 or /finances/1.json
  def destroy
    @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
    @event_titles = Event.all.pluck(:title)
    
    @finance.destroy

    respond_to do |format|
      format.html { redirect_to finances_url, notice: "Finance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance
      @officer_emails = Member.where.not(position: ["Member", "Pending"]).pluck(:email)
      @event_titles = Event.all.pluck(:title)
      @finance = Finance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def finance_params
      params.require(:finance).permit(
        :email, 
        :eventTitle, 
        :cost, 
        :receipt, 
        :description,
        :status
      )
    end

    def finance_params_without_receipt
      finance_params.except(:receipt)
    end

    def encode_uploaded_images
      if params[:finance][:receipt].is_a?(ActionDispatch::Http::UploadedFile)
        uploaded_receipt = params[:finance][:receipt]
        @finance.receipt = Base64.encode64(uploaded_receipt.read)
      end
    
      if params[:finance][:reimbursement].is_a?(ActionDispatch::Http::UploadedFile)
        uploaded_reimbursement = params[:finance][:reimbursement]
        @finance.reimbursement = Base64.encode64(uploaded_reimbursement.read)
      end
    end
end