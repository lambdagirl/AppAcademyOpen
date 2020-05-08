class House < ApplicationRecord
    #must have name
    # no two Houses with the same address

    validates :name, :address, presence:true

    has_many  :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name:  :Person

  end