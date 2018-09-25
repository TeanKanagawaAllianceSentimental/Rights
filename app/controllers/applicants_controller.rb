class ApplicantsController < ApplicationController

  def index
    @applicants = Applicant.find(params[:id])
  end

  def new
    @applicant = Applicant.new
  end

  def create
    applicant.save(applicant_params)
    redirect_to new_application_path
  end

  def show
    
  end

  def edit
    @applicant = Applicant.find(params)
  end

  def update
    applicant = Applicant.find(params[:id])
    if applicant.update(applicant_params)
      flash[:success] = 'Allicant infomation was successfully updated.'
      redirect_to 
    else
      # @user = User.find(params[:id])
      # @book = Book.new
      # @books = @user.books
      flash[:warning] = user.errors.messages
      render "applicants/edit"
    end
  end

  def destroy
    
  end

  private

  def applicant_params
    params.require(:applicant).permit(:applicant_organisation_name, :representative_name, :applicant_postal_code, :applicant_address, :applicant_telephone, :applicant_fax, :applicant_department, :contact_person, :contact_person_email, :contact_person_mobilephone, :billing_adress_from_jasrac)
  end

end
