using AddressBook.API.Models;
using Microsoft.EntityFrameworkCore;

namespace AddressBook.API.Controllers.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base (options){}
        public DbSet<Contacts> Contacts { get; set; }
    }
}