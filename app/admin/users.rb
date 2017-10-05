ActiveAdmin.register User do
  permit_params :name, :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
    end
  end
end
