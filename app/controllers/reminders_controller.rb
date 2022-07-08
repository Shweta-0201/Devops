class RemindersController < ApplicationController
  before_action :set_reminder,except: [:index,:new,:create]
  def index
    @reminders=Reminder.includes(:reminder_type).all
    @today_reminders=Reminder.where(expire_at: Time.now.beginning_of_day..Time.now.end_of_day)
    @tomorrow_reminders=Reminder.where(expire_at: Date.today+1.day)
    @this_month_reminders=Reminder.where(expire_at: Date.today..Date.today+30.days)
  end
  def new
    @reminder=Reminder.new
  end
  def edit
    @reminder = Reminder.find(params[:id])
    render :edit
  end
  def create
    @reminder=Reminder.new(reminder_params)
    if @reminder.save
      redirect_to reminders_path, notice: "Saved successfully"
    else
      render "new"
    end
  end
  def update
    if @reminder.update(reminder_params)
      redirect_to reminders_path, notice: "Updated successfully"
    else
      render "edit", notice: "Update not successfull"
    end
  end
  def destroy
    @reminder = Reminder.find(params[:id])
        if @reminder.destroy
            flash[:notice] = "Reminder type has been deleted successfully"
            redirect_to reminders_url
        else
            flash[:notice] = "Reminder type deletion failed"
        end
  end
  def show
    @reminder = Reminder.find(params[:id])
  end
  def search
    @reminders = Reminder.where("title like ?","%"+params[:title]+"%")
  end
  private
    def reminder_params
      params.require(:reminder).permit(:title,:content,:expire_at,:status,:reminder_type_id)
    end
    def set_reminder
      @reminder=Reminder.find params[:id]
    end
end
