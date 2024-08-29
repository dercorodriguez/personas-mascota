using david_rodriguez.Models;
using Microsoft.EntityFrameworkCore;

namespace david_rodriguez.Conectar
{
    public class ConexionSQLServer : DbContext
    {
        public ConexionSQLServer(DbContextOptions<ConexionSQLServer> options) : base(options)
        {
        }
        public DbSet<Personas> Personas { get; set; }
        public DbSet<Especie> Especie { get; set; }
        public DbSet<Raza> Raza { get; set; }
        public DbSet<Mascota> Mascota { get; set; }
        public DbSet<PersonaMascota> PersonaMascota { get; set; }

    }

}
