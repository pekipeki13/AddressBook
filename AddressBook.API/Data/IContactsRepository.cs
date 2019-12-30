using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AddressBook.API.Models;

namespace AddressBook.API.Controllers.Data
{
    public interface IContactsRepository
    {
        Task<List<Contacts>> GetContacts();
        Task<Contacts> GetContact(int? Id);
        Task<int> AddContact(Contacts contacts);
        Task<int> DeleteContact(int? Id);
        Task UpdateContact(Contacts contacts);
        Task<List<Contacts>> SearchContactAsync(string txt);

        Task<bool> UserExists(string firstname, string lastname); 
    }
}