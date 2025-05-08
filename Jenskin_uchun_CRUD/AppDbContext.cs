using Microsoft.EntityFrameworkCore;

namespace Jenskin_uchun_CRUD;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }
    public DbSet<Models.Mahsulot> Mahsulotlar { get; set; }
}

