using Book_management.Models;
using Book_Management.Services;
using Microsoft.AspNetCore.Mvc;


namespace Book_Management.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BookController : ControllerBase
    {
        private readonly BookService _bookService;

        public BookController(BookService bookService)
        {
            _bookService = bookService;
        }

        [HttpGet]
        public ActionResult<List<Book>> GetBooks()
        {
            var books = _bookService.GetBooks();
            if (books == null || books.Count == 0)
                return NotFound("No books found.");

            return Ok(books);
        }

        [HttpGet("{id}")]
        public ActionResult<Book> GetBook(int id)
        {
            var book = _bookService.GetBookById(id);
            if (book == null)
                return NotFound("Book not found.");

            return Ok(book);
        }

        [HttpPost]
        public IActionResult AddBook(Book book)
        {
            _bookService.AddBook(book);
            return Ok("Book added successfully.");
        }

        [HttpPut]
        public IActionResult UpdateBook(Book book)
        {
            var result = _bookService.UpdateBook(book);
            if (result == -1)
                return NotFound("Book not found for update.");

            return Ok("Book updated successfully.");
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBook(int id)
        {
            var result = _bookService.DeleteBook(id);
            if (result == -1)
                return NotFound("Book not found for deletion.");

            return Ok("Book deleted successfully.");
        }
    }
}
