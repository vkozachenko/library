ActiveAdmin.register Book do
  menu parent: 'CMS'
  permit_params :name, :description, :user, :draft, :cover

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :user
      f.input :draft
      f.input :cover
    end
    f.actions
  end
end
