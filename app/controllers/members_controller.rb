class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.order(:nameFirst)
  end
  

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit_weekly_points
    @member = Member.find(params[:id])
  end

  def update_weekly_points
    @member = Member.find(params[:id])
    new_weekly_points = params[:member][:weeklyPoints].to_i
    if @member.update(weeklyPoints: new_weekly_points, totalPoints: @member.totalPoints + new_weekly_points)
      redirect_to members_path, notice: 'Points updated successfully'
    else
      render :edit_weekly_points
    end
  end

  def bulk_edit_points
    @members = Member.all
  end
  
  def bulk_update_points
    params[:members].each do |id, member_params|
      member = Member.find(id)
      new_weekly_points = member_params[:weeklyPoints].to_i
      member.update(weeklyPoints: new_weekly_points, totalPoints: member.totalPoints + new_weekly_points)
    end
    redirect_to members_path, notice: 'All points updated successfully'
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:totalPoints, :weeklyPoints, :nameFirst, :nameLast, :position)
    end
end
