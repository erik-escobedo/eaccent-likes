ActiveAdmin.register Like do
  permit_params :user_id, :post_id, :positive

  index do
    column :id
    column :positive
    column :post
    column :user
  end
end
