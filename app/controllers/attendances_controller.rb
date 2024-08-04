class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)

    if same_exists?(@attendance)
      flash[:notice] = "You have already signed up for this event. You cannot do it twice."
      redirect_to event_url(params[:attendance][:event_id])
    elsif @attendance.save
      flash[:success] = "You have successfully signed up for this event."
      redirect_to event_url(params[:attendance][:event_id])
    else
      flash[:error] = "You cannot attend this event due to some errors."
      redirect_to event_url(params[:attendance][:event_id]), status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :attendee_id)
  end

  def same_exists?(attendance)
    Attendance.where(attendee_id: attendance.attendee_id).and(Attendance.where(event_id: attendance.event_id)).exists?
  end
end
