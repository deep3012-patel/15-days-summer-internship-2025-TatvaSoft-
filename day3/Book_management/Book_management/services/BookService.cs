using Book_management.Models;


namespace Book_Management.Services
{
    public class BookService
    {
        private static List<Book> books = new List<Book>();

        public List<Book> GetBooks() => books;

        public Book GetBookById(int id) => books.FirstOrDefault(b => b.Id == id);

        public void AddBook(Book book)
        {
            book.Id = books.Count + 1;
            books.Add(book);
        }

        public int UpdateBook(Book book)
        {
            var existingBook = GetBookById(book.Id);
            if (existingBook == null) return -1;

            existingBook.Title = book.Title;
            existingBook.Author = book.Author;
            existingBook.Genre = book.Genre;

            return 1;
        }

        public int DeleteBook(int id)
        {
            var book = GetBookById(id);
            if (book == null) return -1;

            books.Remove(book);
            return 1;
        }
    }
}
