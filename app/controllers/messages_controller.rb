class MessagesController < ApplicationController

  authorize_resource

  def inbox
    
    @user_contact_list, @company_contact_list = current_agent.contact_list

  end

  def conversation
    unless params[:class] == "Company" 
      @other_user      = User.find params[:id]
    else
      @other_user      = Company.find params[:id]
    end

    @message_thread  = current_agent.messages_with_other params[:id],params[:class] 
    @new_message     = current_agent.messages_sent.new(recipient: @other_user)

    render :partial => 'conversation'
  end

  def create
    message = Message.create params[:message]
    if request.xhr?
      render :partial => 'message', locals: {:message => message}
    else
     redirect_to inbox_url
    end
  end

  def destroy
    Message.find(params[:id]).destroy
    if request.xhr?
      head :ok
    else
      redirect_to inbox_url
    end
  end

end