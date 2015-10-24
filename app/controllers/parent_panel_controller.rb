class ParentPanelController < ApplicationController
  expose(:family_members) { current_user.family.users.select { |user| user != current_user } }

end
