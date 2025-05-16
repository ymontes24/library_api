# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Limpiar la base de datos antes de sembrar nuevos datos
# PRECAUCIÓN: Esto elimina todos los datos existentes
puts "Limpiando base de datos..."
Loan.destroy_all
Book.destroy_all
Author.destroy_all
User.destroy_all

# Crear autores
puts "Creando autores..."
authors = [
  { name: 'Gabriel García Márquez', biography: 'Colombian novelist, short-story writer, screenwriter, and journalist', birth_date: '1927-03-06' },
  { name: 'J.K. Rowling', biography: 'British author, philanthropist, film producer, and screenwriter', birth_date: '1965-07-31' },
  { name: 'George Orwell', biography: 'English novelist, essayist, journalist, and critic', birth_date: '1903-06-25' }
]

created_authors = authors.map do |author_attrs|
  Author.create!(author_attrs)
end

# Crear libros
puts "Creando libros..."
books = [
  { title: 'One Hundred Years of Solitude', description: 'The multi-generational story of the Buendía family', published_date: '1967-05-30', isbn: '9780060531041', author: created_authors[0] },
  { title: 'Love in the Time of Cholera', description: 'A story about the endurance of love', published_date: '1985-03-10', isbn: '9780307389732', author: created_authors[0] },
  { title: 'Harry Potter and the Philosopher\'s Stone', description: 'The first novel in the Harry Potter series', published_date: '1997-06-26', isbn: '9780747532743', author: created_authors[1] },
  { title: '1984', description: 'A dystopian social science fiction novel', published_date: '1949-06-08', isbn: '9780451524935', author: created_authors[2] },
  { title: 'Animal Farm', description: 'An allegorical novella', published_date: '1945-08-17', isbn: '9780451526342', author: created_authors[2] }
]

created_books = books.map do |book_attrs|
  Book.create!(book_attrs)
end

# Crear usuarios (password es 'password')
puts "Creando usuarios..."
users = [
  { name: 'Admin User', email: 'admin@example.com', password: 'password', password_confirmation: 'password' },
  { name: 'Regular User', email: 'user@example.com', password: 'password', password_confirmation: 'password' }
]

created_users = users.map do |user_attrs|
  User.create!(user_attrs)
end

# Crear préstamos
puts "Creando préstamos..."
loans = [
  { user: created_users[1], book: created_books[0], checkout_date: '2023-01-15', return_date: '2023-02-15', returned: true },
  { user: created_users[1], book: created_books[2], checkout_date: '2023-03-01', return_date: '2023-04-01', returned: false }
]

loans.each do |loan_attrs|
  Loan.create!(loan_attrs)
end

puts "¡Datos sembrados exitosamente!"
puts "Autores creados: #{Author.count}"
puts "Libros creados: #{Book.count}"
puts "Usuarios creados: #{User.count}"
puts "Préstamos creados: #{Loan.count}"