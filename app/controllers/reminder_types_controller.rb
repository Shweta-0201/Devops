class ReminderTypesController < ApplicationController
  before_action :set_reminder_type, only: [:edit, :update, :destroy]
  def index
    @reminder_types=ReminderType.all
  end
  def create
    @reminder_type=ReminderType.new(reminder_type_params)
    if @reminder_type.save
      flash[:notice]="Saved successfully"
      redirect_to reminder_types_path
    else
      render "new"
    end
  end
  def update
    if @reminder_type.update(reminder_type_params)
      redirect_to reminder_types_path, notice: "Updated successfully"
    else
      render "edit"
    end
  end
  def show
    @reminder_type = ReminderType.find(params[:id])
  end
  def edit
    @reminder_type = ReminderType.find(params[:id])
        render :edit
  end
  def new
    @reminder_type=ReminderType.new
  end
  def destroy
    @reminder_type = ReminderType.find(params[:id])
      if @reminder_type.destroy
        flash[:notice] = "Reminder type has been deleted successfully"
        redirect_to reminder_types_url
      else
        flash[:notice] = "Reminder type deletion failed"
      end
  end
  private
    def reminder_type_params
      params.require(:reminder_type).permit(:name)
    end
    def set_reminder_type
      @reminder_type=ReminderType.find params[:id]
    end
end
