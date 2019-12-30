using System;
using System.Threading.Tasks;
using AddressBook.API.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Collections.Generic;

namespace AddressBook.API.Controllers.Data
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        IContactsRepository contactsRepository;

        public ContactsController( IContactsRepository _contactsRepository)
        {
            contactsRepository = _contactsRepository;
        }

        //GET CONTACTS
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            try
            {
                var contacts = await contactsRepository.GetContacts();
                if (contacts == null)
                {
                    return NotFound();
                }

                return Ok(contacts);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        //SEARCH
        [HttpPost]
        [Route("Search/{txt}")]
        public async Task<IActionResult> Post(string txt) 
        {
            try
            {
                var contacts = await contactsRepository.SearchContactAsync(txt);
                if (contacts == null)
                {
                    return NotFound();
                }

                return Ok(contacts);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        //GET CONTACT
        [HttpGet]
        [Route("Details/{id:int}")]
        public async Task<IActionResult> GetContact(int? Id)
        {
            if (Id == null)
            {
                return BadRequest();
            }

            try
            {
                var contact = await contactsRepository.GetContact(Id);
                if (contact == null)
                {
                    return NotFound();
                }

                return Ok(contact);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        //UPDATE CONTACT
        [HttpPut]
        [Route("Edit")]
        public async Task<IActionResult> Update([FromBody]Contacts model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await contactsRepository.UpdateContact(model);
                    return Ok();
                }
                catch (Exception)
                {
                    return BadRequest();
                }
            }

            return BadRequest();
        }

        //CREATE CONTACT
        [HttpPost]
        [Route("Create")]
        public async Task<IActionResult> AddContact([FromBody]Contacts model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var Id = await contactsRepository.AddContact(model);
                    if (Id > 0)
                    {
                        return Ok(Id);
                    }
                    else
                    {
                        return NotFound();
                    }
                }
                catch (Exception)
                {
                    return BadRequest();
                }
            }
            return BadRequest();
        }

        //DELETE CONTACT
        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<IActionResult> DeleteContact(int? Id)
        {
            int result = 0;

            if (Id == null)
            {
                return BadRequest();
            }

            try
            {
                result = await contactsRepository.DeleteContact(Id);
                if (result == 0)
                {
                    return NotFound();
                }
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
