using david_rodriguez.Conectar;
using david_rodriguez.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace david_rodriguez.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EspecieController : ControllerBase
    {
        private readonly ConexionSQLServer context;
        public EspecieController(ConexionSQLServer context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Especie>>> GetEspecie()
        {
            return await context.Especie.ToListAsync();
        }

        // GET api/<EspecieController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Especie>> GetEspecie(int id)
        {
            var especie = await context.Especie.FindAsync(id);
            if (especie == null)
            {
                return NotFound();
            }
            return especie;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutEspecie(int id, Especie especie)
        {
            if (id != especie.id)
            {
                return BadRequest();
            }
            context.Entry(especie).State = EntityState.Modified;

            try
            {
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EspecieExists(id))
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

        // POST api/<EspecieController>
        [HttpPost]
        public async Task<ActionResult> PostEspecie(Especie especie)
        {
            context.Especie.Add(especie);
            await context.SaveChangesAsync();
            return CreatedAtAction("GetEspecie", new { id = especie.id }, especie);
        }

        // DELETE api/<EspecieController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Especie>> DeleteEspecie(int id)
        {
            var especie = await context.Especie.FindAsync(id);
            if (especie == null)
            {
                return NotFound();
            }
            context.Especie.Remove(especie);
            await context.SaveChangesAsync();
            return especie;
        }

        private bool EspecieExists(int id)
        {
            return context.Especie.Any(e => e.id == id);
        }
    }
}
