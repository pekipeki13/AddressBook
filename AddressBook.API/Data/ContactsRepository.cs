using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AddressBook.API.Models;
using Microsoft.EntityFrameworkCore; 
using System;

namespace AddressBook.API.Controllers.Data
{
    public class ContactsRepository : IContactsRepository
    {
        private readonly DataContext _context;
        public ContactsRepository(DataContext context)
        {
             _context = context;
        }
        //GET CONTACTS
        public async Task<List<Contacts>> GetContacts()
        {
            if (_context != null)
            {
                return await _context.Contacts.ToListAsync();
            }
            return null;
        }
        //GET CONTACT
        public async Task<Contacts> GetContact(int? Id)
        {
            if (_context != null)
            {
                return await _context.Contacts.FirstOrDefaultAsync(x => x.Id == Id);
            }
            return null;
        }

        //CREATE CONTACT
        public async Task<int> AddContact(Contacts contacts)
        {
            if (_context != null)
            {
                await _context.Contacts.AddAsync(contacts);
                await _context.SaveChangesAsync();

                return contacts.Id;
            }

            return 0;
        }

        public async Task<List<Contacts>> SearchContactAsync(string txt){

            if (_context != null)
            {
                return await _context.Contacts.Where(x => x.FirstName.Contains(txt) || x.LastName.Contains(txt) ||
                        x.Address.Contains(txt) || x.Telephone.Contains(txt) || txt == null).ToListAsync();
            }
            return null;
        }

        //DELETE CONTACT
        public async Task<int> DeleteContact(int? Id)
        {
            int result = 0;

            if (_context != null)
            {
                var contact = await _context.Contacts.FirstOrDefaultAsync(x => x.Id == Id);

                if (contact != null)
                {
                    _context.Contacts.Remove(contact);
                    result = await _context.SaveChangesAsync();
                }
                return result;
            }

            return result;
        }

        //UPDATE CONTACT
        public async Task UpdateContact(Contacts contacts)
        {
            if (_context != null)
            {
                _context.Contacts.Update(contacts);
                await _context.SaveChangesAsync();
            }
        }
    }
}