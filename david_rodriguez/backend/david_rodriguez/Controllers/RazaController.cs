using david_rodriguez.Conectar;
using david_rodriguez.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace david_rodriguez.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RazaController : ControllerBase
    {
        private readonly ConexionSQLServer context;
        public RazaController(ConexionSQLServer context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Raza>>> GetRaza()
        {
            return await context.Raza.ToListAsync();
        }

        // GET api/<RazaController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Raza>> GetRaza(int id)
        {
            var raza = await context.Raza.FindAsync(id);
            if (raza == null)
            {
                return NotFound();
            }
            return raza;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutRaza(int id, Raza raza)
        {
            if (id != raza.id)
            {
                return BadRequest();
            }
            context.Entry(raza).State = EntityState.Modified;

            try
            {
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RazaExists(id))
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

        // POST api/<RazaController>
        [HttpPost]
        public async Task<ActionResult> PostRaza(Raza raza)
        {
            context.Raza.Add(raza);
            await context.SaveChangesAsync();
            return CreatedAtAction("GetRaza", new { id = raza.id }, raza);
        }

        // DELETE api/<RazaController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Raza>> DeleteRaza(int id)
        {
            var raza = await context.Raza.FindAsync(id);
            if (raza == null)
            {
                return NotFound();
            }
            context.Raza.Remove(raza);
            await context.SaveChangesAsync();
            return raza;
        }

        private bool RazaExists(int id)
        {
            //return context.Raza.Any(e => e.);
            return true;
        }
    }
}
