class ContactsController < ApplicationController 
  def new
    @contact = Contact.new
  end
  
  def create 
    @contact = Contact.new(contact_params)
    
    if @contact.save
      flash[:success] = "Details Submitted sucessfully"
      redirect_to new_contact_path
    else
      flash[:danger] = "Please check and try again!"
      redirect_to new_contact_path
    end
    
  end
  
  private
    def contact_params
      params.required(:contact).permit(:name, :email, :comments)
    end
end
