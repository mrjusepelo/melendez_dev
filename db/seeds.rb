# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# #
#   cities = City.create([{ name: 'La Hormiga - Putumayo' }, { name: 'Mocoa - Putumayo' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# PaymentMode.create([{name: 'Diario'},{name: 'Semanal'}, {name: 'Quincenal'}, {name: 'Mensual'}, {name: 'Contado'}])
# # State.create([{name: 'Pagos Pendientes'},{name: 'Pagara Hoy'}, {name: 'Al dia'}, {name: 'Cancelado'}, {name: 'Aprobado'},{name: 'No definido'}, {name: 'No tiene pagos registrados'}, {name: 'Pagos Adelantados'}])

# # stateInventory esta oculto en el menu
# StateInventory.create([{name: 'Disponible'},
# 					   {name: 'Venta de Contado'}, 
# 					   {name: 'Venta de Credito'}, 
# 					   {name: 'Cancelado'}])





# State.create([{name: 'Pagos Pendientes'},
# 			  {name: 'Pagara Hoy'},
# 			  {name: 'Al dia'}, 
# 			  {name: 'Cancelado'}, 
# 			  {name: 'Aprobado'},
# 			  {name: 'Terminado'}, 
# 			  {name: 'No tiene pagos registrados'}, 
# 			  {name: 'Pagos Adelantados'}])

# # Product.create(name: "producto1", description: "producto sin iva", brand_id: 1)
# # Product.create(name: "Producto2", description: "producto con iva", brand_id: 1)
# AdminUser.update(1, role: "super")



# # Modo Prueba
# Brand.create([{name: "LG"}, {name: 'Sony'}, {name: 'Toshiba'}])
# Category.create([{name: "Tecnología"}, {name: 'Hogar'}, {name: 'Deporte'}])
# Product.create([{name: "Computador portatil"}, {name: 'Mueble sofacama'}, {name: 'Televisor LED 45"'}])
# Supplier.create([{name: "Nelson Eduardo Bustamante", phone: '314 724 2145 - (091) 617 82 23 - 582 33 71', email: 'nelson@gmail.com', city_id: 1 }])






AdminUser.update(1, role: "super")
