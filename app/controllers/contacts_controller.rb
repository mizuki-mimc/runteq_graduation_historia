class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: "お問い合わせを受け付けました。ご連絡ありがとうございます。"
    else
      flash.now[:alert] = "入力内容に誤りがあります。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :category, :content)
  end
end
