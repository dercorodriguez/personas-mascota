using david_rodriguez.Conectar;
using david_rodriguez.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace david_rodriguez.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonasController : ControllerBase
    {
        private readonly ConexionSQLServer context;
        public PersonasController(ConexionSQLServer context)
        {
            this.context = context;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Personas>>> GetPersonas()
        {
            return await context.Personas.ToListAsync();
        }

        // GET api/<PersonasController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Personas>> GetPersonas(int id)
        {
            var personas = await context.Personas.FindAsync(id);
            if (personas == null)
            {
                return NotFound();
            }
            return personas;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutPersonas(int id, Personas personas)
        {
            if (id != personas.id)
            {
                return BadRequest();
            }
            context.Entry(personas).State = EntityState.Modified;

            try
            {
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PersonasExists(id))
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

        // POST api/<PersonasController>
        [HttpPost]
        public async Task<ActionResult> PostPersonas(Personas personas)
        {
            context.Personas.Add(personas);
            await context.SaveChangesAsync();
            return CreatedAtAction("GetPersonas", new { id = personas.id }, personas);
        }

        // DELETE api/<PersonasController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Personas>> DeletePersonas(int id)
        {
            var personas = await context.Personas.FindAsync(id);
            if (personas == null)
            {
                return NotFound();
            }
            context.Personas.Remove(personas);
            await context.SaveChangesAsync();
            return personas;
        }

        private bool PersonasExists(int id)
        {
            return context.Personas.Any(e => e.id == id);
        }

    }
}
