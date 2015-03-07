using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class VaazarDbContext:DbContext
    {
        public VaazarDbContext():base("VazaarDbConnectionString")
        { }
        public DbSet<User> Users { set; get; }
        public DbSet<Product> Products { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<OrderedList> OrderedLists { get; set; }
    }
}