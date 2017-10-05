ActiveAdmin.register Author do
  menu parent: 'CMS'
  permit_params :name, :description
end
