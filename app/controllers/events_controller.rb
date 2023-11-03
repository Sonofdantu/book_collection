class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params_without_image)

    encode_uploaded_images

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    encode_uploaded_images

    respond_to do |format|
      if @event.update(event_params_without_image)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    # First, let's get the score of the event for decrementing points later
    event_score = @event.score
    
    # Find all attendance records associated with this event
    attendances = Attendance.where(event_name: @event.title)
    
    attendances.each do |attendance|
      # Find the member based on the email in the attendance record
      member = Member.find_by(email: attendance.email)
      
      if member
        # Decrement the member's total points by the event's score
        member.decrement(:totalPoints, event_score).save!
        
        # Destroy the attendance record
        attendance.destroy
      else
        flash[:alert] = "Could not find the member associated with attendance for #{attendance.email}."
      end
    end
    
    # Now, destroy the event
    @event.destroy
  
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event and associated attendances were successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  def attend
    @event = Event.find(params[:id])
  end
  
  def register_attendance
    @event = Event.find(params[:id])
  
    if @event.password == params[:event_password]
      attendance = Attendance.where(email: current_admin.email, event_name: @event.title).first_or_initialize
      if attendance.new_record?
        attendance.save!
  
        # Increment the total points of the member by the score of the event
        member = Member.find_by(email: current_admin.email)
        if member
          member.increment(:totalPoints, @event.score).save!
        else
          flash[:alert] = "Could not find the member to update points."
        end
  
        flash[:notice] = "Successfully registered your attendance!"
        redirect_to events_path
      else
        flash[:alert] = "You've already attended this event!"
        redirect_to events_path
      end
    else
      flash[:alert] = "Incorrect password!"
      render :attend
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :score, :password, :start_time, :end_time, :image)
    end

    def event_params_without_image
      event_params.except(:image)
    end

    def encode_uploaded_images
      if params[:event][:image].is_a?(ActionDispatch::Http::UploadedFile)
        uploaded_image = params[:event][:image]
        @event.image = Base64.encode64(uploaded_image.read)
      end
    end
end
