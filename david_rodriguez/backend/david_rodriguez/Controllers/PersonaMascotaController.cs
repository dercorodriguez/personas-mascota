using david_rodriguez.Conectar;
using david_rodriguez.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace david_rodriguez.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonaMascotaController : ControllerBase
    {
        private readonly ConexionSQLServer context;
        public PersonaMascotaController(ConexionSQLServer context)
        {
            this.context = context;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<PersonaMascota>>> GetPersonaMascota()
        {
            return await context.PersonaMascota.ToListAsync();
        }

        // GET api/<PersonaMascotaController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PersonaMascota>> GetPersonaMascota(int id)
        {
            var PersonaMascota = await context.PersonaMascota.FindAsync(id);
            if (PersonaMascota == null)
            {
                return NotFound();
            }
            return PersonaMascota;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutPersonaMascota(int id, PersonaMascota personaMascota)
        {
            if (id != personaMascota.id)
            {
                return BadRequest();
            }
            context.Entry(personaMascota).State = EntityState.Modified;

            try
            {
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PersonaMascotaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return NoContent();
        }

        // POST api/<PersonaMascotaController>
        [HttpPost]
        public async Task<ActionResult> PostPersonaMascota(PersonaMascota personaMascota)
        {
            context.PersonaMascota.Add(personaMascota);
            await context.SaveChangesAsync();
            return CreatedAtAction("GetPersonaMascota", new { id = personaMascota.id }, personaMascota);
        }

        // DELETE api/<PersonaMascotaController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PersonaMascota>> DeletePersonaMascota(int id)
        {
            var personaMascota = await context.PersonaMascota.FindAsync(id);
            if (personaMascota == null)
            {
                return NotFound();
            }
            context.PersonaMascota.Remove(personaMascota);
            await context.SaveChangesAsync();
            return personaMascota;
        }

        private bool PersonaMascotaExists(int id)
        {
            return true;
            //return context.PersonaMascota.Any(e => e.Id == id);
        }
    }
}
