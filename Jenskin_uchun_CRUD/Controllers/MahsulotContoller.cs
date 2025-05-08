
using Jenskin_uchun_CRUD.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Jenskin_uchun_CRUD.Controllers;

[ApiController]
[Route("[controller]")]

public class MahsulotContoller  : ControllerBase
{

    private readonly AppDbContext _context;
    public MahsulotContoller(AppDbContext context)
    {
        _context = context;
    }
    // GET: api/Mahsulot
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Mahsulot>>> GetMahsulotlar()
    {
        return await _context.Mahsulotlar.ToListAsync();
    }
    // GET: api/Mahsulot/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Mahsulot>> GetMahsulot(int id)
    {
        var mahsulot = await _context.Mahsulotlar.FindAsync(id);
        if (mahsulot == null)
        {
            return NotFound();
        }
        return mahsulot;
    }
    // POST: api/Mahsulot
    [HttpPost]
    public async Task<ActionResult<Mahsulot>> PostMahsulot(Mahsulot mahsulot)
    {
        _context.Mahsulotlar.Add(mahsulot);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetMahsulot), new { id = mahsulot.Id }, mahsulot);
    }
    // PUT: api/Mahsulot/5
    [HttpPut("UPdate")]
    public async Task<ActionResult<Mahsulot>> PutMahsulot( Mahsulot mahsulot)
    {
  

        _context.Mahsulotlar.Update(mahsulot);
        await _context.SaveChangesAsync();
        return mahsulot;
    }

    // DELETE: api/Mahsulot/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteMahsulot(int id)
    {
        var mahsulot = await _context.Mahsulotlar.FindAsync(id);
        if (mahsulot == null)
        {
            return NotFound();
        }
        _context.Mahsulotlar.Remove(mahsulot);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
