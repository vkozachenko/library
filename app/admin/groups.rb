ActiveAdmin.register Group do
  menu parent: 'CMS'
  permit_params :name, :description
end
