ActiveAdmin.register Book do
  menu parent: 'CMS'
  permit_params :name, :description, :user, :draft, :cover
end
