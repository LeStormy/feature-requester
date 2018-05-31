ActiveAdmin.register Board do

  permit_params :title, :description

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
    end

    f.actions

  end

end
