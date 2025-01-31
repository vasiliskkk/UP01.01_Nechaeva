namespace UP01._01_Nechaeva.API
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    public partial class UpEntities : DbContext
    {
        private static UpEntities _context;
        public UpEntities()
            : base("name=UpEntities")
        {
        }
        public static UpEntities GetContext()
        {
            if (_context == null)
                _context = new UpEntities();
            return _context;
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
        public virtual DbSet<Advertisment> Advertisment { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}