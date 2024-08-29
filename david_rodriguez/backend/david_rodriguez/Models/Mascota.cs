namespace david_rodriguez.Models
{
    public class Mascota
    {
        public int id { get; set; }
        public int id_especie { get; set; }
        public int id_raza { get; set; }
        public string color { get; set; }
        public string nombre { get; set; }
        public bool publicar { get; set; }
        public string estado { get; set; }
    }
}
