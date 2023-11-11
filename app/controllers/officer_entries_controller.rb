class OfficerEntriesController < ApplicationController
  before_action :set_officer_entry, only: %i[ show edit update destroy ]

  # GET /officer_entries or /officer_entries.json
  def index
    @officer_entries = OfficerEntry.all
  end

  # GET /officer_entries/1 or /officer_entries/1.json
  def show
  end

  # GET /officer_entries/new
  def new
    @officer_entry = OfficerEntry.new
    @officer_emails = Member.where("position != 'Member' and position != 'Pending'").pluck(:email)
  end

  # GET /officer_entries/1/edit
  def edit
  end

  # POST /officer_entries or /officer_entries.json
  def create
    @officer_entry = OfficerEntry.new(officer_entry_params)
  
    respond_to do |format|
      if @officer_entry.save
        # Find the member and update their officerPoints
        member = Member.find_by(email: @officer_entry.email)
        if member
          member.increment!(:officer_points, @officer_entry.points)
        end
        
        format.html do
 redirect_to officer_entry_url(@officer_entry), notice: "Officer entry was successfully created."
        end
        format.json { render :show, status: :created, location: @officer_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @officer_entry.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /officer_entries/1 or /officer_entries/1.json
  def update
    respond_to do |format|
      if @officer_entry.update(officer_entry_params)
        format.html do
 redirect_to officer_entry_url(@officer_entry), notice: "Officer entry was successfully updated."
        end
        format.json { render :show, status: :ok, location: @officer_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @officer_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officer_entries/1 or /officer_entries/1.json
  def destroy
    # Store the points and email before the record is destroyed
    points_to_decrement = @officer_entry.points
    officer_email = @officer_entry.email
    
    # Destroy the officer entry
    @officer_entry.destroy
  
    # Find the associated member and decrement the points
    member = Member.find_by(email: officer_email)
    if member
      member.decrement!(:officer_points, points_to_decrement)
    end
  
    respond_to do |format|
      format.html do
 redirect_to officer_entries_url, notice: "Officer entry was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officer_entry
      @officer_entry = OfficerEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def officer_entry_params
      params.require(:officer_entry).permit(:points, :email, :description)
    end
end
