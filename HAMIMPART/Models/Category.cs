using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class Category
    {
        public int CategoryId { set; get; }
        public string Name { set; get; }
        public virtual ICollection<SubCategory> SubCategories { set; get; }
        public ICollection<Product> Products { set; get; }
    }
}