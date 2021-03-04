module ProductlistHelper

  def join_materials(materials)
    
    array = Array.new
    
    materials.each do |material|
      array.push(material.name)
    end
    material_join = array.join(',')

   

  end
end
