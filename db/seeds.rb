# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# PaymentMode.create([{name: 'Diario'},{name: 'Semanal'}, {name: 'Quincenal'}, {name: 'Mensual'}, {name: 'Contado'}])
# State.create([{name: 'Pagos Pendientes'},{name: 'Pagara Hoy'}, {name: 'Al dia'}, {name: 'Cancelado'}, {name: 'Aprobado'},{name: 'No definido'}, {name: 'No tiene pagos registrados'}, {name: 'Pagos Adelantados'}])

# stateInventory esta oculto en el menu
# StateInventory.create([{name: 'Disponible'},{name: 'Venta de Contado'}, {name: 'Venta de Credito'}, {name: 'Cancelado'}])





# State.create([{name: 'Pagos Pendientes'},{name: 'Pagara Hoy'}, {name: 'Al dia'}, {name: 'Cancelado'}, {name: 'Aprobado'},{name: 'Terminado'}, {name: 'No tiene pagos registrados'}, {name: 'Pagos Adelantados'}])

# Product.create(name: "producto1", description: "producto sin iva", brand_id: 1)
# Product.create(name: "Producto2", description: "producto con iva", brand_id: 1)
# Product.create(name: "patines", description: "", brand_id: 1)
AdminUser.update(1, role: "super")
