ActiveAdmin.register Board do

  permit_params :title, :description, :admin_user_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  form do |f|

    f.inputs "Board Details" do
      f.input :title
      f.input :description
      f.input :admin_user
    end

    f.actions

  end

end
