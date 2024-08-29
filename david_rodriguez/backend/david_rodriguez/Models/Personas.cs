using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace david_rodriguez.Models
{
    public class Personas
    {
        public int id { get; set; }
        public string tipo_identificacion { get; set; }
        public string identificacion { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public float estatura { get; set; }
        public string nacionalidad { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string estado { get; set; }
    }
}
