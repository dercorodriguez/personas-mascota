using david_rodriguez.Conectar;
using david_rodriguez.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace david_rodriguez.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MascotaController : ControllerBase
    {
        private readonly ConexionSQLServer context;
        public MascotaController(ConexionSQLServer context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Mascota>>> GetMascota()
        {
            return await context.Mascota.ToListAsync();
        }

        // GET api/<MascotaController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Mascota>> GetMascota(int id)
        {
            var mascota = await context.Mascota.FindAsync(id);
            if (mascota == null)
            {
                return NotFound();
            }
            return mascota;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutMascota(int id, Mascota mascota)
        {
            if (id != mascota.id)
            {
                return BadRequest();
            }
            context.Entry(mascota).State = EntityState.Modified;

            try
            {
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MascotaExists(id))
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

        // POST api/<MascotaController>
        [HttpPost]
        public async Task<ActionResult> PostMascota(Mascota mascota)
        {
            context.Mascota.Add(mascota);
            await context.SaveChangesAsync();
            return CreatedAtAction("GetMascota", new { id = mascota.id }, mascota);
        }

        // DELETE api/<MascotaController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Mascota>> DeleteMascota(int id)
        {
            var mascota = await context.Mascota.FindAsync(id);
            if (mascota == null)
            {
                return NotFound();
            }
            context.Mascota.Remove(mascota);
            await context.SaveChangesAsync();
            return mascota;
        }

        private bool MascotaExists(int id)
        {
            return true;
            // return context.Mascota.Any(e => e.id == id);
        }
    }
}
