ActiveAdmin.register Post do
  permit_params :user_id, :title

  index do
    column :id
    column :title
    column :user
    column :total_points
  end
end
