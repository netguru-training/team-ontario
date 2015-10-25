class RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.add_role :parent
    resource.update(family: Family.new(name: params[:family_name]))
  end
end
